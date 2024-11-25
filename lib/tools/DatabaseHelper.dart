import 'dart:io';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // 获取应用程序文档目录
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, 'study_app.db');

    // 打开数据库
    final db = sqlite3.open(path);

    // 如果是首次创建，初始化表结构
    _createTables(db);

    return db;
  }

  void _createTables(Database db) {
    // 创建科目表
    db.execute('''
      CREATE TABLE IF NOT EXISTS subjects (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL
      )
    ''');

    // 创建题目表
    db.execute('''
      CREATE TABLE IF NOT EXISTS questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        subject_id INTEGER NOT NULL,
        type INTEGER NOT NULL,
        question_text TEXT NOT NULL,
        correct_answer TEXT NOT NULL,
        explanation TEXT,
        created_at INTEGER NOT NULL,
        updated_at INTEGER NOT NULL,
        FOREIGN KEY (subject_id) REFERENCES subjects(id)
      )
    ''');

    // 创建选项表
    db.execute('''
      CREATE TABLE IF NOT EXISTS options (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question_id INTEGER NOT NULL,
        option_text TEXT NOT NULL,
        option_order INTEGER NOT NULL,
        FOREIGN KEY (question_id) REFERENCES questions(id)
      )
    ''');

    // 创建学习记录表
    db.execute('''
      CREATE TABLE IF NOT EXISTS study_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question_id INTEGER NOT NULL,
        is_correct BOOLEAN NOT NULL,
        user_answer TEXT,
        study_time INTEGER NOT NULL,
        FOREIGN KEY (question_id) REFERENCES questions(id)
      )
    ''');

    // 创建索引
    db.execute(
        'CREATE INDEX IF NOT EXISTS idx_questions_subject_id ON questions(subject_id)');
    db.execute(
        'CREATE INDEX IF NOT EXISTS idx_options_question_id ON options(question_id)');
    db.execute(
        'CREATE INDEX IF NOT EXISTS idx_study_records_question_id ON study_records(question_id)');
  }

  // CRUD 操作示例

  // 插入科目
  Future<int> insertSubject(String name, String? description) async {
    final db = await database;
    final now = DateTime.now().millisecondsSinceEpoch;

    final stmt = db.prepare('''
      INSERT INTO subjects (name, description, created_at, updated_at)
      VALUES (?, ?, ?, ?)
    ''');

    stmt.execute([name, description, now, now]);
    final id = db.lastInsertRowId;
    stmt.dispose();

    return id;
  }

  // 获取所有科目
  Future<List<Map<String, dynamic>>> getAllSubjects() async {
    final db = await database;
    final ResultSet resultSet =
        db.select('SELECT * FROM subjects ORDER BY created_at DESC');
    return resultSet
        .map((row) => {
              'id': row['id'],
              'name': row['name'],
              'description': row['description'],
              'created_at': row['created_at'],
              'updated_at': row['updated_at'],
            })
        .toList();
  }

  // 获取特定科目的题目（分页）
  Future<List<Map<String, dynamic>>> getQuestionsBySubject(
    int subjectId, {
    int limit = 20,
    int offset = 0,
  }) async {
    final db = await database;
    final stmt = db.prepare('''
      SELECT * FROM questions 
      WHERE subject_id = ? 
      LIMIT ? OFFSET ?
    ''');

    final ResultSet resultSet = stmt.select([subjectId, limit, offset]);
    stmt.dispose();

    return resultSet
        .map((row) => {
              'id': row['id'],
              'subject_id': row['subject_id'],
              'type': row['type'],
              'question_text': row['question_text'],
              'correct_answer': row['correct_answer'],
              'explanation': row['explanation'],
              'created_at': row['created_at'],
              'updated_at': row['updated_at'],
            })
        .toList();
  }

  // 删除整个数据库文件
  Future<void> deleteDatabase() async {
    // 先关闭数据库连接
    if (_database != null) {
      _database!.dispose();
      _database = null;
    }

    // 获取数据库文件路径
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, 'study_app.db');

    // 删除文件
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }

  // 清空所有表的数据，但保留表结构
  Future<void> clearAllTables() async {
    final db = await database;

    // 使用事务来确保原子性
    db.execute('BEGIN TRANSACTION');

    try {
      // 清空所有表
      db.execute('DELETE FROM study_records');
      db.execute('DELETE FROM options');
      db.execute('DELETE FROM questions');
      db.execute('DELETE FROM subjects');

      // 重置自增ID
      db.execute('DELETE FROM sqlite_sequence');

      db.execute('COMMIT');
    } catch (e) {
      // 如果出错，回滚事务
      db.execute('ROLLBACK');
      throw e;
    }
  }

  // 清空特定表的数据
  Future<void> clearTable(String tableName) async {
    final db = await database;

    // 验证表名以防止 SQL 注入
    final validTables = ['subjects', 'questions', 'options', 'study_records'];
    if (!validTables.contains(tableName)) {
      throw ArgumentError('Invalid table name');
    }

    db.execute('BEGIN TRANSACTION');

    try {
      // 清空指定表
      db.execute('DELETE FROM $tableName');
      // 重置该表的自增ID
      db.execute("DELETE FROM sqlite_sequence WHERE name='$tableName'");

      db.execute('COMMIT');
    } catch (e) {
      db.execute('ROLLBACK');
      throw e;
    }
  }

  // 删除特定科目及其相关数据
  Future<void> deleteSubject(int subjectId) async {
    final db = await database;

    db.execute('BEGIN TRANSACTION');

    try {
      // 按照外键关系的顺序删除数据
      // 1. 删除学习记录
      db.execute('''
        DELETE FROM study_records 
        WHERE question_id IN (
          SELECT id FROM questions WHERE subject_id = ?
        )
      ''', [subjectId]);

      // 2. 删除选项
      db.execute('''
        DELETE FROM options 
        WHERE question_id IN (
          SELECT id FROM questions WHERE subject_id = ?
        )
      ''', [subjectId]);

      // 3. 删除题目
      db.execute('DELETE FROM questions WHERE subject_id = ?', [subjectId]);

      // 4. 删除科目
      db.execute('DELETE FROM subjects WHERE id = ?', [subjectId]);

      db.execute('COMMIT');
    } catch (e) {
      db.execute('ROLLBACK');
      throw e;
    }
  }

  // 关闭数据库
  Future<void> close() async {
    final db = await database;
    db.dispose();
    print("数据库关闭");
    _database = null;
  }
}
