import 'dart:ffi';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:my_app/pages/question-page/tables/tables.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'database.g.dart';

@DriftDatabase(
    tables: [Questions, UserAnswers, ErrorStatistics, DailyStatistics])
class QuizDatabase extends _$QuizDatabase {
  QuizDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // 添加新题目 重新变异
  Future<int> addQuestion(QuestionsCompanion question) {
    return into(questions).insert(question);
  }

  // 记录用户答题
  Future<void> recordUserAnswer(UserAnswersCompanion answer) async {
    await into(userAnswers).insert(answer);

    // 如果答错了，更新错题统计
    if (!answer.isCorrect.value) {
      await _updateErrorStatistics(answer.questionId.value);
    }

    // 更新每日统计
    await _updateDailyStatistics(
        answer.questionId.value, answer.isCorrect.value);
  }

  // 更新错题统计
  Future<void> _updateErrorStatistics(int questionId) async {
    final existingStats = await (select(errorStatistics)
          ..where((t) => t.questionId.equals(questionId)))
        .getSingleOrNull();

    if (existingStats != null) {
      await (update(errorStatistics)
            ..where((t) => t.questionId.equals(questionId)))
          .write(ErrorStatisticsCompanion(
        errorCount: Value(existingStats.errorCount + 1),
        lastErrorAt: Value(DateTime.now()),
      ));
    } else {
      await into(errorStatistics).insert(
        ErrorStatisticsCompanion.insert(
          questionId: questionId,
          errorCount: const Value(1),
          lastErrorAt: DateTime.now(),
        ),
      );
    }
  }

  // 更新每日统计
  Future<void> _updateDailyStatistics(int questionId, bool isCorrect) async {
    final today = DateTime.now();
    final dateOnly = DateTime(today.year, today.month, today.day);

    final question = await (select(questions)
          ..where((t) => t.id.equals(questionId)))
        .getSingle();
    final existingStats = await (select(dailyStatistics)
          ..where((t) => t.date.equals(dateOnly)))
        .getSingleOrNull();

    if (existingStats != null) {
      var companion = DailyStatisticsCompanion(
        totalQuestions: Value(existingStats.totalQuestions + 1),
      );

      if (isCorrect) {
        companion = companion.copyWith(
          correctCount: Value(existingStats.correctCount + 1),
        );
      } else {
        switch (question.questionType) {
          case QuestionTypeDb.multipleChoice:
            companion = companion.copyWith(
              multipleChoiceErrors:
                  Value(existingStats.multipleChoiceErrors + 1),
            );
            break;
          case QuestionTypeDb.trueFalse:
            companion = companion.copyWith(
              trueFalseErrors: Value(existingStats.trueFalseErrors + 1),
            );
            break;
          case QuestionTypeDb.shortAnswer:
            companion = companion.copyWith(
              shortAnswerErrors: Value(existingStats.shortAnswerErrors + 1),
            );
            break;
        }
      }

      await (update(dailyStatistics)..where((t) => t.date.equals(dateOnly)))
          .write(companion);
    } else {
      var companion = DailyStatisticsCompanion.insert(
        date: dateOnly,
        totalQuestions: const Value(1),
        correctCount: Value(isCorrect ? 1 : 0),
      );

      if (!isCorrect) {
        switch (question.questionType) {
          case QuestionTypeDb.multipleChoice:
            companion = companion.copyWith(
              multipleChoiceErrors: const Value(1),
            );
            break;
          case QuestionTypeDb.trueFalse:
            companion = companion.copyWith(
              trueFalseErrors: const Value(1),
            );
            break;
          case QuestionTypeDb.shortAnswer:
            companion = companion.copyWith(
              shortAnswerErrors: const Value(1),
            );
            break;
        }
      }

      await into(dailyStatistics).insert(companion);
    }
  }

  // 获取错题列表
  Future<List<Question>> getErrorQuestions() {
    return (select(questions)
          ..join([
            innerJoin(errorStatistics,
                errorStatistics.questionId.equalsExp(questions.id))
          ])
          ..orderBy([(t) => OrderingTerm.desc(errorStatistics.lastErrorAt)]))
        .get();
  }

  // 获取每日统计
  Future<DailyStatistic> getDailyStatistics(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return (select(dailyStatistics)..where((t) => t.date.equals(dateOnly)))
        .getSingle();
  }

  // 获取指定时间范围的统计
  Future<List<DailyStatistic>> getStatisticsRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    return (select(dailyStatistics)
          ..where((t) => t.date.isBetweenValues(startDate, endDate))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
  }

  // 标记错题已复习
  Future<void> markQuestionReviewed(int questionId) {
    return (update(errorStatistics)
          ..where((t) => t.questionId.equals(questionId)))
        .write(ErrorStatisticsCompanion(
      lastReviewAt: Value(DateTime.now()),
    ));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'quiz.sqlite'));
    return NativeDatabase(file);
  });
}
