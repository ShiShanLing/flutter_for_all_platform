// 定义所有表结构
import 'package:drift/drift.dart';

// 题目类型枚举
enum QuestionTypeDb { multipleChoice, trueFalse, shortAnswer }

// 难度等级枚举
enum DifficultyLevel { easy, medium, hard }

// 题目表
class Questions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get questionText => text()();
  IntColumn get questionType => intEnum<QuestionTypeDb>()();
  TextColumn get correctAnswer => text()();
  TextColumn get choices => text().nullable()(); // JSON字符串存储选项
  TextColumn get explanation => text().nullable()();
  IntColumn get difficultyLevel => intEnum<DifficultyLevel>().nullable()();
  IntColumn get expectedTimeSeconds => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// 用户答题记录表
class UserAnswers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get questionId => integer().references(Questions, #id)();
  TextColumn get userAnswer => text()();
  BoolColumn get isCorrect => boolean()();
  IntColumn get timeSpentSeconds => integer()();
  DateTimeColumn get answeredAt => dateTime().withDefault(currentDateAndTime)();
}

// 每日统计表
class DailyStatistics extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get totalQuestions => integer().withDefault(const Constant(0))();
  IntColumn get correctCount => integer().withDefault(const Constant(0))();
  IntColumn get totalTimeSeconds => integer().withDefault(const Constant(0))();
  RealColumn get averageAccuracy => real().withDefault(const Constant(0))();
  IntColumn get multipleChoiceErrors =>
      integer().withDefault(const Constant(0))();
  IntColumn get trueFalseErrors => integer().withDefault(const Constant(0))();
  IntColumn get shortAnswerErrors => integer().withDefault(const Constant(0))();
}

// 错题统计表
class ErrorStatistics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get questionId => integer().references(Questions, #id)();
  IntColumn get errorCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastErrorAt => dateTime()();
  DateTimeColumn get lastReviewAt => dateTime().nullable()();
}
