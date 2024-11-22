// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _questionTextMeta =
      const VerificationMeta('questionText');
  @override
  late final GeneratedColumn<String> questionText = GeneratedColumn<String>(
      'question_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionTypeMeta =
      const VerificationMeta('questionType');
  @override
  late final GeneratedColumnWithTypeConverter<QuestionTypeDb, int>
      questionType = GeneratedColumn<int>('question_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<QuestionTypeDb>(
              $QuestionsTable.$converterquestionType);
  static const VerificationMeta _correctAnswerMeta =
      const VerificationMeta('correctAnswer');
  @override
  late final GeneratedColumn<String> correctAnswer = GeneratedColumn<String>(
      'correct_answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _choicesMeta =
      const VerificationMeta('choices');
  @override
  late final GeneratedColumn<String> choices = GeneratedColumn<String>(
      'choices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _explanationMeta =
      const VerificationMeta('explanation');
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
      'explanation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _difficultyLevelMeta =
      const VerificationMeta('difficultyLevel');
  @override
  late final GeneratedColumnWithTypeConverter<DifficultyLevel?, int>
      difficultyLevel = GeneratedColumn<int>(
              'difficulty_level', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<DifficultyLevel?>(
              $QuestionsTable.$converterdifficultyLeveln);
  static const VerificationMeta _expectedTimeSecondsMeta =
      const VerificationMeta('expectedTimeSeconds');
  @override
  late final GeneratedColumn<int> expectedTimeSeconds = GeneratedColumn<int>(
      'expected_time_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        questionText,
        questionType,
        correctAnswer,
        choices,
        explanation,
        difficultyLevel,
        expectedTimeSeconds,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questions';
  @override
  VerificationContext validateIntegrity(Insertable<Question> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question_text')) {
      context.handle(
          _questionTextMeta,
          questionText.isAcceptableOrUnknown(
              data['question_text']!, _questionTextMeta));
    } else if (isInserting) {
      context.missing(_questionTextMeta);
    }
    context.handle(_questionTypeMeta, const VerificationResult.success());
    if (data.containsKey('correct_answer')) {
      context.handle(
          _correctAnswerMeta,
          correctAnswer.isAcceptableOrUnknown(
              data['correct_answer']!, _correctAnswerMeta));
    } else if (isInserting) {
      context.missing(_correctAnswerMeta);
    }
    if (data.containsKey('choices')) {
      context.handle(_choicesMeta,
          choices.isAcceptableOrUnknown(data['choices']!, _choicesMeta));
    }
    if (data.containsKey('explanation')) {
      context.handle(
          _explanationMeta,
          explanation.isAcceptableOrUnknown(
              data['explanation']!, _explanationMeta));
    }
    context.handle(_difficultyLevelMeta, const VerificationResult.success());
    if (data.containsKey('expected_time_seconds')) {
      context.handle(
          _expectedTimeSecondsMeta,
          expectedTimeSeconds.isAcceptableOrUnknown(
              data['expected_time_seconds']!, _expectedTimeSecondsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      questionText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question_text'])!,
      questionType: $QuestionsTable.$converterquestionType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}question_type'])!),
      correctAnswer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}correct_answer'])!,
      choices: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}choices']),
      explanation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}explanation']),
      difficultyLevel: $QuestionsTable.$converterdifficultyLeveln.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}difficulty_level'])),
      expectedTimeSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}expected_time_seconds']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<QuestionTypeDb, int, int> $converterquestionType =
      const EnumIndexConverter<QuestionTypeDb>(QuestionTypeDb.values);
  static JsonTypeConverter2<DifficultyLevel, int, int>
      $converterdifficultyLevel =
      const EnumIndexConverter<DifficultyLevel>(DifficultyLevel.values);
  static JsonTypeConverter2<DifficultyLevel?, int?, int?>
      $converterdifficultyLeveln =
      JsonTypeConverter2.asNullable($converterdifficultyLevel);
}

class Question extends DataClass implements Insertable<Question> {
  final int id;
  final String questionText;
  final QuestionTypeDb questionType;
  final String correctAnswer;
  final String? choices;
  final String? explanation;
  final DifficultyLevel? difficultyLevel;
  final int? expectedTimeSeconds;
  final DateTime createdAt;
  const Question(
      {required this.id,
      required this.questionText,
      required this.questionType,
      required this.correctAnswer,
      this.choices,
      this.explanation,
      this.difficultyLevel,
      this.expectedTimeSeconds,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question_text'] = Variable<String>(questionText);
    {
      map['question_type'] = Variable<int>(
          $QuestionsTable.$converterquestionType.toSql(questionType));
    }
    map['correct_answer'] = Variable<String>(correctAnswer);
    if (!nullToAbsent || choices != null) {
      map['choices'] = Variable<String>(choices);
    }
    if (!nullToAbsent || explanation != null) {
      map['explanation'] = Variable<String>(explanation);
    }
    if (!nullToAbsent || difficultyLevel != null) {
      map['difficulty_level'] = Variable<int>(
          $QuestionsTable.$converterdifficultyLeveln.toSql(difficultyLevel));
    }
    if (!nullToAbsent || expectedTimeSeconds != null) {
      map['expected_time_seconds'] = Variable<int>(expectedTimeSeconds);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      questionText: Value(questionText),
      questionType: Value(questionType),
      correctAnswer: Value(correctAnswer),
      choices: choices == null && nullToAbsent
          ? const Value.absent()
          : Value(choices),
      explanation: explanation == null && nullToAbsent
          ? const Value.absent()
          : Value(explanation),
      difficultyLevel: difficultyLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(difficultyLevel),
      expectedTimeSeconds: expectedTimeSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedTimeSeconds),
      createdAt: Value(createdAt),
    );
  }

  factory Question.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Question(
      id: serializer.fromJson<int>(json['id']),
      questionText: serializer.fromJson<String>(json['questionText']),
      questionType: $QuestionsTable.$converterquestionType
          .fromJson(serializer.fromJson<int>(json['questionType'])),
      correctAnswer: serializer.fromJson<String>(json['correctAnswer']),
      choices: serializer.fromJson<String?>(json['choices']),
      explanation: serializer.fromJson<String?>(json['explanation']),
      difficultyLevel: $QuestionsTable.$converterdifficultyLeveln
          .fromJson(serializer.fromJson<int?>(json['difficultyLevel'])),
      expectedTimeSeconds:
          serializer.fromJson<int?>(json['expectedTimeSeconds']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'questionText': serializer.toJson<String>(questionText),
      'questionType': serializer.toJson<int>(
          $QuestionsTable.$converterquestionType.toJson(questionType)),
      'correctAnswer': serializer.toJson<String>(correctAnswer),
      'choices': serializer.toJson<String?>(choices),
      'explanation': serializer.toJson<String?>(explanation),
      'difficultyLevel': serializer.toJson<int?>(
          $QuestionsTable.$converterdifficultyLeveln.toJson(difficultyLevel)),
      'expectedTimeSeconds': serializer.toJson<int?>(expectedTimeSeconds),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Question copyWith(
          {int? id,
          String? questionText,
          QuestionTypeDb? questionType,
          String? correctAnswer,
          Value<String?> choices = const Value.absent(),
          Value<String?> explanation = const Value.absent(),
          Value<DifficultyLevel?> difficultyLevel = const Value.absent(),
          Value<int?> expectedTimeSeconds = const Value.absent(),
          DateTime? createdAt}) =>
      Question(
        id: id ?? this.id,
        questionText: questionText ?? this.questionText,
        questionType: questionType ?? this.questionType,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        choices: choices.present ? choices.value : this.choices,
        explanation: explanation.present ? explanation.value : this.explanation,
        difficultyLevel: difficultyLevel.present
            ? difficultyLevel.value
            : this.difficultyLevel,
        expectedTimeSeconds: expectedTimeSeconds.present
            ? expectedTimeSeconds.value
            : this.expectedTimeSeconds,
        createdAt: createdAt ?? this.createdAt,
      );
  Question copyWithCompanion(QuestionsCompanion data) {
    return Question(
      id: data.id.present ? data.id.value : this.id,
      questionText: data.questionText.present
          ? data.questionText.value
          : this.questionText,
      questionType: data.questionType.present
          ? data.questionType.value
          : this.questionType,
      correctAnswer: data.correctAnswer.present
          ? data.correctAnswer.value
          : this.correctAnswer,
      choices: data.choices.present ? data.choices.value : this.choices,
      explanation:
          data.explanation.present ? data.explanation.value : this.explanation,
      difficultyLevel: data.difficultyLevel.present
          ? data.difficultyLevel.value
          : this.difficultyLevel,
      expectedTimeSeconds: data.expectedTimeSeconds.present
          ? data.expectedTimeSeconds.value
          : this.expectedTimeSeconds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('id: $id, ')
          ..write('questionText: $questionText, ')
          ..write('questionType: $questionType, ')
          ..write('correctAnswer: $correctAnswer, ')
          ..write('choices: $choices, ')
          ..write('explanation: $explanation, ')
          ..write('difficultyLevel: $difficultyLevel, ')
          ..write('expectedTimeSeconds: $expectedTimeSeconds, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, questionText, questionType, correctAnswer,
      choices, explanation, difficultyLevel, expectedTimeSeconds, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == this.id &&
          other.questionText == this.questionText &&
          other.questionType == this.questionType &&
          other.correctAnswer == this.correctAnswer &&
          other.choices == this.choices &&
          other.explanation == this.explanation &&
          other.difficultyLevel == this.difficultyLevel &&
          other.expectedTimeSeconds == this.expectedTimeSeconds &&
          other.createdAt == this.createdAt);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<int> id;
  final Value<String> questionText;
  final Value<QuestionTypeDb> questionType;
  final Value<String> correctAnswer;
  final Value<String?> choices;
  final Value<String?> explanation;
  final Value<DifficultyLevel?> difficultyLevel;
  final Value<int?> expectedTimeSeconds;
  final Value<DateTime> createdAt;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.questionText = const Value.absent(),
    this.questionType = const Value.absent(),
    this.correctAnswer = const Value.absent(),
    this.choices = const Value.absent(),
    this.explanation = const Value.absent(),
    this.difficultyLevel = const Value.absent(),
    this.expectedTimeSeconds = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  QuestionsCompanion.insert({
    this.id = const Value.absent(),
    required String questionText,
    required QuestionTypeDb questionType,
    required String correctAnswer,
    this.choices = const Value.absent(),
    this.explanation = const Value.absent(),
    this.difficultyLevel = const Value.absent(),
    this.expectedTimeSeconds = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : questionText = Value(questionText),
        questionType = Value(questionType),
        correctAnswer = Value(correctAnswer);
  static Insertable<Question> custom({
    Expression<int>? id,
    Expression<String>? questionText,
    Expression<int>? questionType,
    Expression<String>? correctAnswer,
    Expression<String>? choices,
    Expression<String>? explanation,
    Expression<int>? difficultyLevel,
    Expression<int>? expectedTimeSeconds,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questionText != null) 'question_text': questionText,
      if (questionType != null) 'question_type': questionType,
      if (correctAnswer != null) 'correct_answer': correctAnswer,
      if (choices != null) 'choices': choices,
      if (explanation != null) 'explanation': explanation,
      if (difficultyLevel != null) 'difficulty_level': difficultyLevel,
      if (expectedTimeSeconds != null)
        'expected_time_seconds': expectedTimeSeconds,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  QuestionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? questionText,
      Value<QuestionTypeDb>? questionType,
      Value<String>? correctAnswer,
      Value<String?>? choices,
      Value<String?>? explanation,
      Value<DifficultyLevel?>? difficultyLevel,
      Value<int?>? expectedTimeSeconds,
      Value<DateTime>? createdAt}) {
    return QuestionsCompanion(
      id: id ?? this.id,
      questionText: questionText ?? this.questionText,
      questionType: questionType ?? this.questionType,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      choices: choices ?? this.choices,
      explanation: explanation ?? this.explanation,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      expectedTimeSeconds: expectedTimeSeconds ?? this.expectedTimeSeconds,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (questionText.present) {
      map['question_text'] = Variable<String>(questionText.value);
    }
    if (questionType.present) {
      map['question_type'] = Variable<int>(
          $QuestionsTable.$converterquestionType.toSql(questionType.value));
    }
    if (correctAnswer.present) {
      map['correct_answer'] = Variable<String>(correctAnswer.value);
    }
    if (choices.present) {
      map['choices'] = Variable<String>(choices.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (difficultyLevel.present) {
      map['difficulty_level'] = Variable<int>($QuestionsTable
          .$converterdifficultyLeveln
          .toSql(difficultyLevel.value));
    }
    if (expectedTimeSeconds.present) {
      map['expected_time_seconds'] = Variable<int>(expectedTimeSeconds.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('questionText: $questionText, ')
          ..write('questionType: $questionType, ')
          ..write('correctAnswer: $correctAnswer, ')
          ..write('choices: $choices, ')
          ..write('explanation: $explanation, ')
          ..write('difficultyLevel: $difficultyLevel, ')
          ..write('expectedTimeSeconds: $expectedTimeSeconds, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UserAnswersTable extends UserAnswers
    with TableInfo<$UserAnswersTable, UserAnswer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserAnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _questionIdMeta =
      const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
      'question_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES questions (id)'));
  static const VerificationMeta _userAnswerMeta =
      const VerificationMeta('userAnswer');
  @override
  late final GeneratedColumn<String> userAnswer = GeneratedColumn<String>(
      'user_answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCorrectMeta =
      const VerificationMeta('isCorrect');
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
      'is_correct', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_correct" IN (0, 1))'));
  static const VerificationMeta _timeSpentSecondsMeta =
      const VerificationMeta('timeSpentSeconds');
  @override
  late final GeneratedColumn<int> timeSpentSeconds = GeneratedColumn<int>(
      'time_spent_seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _answeredAtMeta =
      const VerificationMeta('answeredAt');
  @override
  late final GeneratedColumn<DateTime> answeredAt = GeneratedColumn<DateTime>(
      'answered_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, questionId, userAnswer, isCorrect, timeSpentSeconds, answeredAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_answers';
  @override
  VerificationContext validateIntegrity(Insertable<UserAnswer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('user_answer')) {
      context.handle(
          _userAnswerMeta,
          userAnswer.isAcceptableOrUnknown(
              data['user_answer']!, _userAnswerMeta));
    } else if (isInserting) {
      context.missing(_userAnswerMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(_isCorrectMeta,
          isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta));
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    if (data.containsKey('time_spent_seconds')) {
      context.handle(
          _timeSpentSecondsMeta,
          timeSpentSeconds.isAcceptableOrUnknown(
              data['time_spent_seconds']!, _timeSpentSecondsMeta));
    } else if (isInserting) {
      context.missing(_timeSpentSecondsMeta);
    }
    if (data.containsKey('answered_at')) {
      context.handle(
          _answeredAtMeta,
          answeredAt.isAcceptableOrUnknown(
              data['answered_at']!, _answeredAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserAnswer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAnswer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      questionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}question_id'])!,
      userAnswer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_answer'])!,
      isCorrect: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_correct'])!,
      timeSpentSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}time_spent_seconds'])!,
      answeredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}answered_at'])!,
    );
  }

  @override
  $UserAnswersTable createAlias(String alias) {
    return $UserAnswersTable(attachedDatabase, alias);
  }
}

class UserAnswer extends DataClass implements Insertable<UserAnswer> {
  final int id;
  final int questionId;
  final String userAnswer;
  final bool isCorrect;
  final int timeSpentSeconds;
  final DateTime answeredAt;
  const UserAnswer(
      {required this.id,
      required this.questionId,
      required this.userAnswer,
      required this.isCorrect,
      required this.timeSpentSeconds,
      required this.answeredAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question_id'] = Variable<int>(questionId);
    map['user_answer'] = Variable<String>(userAnswer);
    map['is_correct'] = Variable<bool>(isCorrect);
    map['time_spent_seconds'] = Variable<int>(timeSpentSeconds);
    map['answered_at'] = Variable<DateTime>(answeredAt);
    return map;
  }

  UserAnswersCompanion toCompanion(bool nullToAbsent) {
    return UserAnswersCompanion(
      id: Value(id),
      questionId: Value(questionId),
      userAnswer: Value(userAnswer),
      isCorrect: Value(isCorrect),
      timeSpentSeconds: Value(timeSpentSeconds),
      answeredAt: Value(answeredAt),
    );
  }

  factory UserAnswer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAnswer(
      id: serializer.fromJson<int>(json['id']),
      questionId: serializer.fromJson<int>(json['questionId']),
      userAnswer: serializer.fromJson<String>(json['userAnswer']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
      timeSpentSeconds: serializer.fromJson<int>(json['timeSpentSeconds']),
      answeredAt: serializer.fromJson<DateTime>(json['answeredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'questionId': serializer.toJson<int>(questionId),
      'userAnswer': serializer.toJson<String>(userAnswer),
      'isCorrect': serializer.toJson<bool>(isCorrect),
      'timeSpentSeconds': serializer.toJson<int>(timeSpentSeconds),
      'answeredAt': serializer.toJson<DateTime>(answeredAt),
    };
  }

  UserAnswer copyWith(
          {int? id,
          int? questionId,
          String? userAnswer,
          bool? isCorrect,
          int? timeSpentSeconds,
          DateTime? answeredAt}) =>
      UserAnswer(
        id: id ?? this.id,
        questionId: questionId ?? this.questionId,
        userAnswer: userAnswer ?? this.userAnswer,
        isCorrect: isCorrect ?? this.isCorrect,
        timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
        answeredAt: answeredAt ?? this.answeredAt,
      );
  UserAnswer copyWithCompanion(UserAnswersCompanion data) {
    return UserAnswer(
      id: data.id.present ? data.id.value : this.id,
      questionId:
          data.questionId.present ? data.questionId.value : this.questionId,
      userAnswer:
          data.userAnswer.present ? data.userAnswer.value : this.userAnswer,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      timeSpentSeconds: data.timeSpentSeconds.present
          ? data.timeSpentSeconds.value
          : this.timeSpentSeconds,
      answeredAt:
          data.answeredAt.present ? data.answeredAt.value : this.answeredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserAnswer(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('userAnswer: $userAnswer, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('timeSpentSeconds: $timeSpentSeconds, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, questionId, userAnswer, isCorrect, timeSpentSeconds, answeredAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAnswer &&
          other.id == this.id &&
          other.questionId == this.questionId &&
          other.userAnswer == this.userAnswer &&
          other.isCorrect == this.isCorrect &&
          other.timeSpentSeconds == this.timeSpentSeconds &&
          other.answeredAt == this.answeredAt);
}

class UserAnswersCompanion extends UpdateCompanion<UserAnswer> {
  final Value<int> id;
  final Value<int> questionId;
  final Value<String> userAnswer;
  final Value<bool> isCorrect;
  final Value<int> timeSpentSeconds;
  final Value<DateTime> answeredAt;
  const UserAnswersCompanion({
    this.id = const Value.absent(),
    this.questionId = const Value.absent(),
    this.userAnswer = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.timeSpentSeconds = const Value.absent(),
    this.answeredAt = const Value.absent(),
  });
  UserAnswersCompanion.insert({
    this.id = const Value.absent(),
    required int questionId,
    required String userAnswer,
    required bool isCorrect,
    required int timeSpentSeconds,
    this.answeredAt = const Value.absent(),
  })  : questionId = Value(questionId),
        userAnswer = Value(userAnswer),
        isCorrect = Value(isCorrect),
        timeSpentSeconds = Value(timeSpentSeconds);
  static Insertable<UserAnswer> custom({
    Expression<int>? id,
    Expression<int>? questionId,
    Expression<String>? userAnswer,
    Expression<bool>? isCorrect,
    Expression<int>? timeSpentSeconds,
    Expression<DateTime>? answeredAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questionId != null) 'question_id': questionId,
      if (userAnswer != null) 'user_answer': userAnswer,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (timeSpentSeconds != null) 'time_spent_seconds': timeSpentSeconds,
      if (answeredAt != null) 'answered_at': answeredAt,
    });
  }

  UserAnswersCompanion copyWith(
      {Value<int>? id,
      Value<int>? questionId,
      Value<String>? userAnswer,
      Value<bool>? isCorrect,
      Value<int>? timeSpentSeconds,
      Value<DateTime>? answeredAt}) {
    return UserAnswersCompanion(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      userAnswer: userAnswer ?? this.userAnswer,
      isCorrect: isCorrect ?? this.isCorrect,
      timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
      answeredAt: answeredAt ?? this.answeredAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (userAnswer.present) {
      map['user_answer'] = Variable<String>(userAnswer.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (timeSpentSeconds.present) {
      map['time_spent_seconds'] = Variable<int>(timeSpentSeconds.value);
    }
    if (answeredAt.present) {
      map['answered_at'] = Variable<DateTime>(answeredAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserAnswersCompanion(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('userAnswer: $userAnswer, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('timeSpentSeconds: $timeSpentSeconds, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }
}

class $ErrorStatisticsTable extends ErrorStatistics
    with TableInfo<$ErrorStatisticsTable, ErrorStatistic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ErrorStatisticsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _questionIdMeta =
      const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
      'question_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES questions (id)'));
  static const VerificationMeta _errorCountMeta =
      const VerificationMeta('errorCount');
  @override
  late final GeneratedColumn<int> errorCount = GeneratedColumn<int>(
      'error_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastErrorAtMeta =
      const VerificationMeta('lastErrorAt');
  @override
  late final GeneratedColumn<DateTime> lastErrorAt = GeneratedColumn<DateTime>(
      'last_error_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastReviewAtMeta =
      const VerificationMeta('lastReviewAt');
  @override
  late final GeneratedColumn<DateTime> lastReviewAt = GeneratedColumn<DateTime>(
      'last_review_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, questionId, errorCount, lastErrorAt, lastReviewAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'error_statistics';
  @override
  VerificationContext validateIntegrity(Insertable<ErrorStatistic> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('error_count')) {
      context.handle(
          _errorCountMeta,
          errorCount.isAcceptableOrUnknown(
              data['error_count']!, _errorCountMeta));
    }
    if (data.containsKey('last_error_at')) {
      context.handle(
          _lastErrorAtMeta,
          lastErrorAt.isAcceptableOrUnknown(
              data['last_error_at']!, _lastErrorAtMeta));
    } else if (isInserting) {
      context.missing(_lastErrorAtMeta);
    }
    if (data.containsKey('last_review_at')) {
      context.handle(
          _lastReviewAtMeta,
          lastReviewAt.isAcceptableOrUnknown(
              data['last_review_at']!, _lastReviewAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ErrorStatistic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ErrorStatistic(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      questionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}question_id'])!,
      errorCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}error_count'])!,
      lastErrorAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_error_at'])!,
      lastReviewAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_review_at']),
    );
  }

  @override
  $ErrorStatisticsTable createAlias(String alias) {
    return $ErrorStatisticsTable(attachedDatabase, alias);
  }
}

class ErrorStatistic extends DataClass implements Insertable<ErrorStatistic> {
  final int id;
  final int questionId;
  final int errorCount;
  final DateTime lastErrorAt;
  final DateTime? lastReviewAt;
  const ErrorStatistic(
      {required this.id,
      required this.questionId,
      required this.errorCount,
      required this.lastErrorAt,
      this.lastReviewAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question_id'] = Variable<int>(questionId);
    map['error_count'] = Variable<int>(errorCount);
    map['last_error_at'] = Variable<DateTime>(lastErrorAt);
    if (!nullToAbsent || lastReviewAt != null) {
      map['last_review_at'] = Variable<DateTime>(lastReviewAt);
    }
    return map;
  }

  ErrorStatisticsCompanion toCompanion(bool nullToAbsent) {
    return ErrorStatisticsCompanion(
      id: Value(id),
      questionId: Value(questionId),
      errorCount: Value(errorCount),
      lastErrorAt: Value(lastErrorAt),
      lastReviewAt: lastReviewAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewAt),
    );
  }

  factory ErrorStatistic.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ErrorStatistic(
      id: serializer.fromJson<int>(json['id']),
      questionId: serializer.fromJson<int>(json['questionId']),
      errorCount: serializer.fromJson<int>(json['errorCount']),
      lastErrorAt: serializer.fromJson<DateTime>(json['lastErrorAt']),
      lastReviewAt: serializer.fromJson<DateTime?>(json['lastReviewAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'questionId': serializer.toJson<int>(questionId),
      'errorCount': serializer.toJson<int>(errorCount),
      'lastErrorAt': serializer.toJson<DateTime>(lastErrorAt),
      'lastReviewAt': serializer.toJson<DateTime?>(lastReviewAt),
    };
  }

  ErrorStatistic copyWith(
          {int? id,
          int? questionId,
          int? errorCount,
          DateTime? lastErrorAt,
          Value<DateTime?> lastReviewAt = const Value.absent()}) =>
      ErrorStatistic(
        id: id ?? this.id,
        questionId: questionId ?? this.questionId,
        errorCount: errorCount ?? this.errorCount,
        lastErrorAt: lastErrorAt ?? this.lastErrorAt,
        lastReviewAt:
            lastReviewAt.present ? lastReviewAt.value : this.lastReviewAt,
      );
  ErrorStatistic copyWithCompanion(ErrorStatisticsCompanion data) {
    return ErrorStatistic(
      id: data.id.present ? data.id.value : this.id,
      questionId:
          data.questionId.present ? data.questionId.value : this.questionId,
      errorCount:
          data.errorCount.present ? data.errorCount.value : this.errorCount,
      lastErrorAt:
          data.lastErrorAt.present ? data.lastErrorAt.value : this.lastErrorAt,
      lastReviewAt: data.lastReviewAt.present
          ? data.lastReviewAt.value
          : this.lastReviewAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ErrorStatistic(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('errorCount: $errorCount, ')
          ..write('lastErrorAt: $lastErrorAt, ')
          ..write('lastReviewAt: $lastReviewAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, questionId, errorCount, lastErrorAt, lastReviewAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ErrorStatistic &&
          other.id == this.id &&
          other.questionId == this.questionId &&
          other.errorCount == this.errorCount &&
          other.lastErrorAt == this.lastErrorAt &&
          other.lastReviewAt == this.lastReviewAt);
}

class ErrorStatisticsCompanion extends UpdateCompanion<ErrorStatistic> {
  final Value<int> id;
  final Value<int> questionId;
  final Value<int> errorCount;
  final Value<DateTime> lastErrorAt;
  final Value<DateTime?> lastReviewAt;
  const ErrorStatisticsCompanion({
    this.id = const Value.absent(),
    this.questionId = const Value.absent(),
    this.errorCount = const Value.absent(),
    this.lastErrorAt = const Value.absent(),
    this.lastReviewAt = const Value.absent(),
  });
  ErrorStatisticsCompanion.insert({
    this.id = const Value.absent(),
    required int questionId,
    this.errorCount = const Value.absent(),
    required DateTime lastErrorAt,
    this.lastReviewAt = const Value.absent(),
  })  : questionId = Value(questionId),
        lastErrorAt = Value(lastErrorAt);
  static Insertable<ErrorStatistic> custom({
    Expression<int>? id,
    Expression<int>? questionId,
    Expression<int>? errorCount,
    Expression<DateTime>? lastErrorAt,
    Expression<DateTime>? lastReviewAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questionId != null) 'question_id': questionId,
      if (errorCount != null) 'error_count': errorCount,
      if (lastErrorAt != null) 'last_error_at': lastErrorAt,
      if (lastReviewAt != null) 'last_review_at': lastReviewAt,
    });
  }

  ErrorStatisticsCompanion copyWith(
      {Value<int>? id,
      Value<int>? questionId,
      Value<int>? errorCount,
      Value<DateTime>? lastErrorAt,
      Value<DateTime?>? lastReviewAt}) {
    return ErrorStatisticsCompanion(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      errorCount: errorCount ?? this.errorCount,
      lastErrorAt: lastErrorAt ?? this.lastErrorAt,
      lastReviewAt: lastReviewAt ?? this.lastReviewAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (errorCount.present) {
      map['error_count'] = Variable<int>(errorCount.value);
    }
    if (lastErrorAt.present) {
      map['last_error_at'] = Variable<DateTime>(lastErrorAt.value);
    }
    if (lastReviewAt.present) {
      map['last_review_at'] = Variable<DateTime>(lastReviewAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ErrorStatisticsCompanion(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('errorCount: $errorCount, ')
          ..write('lastErrorAt: $lastErrorAt, ')
          ..write('lastReviewAt: $lastReviewAt')
          ..write(')'))
        .toString();
  }
}

class $DailyStatisticsTable extends DailyStatistics
    with TableInfo<$DailyStatisticsTable, DailyStatistic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyStatisticsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _totalQuestionsMeta =
      const VerificationMeta('totalQuestions');
  @override
  late final GeneratedColumn<int> totalQuestions = GeneratedColumn<int>(
      'total_questions', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _correctCountMeta =
      const VerificationMeta('correctCount');
  @override
  late final GeneratedColumn<int> correctCount = GeneratedColumn<int>(
      'correct_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalTimeSecondsMeta =
      const VerificationMeta('totalTimeSeconds');
  @override
  late final GeneratedColumn<int> totalTimeSeconds = GeneratedColumn<int>(
      'total_time_seconds', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _averageAccuracyMeta =
      const VerificationMeta('averageAccuracy');
  @override
  late final GeneratedColumn<double> averageAccuracy = GeneratedColumn<double>(
      'average_accuracy', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _multipleChoiceErrorsMeta =
      const VerificationMeta('multipleChoiceErrors');
  @override
  late final GeneratedColumn<int> multipleChoiceErrors = GeneratedColumn<int>(
      'multiple_choice_errors', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _trueFalseErrorsMeta =
      const VerificationMeta('trueFalseErrors');
  @override
  late final GeneratedColumn<int> trueFalseErrors = GeneratedColumn<int>(
      'true_false_errors', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _shortAnswerErrorsMeta =
      const VerificationMeta('shortAnswerErrors');
  @override
  late final GeneratedColumn<int> shortAnswerErrors = GeneratedColumn<int>(
      'short_answer_errors', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        totalQuestions,
        correctCount,
        totalTimeSeconds,
        averageAccuracy,
        multipleChoiceErrors,
        trueFalseErrors,
        shortAnswerErrors
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_statistics';
  @override
  VerificationContext validateIntegrity(Insertable<DailyStatistic> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('total_questions')) {
      context.handle(
          _totalQuestionsMeta,
          totalQuestions.isAcceptableOrUnknown(
              data['total_questions']!, _totalQuestionsMeta));
    }
    if (data.containsKey('correct_count')) {
      context.handle(
          _correctCountMeta,
          correctCount.isAcceptableOrUnknown(
              data['correct_count']!, _correctCountMeta));
    }
    if (data.containsKey('total_time_seconds')) {
      context.handle(
          _totalTimeSecondsMeta,
          totalTimeSeconds.isAcceptableOrUnknown(
              data['total_time_seconds']!, _totalTimeSecondsMeta));
    }
    if (data.containsKey('average_accuracy')) {
      context.handle(
          _averageAccuracyMeta,
          averageAccuracy.isAcceptableOrUnknown(
              data['average_accuracy']!, _averageAccuracyMeta));
    }
    if (data.containsKey('multiple_choice_errors')) {
      context.handle(
          _multipleChoiceErrorsMeta,
          multipleChoiceErrors.isAcceptableOrUnknown(
              data['multiple_choice_errors']!, _multipleChoiceErrorsMeta));
    }
    if (data.containsKey('true_false_errors')) {
      context.handle(
          _trueFalseErrorsMeta,
          trueFalseErrors.isAcceptableOrUnknown(
              data['true_false_errors']!, _trueFalseErrorsMeta));
    }
    if (data.containsKey('short_answer_errors')) {
      context.handle(
          _shortAnswerErrorsMeta,
          shortAnswerErrors.isAcceptableOrUnknown(
              data['short_answer_errors']!, _shortAnswerErrorsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyStatistic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyStatistic(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      totalQuestions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_questions'])!,
      correctCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct_count'])!,
      totalTimeSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}total_time_seconds'])!,
      averageAccuracy: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}average_accuracy'])!,
      multipleChoiceErrors: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}multiple_choice_errors'])!,
      trueFalseErrors: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}true_false_errors'])!,
      shortAnswerErrors: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}short_answer_errors'])!,
    );
  }

  @override
  $DailyStatisticsTable createAlias(String alias) {
    return $DailyStatisticsTable(attachedDatabase, alias);
  }
}

class DailyStatistic extends DataClass implements Insertable<DailyStatistic> {
  final int id;
  final DateTime date;
  final int totalQuestions;
  final int correctCount;
  final int totalTimeSeconds;
  final double averageAccuracy;
  final int multipleChoiceErrors;
  final int trueFalseErrors;
  final int shortAnswerErrors;
  const DailyStatistic(
      {required this.id,
      required this.date,
      required this.totalQuestions,
      required this.correctCount,
      required this.totalTimeSeconds,
      required this.averageAccuracy,
      required this.multipleChoiceErrors,
      required this.trueFalseErrors,
      required this.shortAnswerErrors});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['total_questions'] = Variable<int>(totalQuestions);
    map['correct_count'] = Variable<int>(correctCount);
    map['total_time_seconds'] = Variable<int>(totalTimeSeconds);
    map['average_accuracy'] = Variable<double>(averageAccuracy);
    map['multiple_choice_errors'] = Variable<int>(multipleChoiceErrors);
    map['true_false_errors'] = Variable<int>(trueFalseErrors);
    map['short_answer_errors'] = Variable<int>(shortAnswerErrors);
    return map;
  }

  DailyStatisticsCompanion toCompanion(bool nullToAbsent) {
    return DailyStatisticsCompanion(
      id: Value(id),
      date: Value(date),
      totalQuestions: Value(totalQuestions),
      correctCount: Value(correctCount),
      totalTimeSeconds: Value(totalTimeSeconds),
      averageAccuracy: Value(averageAccuracy),
      multipleChoiceErrors: Value(multipleChoiceErrors),
      trueFalseErrors: Value(trueFalseErrors),
      shortAnswerErrors: Value(shortAnswerErrors),
    );
  }

  factory DailyStatistic.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyStatistic(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      totalQuestions: serializer.fromJson<int>(json['totalQuestions']),
      correctCount: serializer.fromJson<int>(json['correctCount']),
      totalTimeSeconds: serializer.fromJson<int>(json['totalTimeSeconds']),
      averageAccuracy: serializer.fromJson<double>(json['averageAccuracy']),
      multipleChoiceErrors:
          serializer.fromJson<int>(json['multipleChoiceErrors']),
      trueFalseErrors: serializer.fromJson<int>(json['trueFalseErrors']),
      shortAnswerErrors: serializer.fromJson<int>(json['shortAnswerErrors']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'totalQuestions': serializer.toJson<int>(totalQuestions),
      'correctCount': serializer.toJson<int>(correctCount),
      'totalTimeSeconds': serializer.toJson<int>(totalTimeSeconds),
      'averageAccuracy': serializer.toJson<double>(averageAccuracy),
      'multipleChoiceErrors': serializer.toJson<int>(multipleChoiceErrors),
      'trueFalseErrors': serializer.toJson<int>(trueFalseErrors),
      'shortAnswerErrors': serializer.toJson<int>(shortAnswerErrors),
    };
  }

  DailyStatistic copyWith(
          {int? id,
          DateTime? date,
          int? totalQuestions,
          int? correctCount,
          int? totalTimeSeconds,
          double? averageAccuracy,
          int? multipleChoiceErrors,
          int? trueFalseErrors,
          int? shortAnswerErrors}) =>
      DailyStatistic(
        id: id ?? this.id,
        date: date ?? this.date,
        totalQuestions: totalQuestions ?? this.totalQuestions,
        correctCount: correctCount ?? this.correctCount,
        totalTimeSeconds: totalTimeSeconds ?? this.totalTimeSeconds,
        averageAccuracy: averageAccuracy ?? this.averageAccuracy,
        multipleChoiceErrors: multipleChoiceErrors ?? this.multipleChoiceErrors,
        trueFalseErrors: trueFalseErrors ?? this.trueFalseErrors,
        shortAnswerErrors: shortAnswerErrors ?? this.shortAnswerErrors,
      );
  DailyStatistic copyWithCompanion(DailyStatisticsCompanion data) {
    return DailyStatistic(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      totalQuestions: data.totalQuestions.present
          ? data.totalQuestions.value
          : this.totalQuestions,
      correctCount: data.correctCount.present
          ? data.correctCount.value
          : this.correctCount,
      totalTimeSeconds: data.totalTimeSeconds.present
          ? data.totalTimeSeconds.value
          : this.totalTimeSeconds,
      averageAccuracy: data.averageAccuracy.present
          ? data.averageAccuracy.value
          : this.averageAccuracy,
      multipleChoiceErrors: data.multipleChoiceErrors.present
          ? data.multipleChoiceErrors.value
          : this.multipleChoiceErrors,
      trueFalseErrors: data.trueFalseErrors.present
          ? data.trueFalseErrors.value
          : this.trueFalseErrors,
      shortAnswerErrors: data.shortAnswerErrors.present
          ? data.shortAnswerErrors.value
          : this.shortAnswerErrors,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyStatistic(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('correctCount: $correctCount, ')
          ..write('totalTimeSeconds: $totalTimeSeconds, ')
          ..write('averageAccuracy: $averageAccuracy, ')
          ..write('multipleChoiceErrors: $multipleChoiceErrors, ')
          ..write('trueFalseErrors: $trueFalseErrors, ')
          ..write('shortAnswerErrors: $shortAnswerErrors')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      date,
      totalQuestions,
      correctCount,
      totalTimeSeconds,
      averageAccuracy,
      multipleChoiceErrors,
      trueFalseErrors,
      shortAnswerErrors);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyStatistic &&
          other.id == this.id &&
          other.date == this.date &&
          other.totalQuestions == this.totalQuestions &&
          other.correctCount == this.correctCount &&
          other.totalTimeSeconds == this.totalTimeSeconds &&
          other.averageAccuracy == this.averageAccuracy &&
          other.multipleChoiceErrors == this.multipleChoiceErrors &&
          other.trueFalseErrors == this.trueFalseErrors &&
          other.shortAnswerErrors == this.shortAnswerErrors);
}

class DailyStatisticsCompanion extends UpdateCompanion<DailyStatistic> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> totalQuestions;
  final Value<int> correctCount;
  final Value<int> totalTimeSeconds;
  final Value<double> averageAccuracy;
  final Value<int> multipleChoiceErrors;
  final Value<int> trueFalseErrors;
  final Value<int> shortAnswerErrors;
  const DailyStatisticsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.totalQuestions = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.totalTimeSeconds = const Value.absent(),
    this.averageAccuracy = const Value.absent(),
    this.multipleChoiceErrors = const Value.absent(),
    this.trueFalseErrors = const Value.absent(),
    this.shortAnswerErrors = const Value.absent(),
  });
  DailyStatisticsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.totalQuestions = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.totalTimeSeconds = const Value.absent(),
    this.averageAccuracy = const Value.absent(),
    this.multipleChoiceErrors = const Value.absent(),
    this.trueFalseErrors = const Value.absent(),
    this.shortAnswerErrors = const Value.absent(),
  }) : date = Value(date);
  static Insertable<DailyStatistic> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? totalQuestions,
    Expression<int>? correctCount,
    Expression<int>? totalTimeSeconds,
    Expression<double>? averageAccuracy,
    Expression<int>? multipleChoiceErrors,
    Expression<int>? trueFalseErrors,
    Expression<int>? shortAnswerErrors,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (totalQuestions != null) 'total_questions': totalQuestions,
      if (correctCount != null) 'correct_count': correctCount,
      if (totalTimeSeconds != null) 'total_time_seconds': totalTimeSeconds,
      if (averageAccuracy != null) 'average_accuracy': averageAccuracy,
      if (multipleChoiceErrors != null)
        'multiple_choice_errors': multipleChoiceErrors,
      if (trueFalseErrors != null) 'true_false_errors': trueFalseErrors,
      if (shortAnswerErrors != null) 'short_answer_errors': shortAnswerErrors,
    });
  }

  DailyStatisticsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int>? totalQuestions,
      Value<int>? correctCount,
      Value<int>? totalTimeSeconds,
      Value<double>? averageAccuracy,
      Value<int>? multipleChoiceErrors,
      Value<int>? trueFalseErrors,
      Value<int>? shortAnswerErrors}) {
    return DailyStatisticsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      correctCount: correctCount ?? this.correctCount,
      totalTimeSeconds: totalTimeSeconds ?? this.totalTimeSeconds,
      averageAccuracy: averageAccuracy ?? this.averageAccuracy,
      multipleChoiceErrors: multipleChoiceErrors ?? this.multipleChoiceErrors,
      trueFalseErrors: trueFalseErrors ?? this.trueFalseErrors,
      shortAnswerErrors: shortAnswerErrors ?? this.shortAnswerErrors,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (totalQuestions.present) {
      map['total_questions'] = Variable<int>(totalQuestions.value);
    }
    if (correctCount.present) {
      map['correct_count'] = Variable<int>(correctCount.value);
    }
    if (totalTimeSeconds.present) {
      map['total_time_seconds'] = Variable<int>(totalTimeSeconds.value);
    }
    if (averageAccuracy.present) {
      map['average_accuracy'] = Variable<double>(averageAccuracy.value);
    }
    if (multipleChoiceErrors.present) {
      map['multiple_choice_errors'] = Variable<int>(multipleChoiceErrors.value);
    }
    if (trueFalseErrors.present) {
      map['true_false_errors'] = Variable<int>(trueFalseErrors.value);
    }
    if (shortAnswerErrors.present) {
      map['short_answer_errors'] = Variable<int>(shortAnswerErrors.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyStatisticsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('correctCount: $correctCount, ')
          ..write('totalTimeSeconds: $totalTimeSeconds, ')
          ..write('averageAccuracy: $averageAccuracy, ')
          ..write('multipleChoiceErrors: $multipleChoiceErrors, ')
          ..write('trueFalseErrors: $trueFalseErrors, ')
          ..write('shortAnswerErrors: $shortAnswerErrors')
          ..write(')'))
        .toString();
  }
}

abstract class _$QuizDatabase extends GeneratedDatabase {
  _$QuizDatabase(QueryExecutor e) : super(e);
  $QuizDatabaseManager get managers => $QuizDatabaseManager(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $UserAnswersTable userAnswers = $UserAnswersTable(this);
  late final $ErrorStatisticsTable errorStatistics =
      $ErrorStatisticsTable(this);
  late final $DailyStatisticsTable dailyStatistics =
      $DailyStatisticsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [questions, userAnswers, errorStatistics, dailyStatistics];
}

typedef $$QuestionsTableCreateCompanionBuilder = QuestionsCompanion Function({
  Value<int> id,
  required String questionText,
  required QuestionTypeDb questionType,
  required String correctAnswer,
  Value<String?> choices,
  Value<String?> explanation,
  Value<DifficultyLevel?> difficultyLevel,
  Value<int?> expectedTimeSeconds,
  Value<DateTime> createdAt,
});
typedef $$QuestionsTableUpdateCompanionBuilder = QuestionsCompanion Function({
  Value<int> id,
  Value<String> questionText,
  Value<QuestionTypeDb> questionType,
  Value<String> correctAnswer,
  Value<String?> choices,
  Value<String?> explanation,
  Value<DifficultyLevel?> difficultyLevel,
  Value<int?> expectedTimeSeconds,
  Value<DateTime> createdAt,
});

final class $$QuestionsTableReferences
    extends BaseReferences<_$QuizDatabase, $QuestionsTable, Question> {
  $$QuestionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserAnswersTable, List<UserAnswer>>
      _userAnswersRefsTable(_$QuizDatabase db) => MultiTypedResultKey.fromTable(
          db.userAnswers,
          aliasName:
              $_aliasNameGenerator(db.questions.id, db.userAnswers.questionId));

  $$UserAnswersTableProcessedTableManager get userAnswersRefs {
    final manager = $$UserAnswersTableTableManager($_db, $_db.userAnswers)
        .filter((f) => f.questionId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_userAnswersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ErrorStatisticsTable, List<ErrorStatistic>>
      _errorStatisticsRefsTable(_$QuizDatabase db) =>
          MultiTypedResultKey.fromTable(db.errorStatistics,
              aliasName: $_aliasNameGenerator(
                  db.questions.id, db.errorStatistics.questionId));

  $$ErrorStatisticsTableProcessedTableManager get errorStatisticsRefs {
    final manager =
        $$ErrorStatisticsTableTableManager($_db, $_db.errorStatistics)
            .filter((f) => f.questionId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_errorStatisticsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$QuestionsTableFilterComposer
    extends Composer<_$QuizDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get questionText => $composableBuilder(
      column: $table.questionText, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<QuestionTypeDb, QuestionTypeDb, int>
      get questionType => $composableBuilder(
          column: $table.questionType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get correctAnswer => $composableBuilder(
      column: $table.correctAnswer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get choices => $composableBuilder(
      column: $table.choices, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<DifficultyLevel?, DifficultyLevel, int>
      get difficultyLevel => $composableBuilder(
          column: $table.difficultyLevel,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get expectedTimeSeconds => $composableBuilder(
      column: $table.expectedTimeSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> userAnswersRefs(
      Expression<bool> Function($$UserAnswersTableFilterComposer f) f) {
    final $$UserAnswersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userAnswers,
        getReferencedColumn: (t) => t.questionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserAnswersTableFilterComposer(
              $db: $db,
              $table: $db.userAnswers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> errorStatisticsRefs(
      Expression<bool> Function($$ErrorStatisticsTableFilterComposer f) f) {
    final $$ErrorStatisticsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.errorStatistics,
        getReferencedColumn: (t) => t.questionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ErrorStatisticsTableFilterComposer(
              $db: $db,
              $table: $db.errorStatistics,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuestionsTableOrderingComposer
    extends Composer<_$QuizDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get questionText => $composableBuilder(
      column: $table.questionText,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get questionType => $composableBuilder(
      column: $table.questionType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get correctAnswer => $composableBuilder(
      column: $table.correctAnswer,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get choices => $composableBuilder(
      column: $table.choices, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get difficultyLevel => $composableBuilder(
      column: $table.difficultyLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get expectedTimeSeconds => $composableBuilder(
      column: $table.expectedTimeSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$QuestionsTableAnnotationComposer
    extends Composer<_$QuizDatabase, $QuestionsTable> {
  $$QuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get questionText => $composableBuilder(
      column: $table.questionText, builder: (column) => column);

  GeneratedColumnWithTypeConverter<QuestionTypeDb, int> get questionType =>
      $composableBuilder(
          column: $table.questionType, builder: (column) => column);

  GeneratedColumn<String> get correctAnswer => $composableBuilder(
      column: $table.correctAnswer, builder: (column) => column);

  GeneratedColumn<String> get choices =>
      $composableBuilder(column: $table.choices, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DifficultyLevel?, int> get difficultyLevel =>
      $composableBuilder(
          column: $table.difficultyLevel, builder: (column) => column);

  GeneratedColumn<int> get expectedTimeSeconds => $composableBuilder(
      column: $table.expectedTimeSeconds, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> userAnswersRefs<T extends Object>(
      Expression<T> Function($$UserAnswersTableAnnotationComposer a) f) {
    final $$UserAnswersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.userAnswers,
        getReferencedColumn: (t) => t.questionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserAnswersTableAnnotationComposer(
              $db: $db,
              $table: $db.userAnswers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> errorStatisticsRefs<T extends Object>(
      Expression<T> Function($$ErrorStatisticsTableAnnotationComposer a) f) {
    final $$ErrorStatisticsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.errorStatistics,
        getReferencedColumn: (t) => t.questionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ErrorStatisticsTableAnnotationComposer(
              $db: $db,
              $table: $db.errorStatistics,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuestionsTableTableManager extends RootTableManager<
    _$QuizDatabase,
    $QuestionsTable,
    Question,
    $$QuestionsTableFilterComposer,
    $$QuestionsTableOrderingComposer,
    $$QuestionsTableAnnotationComposer,
    $$QuestionsTableCreateCompanionBuilder,
    $$QuestionsTableUpdateCompanionBuilder,
    (Question, $$QuestionsTableReferences),
    Question,
    PrefetchHooks Function({bool userAnswersRefs, bool errorStatisticsRefs})> {
  $$QuestionsTableTableManager(_$QuizDatabase db, $QuestionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> questionText = const Value.absent(),
            Value<QuestionTypeDb> questionType = const Value.absent(),
            Value<String> correctAnswer = const Value.absent(),
            Value<String?> choices = const Value.absent(),
            Value<String?> explanation = const Value.absent(),
            Value<DifficultyLevel?> difficultyLevel = const Value.absent(),
            Value<int?> expectedTimeSeconds = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              QuestionsCompanion(
            id: id,
            questionText: questionText,
            questionType: questionType,
            correctAnswer: correctAnswer,
            choices: choices,
            explanation: explanation,
            difficultyLevel: difficultyLevel,
            expectedTimeSeconds: expectedTimeSeconds,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String questionText,
            required QuestionTypeDb questionType,
            required String correctAnswer,
            Value<String?> choices = const Value.absent(),
            Value<String?> explanation = const Value.absent(),
            Value<DifficultyLevel?> difficultyLevel = const Value.absent(),
            Value<int?> expectedTimeSeconds = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              QuestionsCompanion.insert(
            id: id,
            questionText: questionText,
            questionType: questionType,
            correctAnswer: correctAnswer,
            choices: choices,
            explanation: explanation,
            difficultyLevel: difficultyLevel,
            expectedTimeSeconds: expectedTimeSeconds,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$QuestionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {userAnswersRefs = false, errorStatisticsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (userAnswersRefs) db.userAnswers,
                if (errorStatisticsRefs) db.errorStatistics
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userAnswersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$QuestionsTableReferences
                            ._userAnswersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$QuestionsTableReferences(db, table, p0)
                                .userAnswersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.questionId == item.id),
                        typedResults: items),
                  if (errorStatisticsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$QuestionsTableReferences
                            ._errorStatisticsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$QuestionsTableReferences(db, table, p0)
                                .errorStatisticsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.questionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$QuestionsTableProcessedTableManager = ProcessedTableManager<
    _$QuizDatabase,
    $QuestionsTable,
    Question,
    $$QuestionsTableFilterComposer,
    $$QuestionsTableOrderingComposer,
    $$QuestionsTableAnnotationComposer,
    $$QuestionsTableCreateCompanionBuilder,
    $$QuestionsTableUpdateCompanionBuilder,
    (Question, $$QuestionsTableReferences),
    Question,
    PrefetchHooks Function({bool userAnswersRefs, bool errorStatisticsRefs})>;
typedef $$UserAnswersTableCreateCompanionBuilder = UserAnswersCompanion
    Function({
  Value<int> id,
  required int questionId,
  required String userAnswer,
  required bool isCorrect,
  required int timeSpentSeconds,
  Value<DateTime> answeredAt,
});
typedef $$UserAnswersTableUpdateCompanionBuilder = UserAnswersCompanion
    Function({
  Value<int> id,
  Value<int> questionId,
  Value<String> userAnswer,
  Value<bool> isCorrect,
  Value<int> timeSpentSeconds,
  Value<DateTime> answeredAt,
});

final class $$UserAnswersTableReferences
    extends BaseReferences<_$QuizDatabase, $UserAnswersTable, UserAnswer> {
  $$UserAnswersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $QuestionsTable _questionIdTable(_$QuizDatabase db) =>
      db.questions.createAlias(
          $_aliasNameGenerator(db.userAnswers.questionId, db.questions.id));

  $$QuestionsTableProcessedTableManager? get questionId {
    if ($_item.questionId == null) return null;
    final manager = $$QuestionsTableTableManager($_db, $_db.questions)
        .filter((f) => f.id($_item.questionId!));
    final item = $_typedResult.readTableOrNull(_questionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$UserAnswersTableFilterComposer
    extends Composer<_$QuizDatabase, $UserAnswersTable> {
  $$UserAnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userAnswer => $composableBuilder(
      column: $table.userAnswer, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeSpentSeconds => $composableBuilder(
      column: $table.timeSpentSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get answeredAt => $composableBuilder(
      column: $table.answeredAt, builder: (column) => ColumnFilters(column));

  $$QuestionsTableFilterComposer get questionId {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questionId,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableFilterComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserAnswersTableOrderingComposer
    extends Composer<_$QuizDatabase, $UserAnswersTable> {
  $$UserAnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userAnswer => $composableBuilder(
      column: $table.userAnswer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeSpentSeconds => $composableBuilder(
      column: $table.timeSpentSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get answeredAt => $composableBuilder(
      column: $table.answeredAt, builder: (column) => ColumnOrderings(column));

  $$QuestionsTableOrderingComposer get questionId {
    final $$QuestionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questionId,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableOrderingComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserAnswersTableAnnotationComposer
    extends Composer<_$QuizDatabase, $UserAnswersTable> {
  $$UserAnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userAnswer => $composableBuilder(
      column: $table.userAnswer, builder: (column) => column);

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumn<int> get timeSpentSeconds => $composableBuilder(
      column: $table.timeSpentSeconds, builder: (column) => column);

  GeneratedColumn<DateTime> get answeredAt => $composableBuilder(
      column: $table.answeredAt, builder: (column) => column);

  $$QuestionsTableAnnotationComposer get questionId {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questionId,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableAnnotationComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserAnswersTableTableManager extends RootTableManager<
    _$QuizDatabase,
    $UserAnswersTable,
    UserAnswer,
    $$UserAnswersTableFilterComposer,
    $$UserAnswersTableOrderingComposer,
    $$UserAnswersTableAnnotationComposer,
    $$UserAnswersTableCreateCompanionBuilder,
    $$UserAnswersTableUpdateCompanionBuilder,
    (UserAnswer, $$UserAnswersTableReferences),
    UserAnswer,
    PrefetchHooks Function({bool questionId})> {
  $$UserAnswersTableTableManager(_$QuizDatabase db, $UserAnswersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserAnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> questionId = const Value.absent(),
            Value<String> userAnswer = const Value.absent(),
            Value<bool> isCorrect = const Value.absent(),
            Value<int> timeSpentSeconds = const Value.absent(),
            Value<DateTime> answeredAt = const Value.absent(),
          }) =>
              UserAnswersCompanion(
            id: id,
            questionId: questionId,
            userAnswer: userAnswer,
            isCorrect: isCorrect,
            timeSpentSeconds: timeSpentSeconds,
            answeredAt: answeredAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int questionId,
            required String userAnswer,
            required bool isCorrect,
            required int timeSpentSeconds,
            Value<DateTime> answeredAt = const Value.absent(),
          }) =>
              UserAnswersCompanion.insert(
            id: id,
            questionId: questionId,
            userAnswer: userAnswer,
            isCorrect: isCorrect,
            timeSpentSeconds: timeSpentSeconds,
            answeredAt: answeredAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserAnswersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({questionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (questionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.questionId,
                    referencedTable:
                        $$UserAnswersTableReferences._questionIdTable(db),
                    referencedColumn:
                        $$UserAnswersTableReferences._questionIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$UserAnswersTableProcessedTableManager = ProcessedTableManager<
    _$QuizDatabase,
    $UserAnswersTable,
    UserAnswer,
    $$UserAnswersTableFilterComposer,
    $$UserAnswersTableOrderingComposer,
    $$UserAnswersTableAnnotationComposer,
    $$UserAnswersTableCreateCompanionBuilder,
    $$UserAnswersTableUpdateCompanionBuilder,
    (UserAnswer, $$UserAnswersTableReferences),
    UserAnswer,
    PrefetchHooks Function({bool questionId})>;
typedef $$ErrorStatisticsTableCreateCompanionBuilder = ErrorStatisticsCompanion
    Function({
  Value<int> id,
  required int questionId,
  Value<int> errorCount,
  required DateTime lastErrorAt,
  Value<DateTime?> lastReviewAt,
});
typedef $$ErrorStatisticsTableUpdateCompanionBuilder = ErrorStatisticsCompanion
    Function({
  Value<int> id,
  Value<int> questionId,
  Value<int> errorCount,
  Value<DateTime> lastErrorAt,
  Value<DateTime?> lastReviewAt,
});

final class $$ErrorStatisticsTableReferences extends BaseReferences<
    _$QuizDatabase, $ErrorStatisticsTable, ErrorStatistic> {
  $$ErrorStatisticsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $QuestionsTable _questionIdTable(_$QuizDatabase db) =>
      db.questions.createAlias(
          $_aliasNameGenerator(db.errorStatistics.questionId, db.questions.id));

  $$QuestionsTableProcessedTableManager? get questionId {
    if ($_item.questionId == null) return null;
    final manager = $$QuestionsTableTableManager($_db, $_db.questions)
        .filter((f) => f.id($_item.questionId!));
    final item = $_typedResult.readTableOrNull(_questionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ErrorStatisticsTableFilterComposer
    extends Composer<_$QuizDatabase, $ErrorStatisticsTable> {
  $$ErrorStatisticsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get errorCount => $composableBuilder(
      column: $table.errorCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastErrorAt => $composableBuilder(
      column: $table.lastErrorAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastReviewAt => $composableBuilder(
      column: $table.lastReviewAt, builder: (column) => ColumnFilters(column));

  $$QuestionsTableFilterComposer get questionId {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questionId,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableFilterComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ErrorStatisticsTableOrderingComposer
    extends Composer<_$QuizDatabase, $ErrorStatisticsTable> {
  $$ErrorStatisticsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get errorCount => $composableBuilder(
      column: $table.errorCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastErrorAt => $composableBuilder(
      column: $table.lastErrorAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastReviewAt => $composableBuilder(
      column: $table.lastReviewAt,
      builder: (column) => ColumnOrderings(column));

  $$QuestionsTableOrderingComposer get questionId {
    final $$QuestionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questionId,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableOrderingComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ErrorStatisticsTableAnnotationComposer
    extends Composer<_$QuizDatabase, $ErrorStatisticsTable> {
  $$ErrorStatisticsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get errorCount => $composableBuilder(
      column: $table.errorCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastErrorAt => $composableBuilder(
      column: $table.lastErrorAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReviewAt => $composableBuilder(
      column: $table.lastReviewAt, builder: (column) => column);

  $$QuestionsTableAnnotationComposer get questionId {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questionId,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableAnnotationComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ErrorStatisticsTableTableManager extends RootTableManager<
    _$QuizDatabase,
    $ErrorStatisticsTable,
    ErrorStatistic,
    $$ErrorStatisticsTableFilterComposer,
    $$ErrorStatisticsTableOrderingComposer,
    $$ErrorStatisticsTableAnnotationComposer,
    $$ErrorStatisticsTableCreateCompanionBuilder,
    $$ErrorStatisticsTableUpdateCompanionBuilder,
    (ErrorStatistic, $$ErrorStatisticsTableReferences),
    ErrorStatistic,
    PrefetchHooks Function({bool questionId})> {
  $$ErrorStatisticsTableTableManager(
      _$QuizDatabase db, $ErrorStatisticsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ErrorStatisticsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ErrorStatisticsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ErrorStatisticsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> questionId = const Value.absent(),
            Value<int> errorCount = const Value.absent(),
            Value<DateTime> lastErrorAt = const Value.absent(),
            Value<DateTime?> lastReviewAt = const Value.absent(),
          }) =>
              ErrorStatisticsCompanion(
            id: id,
            questionId: questionId,
            errorCount: errorCount,
            lastErrorAt: lastErrorAt,
            lastReviewAt: lastReviewAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int questionId,
            Value<int> errorCount = const Value.absent(),
            required DateTime lastErrorAt,
            Value<DateTime?> lastReviewAt = const Value.absent(),
          }) =>
              ErrorStatisticsCompanion.insert(
            id: id,
            questionId: questionId,
            errorCount: errorCount,
            lastErrorAt: lastErrorAt,
            lastReviewAt: lastReviewAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ErrorStatisticsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({questionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (questionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.questionId,
                    referencedTable:
                        $$ErrorStatisticsTableReferences._questionIdTable(db),
                    referencedColumn: $$ErrorStatisticsTableReferences
                        ._questionIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ErrorStatisticsTableProcessedTableManager = ProcessedTableManager<
    _$QuizDatabase,
    $ErrorStatisticsTable,
    ErrorStatistic,
    $$ErrorStatisticsTableFilterComposer,
    $$ErrorStatisticsTableOrderingComposer,
    $$ErrorStatisticsTableAnnotationComposer,
    $$ErrorStatisticsTableCreateCompanionBuilder,
    $$ErrorStatisticsTableUpdateCompanionBuilder,
    (ErrorStatistic, $$ErrorStatisticsTableReferences),
    ErrorStatistic,
    PrefetchHooks Function({bool questionId})>;
typedef $$DailyStatisticsTableCreateCompanionBuilder = DailyStatisticsCompanion
    Function({
  Value<int> id,
  required DateTime date,
  Value<int> totalQuestions,
  Value<int> correctCount,
  Value<int> totalTimeSeconds,
  Value<double> averageAccuracy,
  Value<int> multipleChoiceErrors,
  Value<int> trueFalseErrors,
  Value<int> shortAnswerErrors,
});
typedef $$DailyStatisticsTableUpdateCompanionBuilder = DailyStatisticsCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int> totalQuestions,
  Value<int> correctCount,
  Value<int> totalTimeSeconds,
  Value<double> averageAccuracy,
  Value<int> multipleChoiceErrors,
  Value<int> trueFalseErrors,
  Value<int> shortAnswerErrors,
});

class $$DailyStatisticsTableFilterComposer
    extends Composer<_$QuizDatabase, $DailyStatisticsTable> {
  $$DailyStatisticsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalQuestions => $composableBuilder(
      column: $table.totalQuestions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctCount => $composableBuilder(
      column: $table.correctCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalTimeSeconds => $composableBuilder(
      column: $table.totalTimeSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get averageAccuracy => $composableBuilder(
      column: $table.averageAccuracy,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get multipleChoiceErrors => $composableBuilder(
      column: $table.multipleChoiceErrors,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get trueFalseErrors => $composableBuilder(
      column: $table.trueFalseErrors,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get shortAnswerErrors => $composableBuilder(
      column: $table.shortAnswerErrors,
      builder: (column) => ColumnFilters(column));
}

class $$DailyStatisticsTableOrderingComposer
    extends Composer<_$QuizDatabase, $DailyStatisticsTable> {
  $$DailyStatisticsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalQuestions => $composableBuilder(
      column: $table.totalQuestions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctCount => $composableBuilder(
      column: $table.correctCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalTimeSeconds => $composableBuilder(
      column: $table.totalTimeSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get averageAccuracy => $composableBuilder(
      column: $table.averageAccuracy,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get multipleChoiceErrors => $composableBuilder(
      column: $table.multipleChoiceErrors,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get trueFalseErrors => $composableBuilder(
      column: $table.trueFalseErrors,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get shortAnswerErrors => $composableBuilder(
      column: $table.shortAnswerErrors,
      builder: (column) => ColumnOrderings(column));
}

class $$DailyStatisticsTableAnnotationComposer
    extends Composer<_$QuizDatabase, $DailyStatisticsTable> {
  $$DailyStatisticsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get totalQuestions => $composableBuilder(
      column: $table.totalQuestions, builder: (column) => column);

  GeneratedColumn<int> get correctCount => $composableBuilder(
      column: $table.correctCount, builder: (column) => column);

  GeneratedColumn<int> get totalTimeSeconds => $composableBuilder(
      column: $table.totalTimeSeconds, builder: (column) => column);

  GeneratedColumn<double> get averageAccuracy => $composableBuilder(
      column: $table.averageAccuracy, builder: (column) => column);

  GeneratedColumn<int> get multipleChoiceErrors => $composableBuilder(
      column: $table.multipleChoiceErrors, builder: (column) => column);

  GeneratedColumn<int> get trueFalseErrors => $composableBuilder(
      column: $table.trueFalseErrors, builder: (column) => column);

  GeneratedColumn<int> get shortAnswerErrors => $composableBuilder(
      column: $table.shortAnswerErrors, builder: (column) => column);
}

class $$DailyStatisticsTableTableManager extends RootTableManager<
    _$QuizDatabase,
    $DailyStatisticsTable,
    DailyStatistic,
    $$DailyStatisticsTableFilterComposer,
    $$DailyStatisticsTableOrderingComposer,
    $$DailyStatisticsTableAnnotationComposer,
    $$DailyStatisticsTableCreateCompanionBuilder,
    $$DailyStatisticsTableUpdateCompanionBuilder,
    (
      DailyStatistic,
      BaseReferences<_$QuizDatabase, $DailyStatisticsTable, DailyStatistic>
    ),
    DailyStatistic,
    PrefetchHooks Function()> {
  $$DailyStatisticsTableTableManager(
      _$QuizDatabase db, $DailyStatisticsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyStatisticsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyStatisticsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyStatisticsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> totalQuestions = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<int> totalTimeSeconds = const Value.absent(),
            Value<double> averageAccuracy = const Value.absent(),
            Value<int> multipleChoiceErrors = const Value.absent(),
            Value<int> trueFalseErrors = const Value.absent(),
            Value<int> shortAnswerErrors = const Value.absent(),
          }) =>
              DailyStatisticsCompanion(
            id: id,
            date: date,
            totalQuestions: totalQuestions,
            correctCount: correctCount,
            totalTimeSeconds: totalTimeSeconds,
            averageAccuracy: averageAccuracy,
            multipleChoiceErrors: multipleChoiceErrors,
            trueFalseErrors: trueFalseErrors,
            shortAnswerErrors: shortAnswerErrors,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime date,
            Value<int> totalQuestions = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<int> totalTimeSeconds = const Value.absent(),
            Value<double> averageAccuracy = const Value.absent(),
            Value<int> multipleChoiceErrors = const Value.absent(),
            Value<int> trueFalseErrors = const Value.absent(),
            Value<int> shortAnswerErrors = const Value.absent(),
          }) =>
              DailyStatisticsCompanion.insert(
            id: id,
            date: date,
            totalQuestions: totalQuestions,
            correctCount: correctCount,
            totalTimeSeconds: totalTimeSeconds,
            averageAccuracy: averageAccuracy,
            multipleChoiceErrors: multipleChoiceErrors,
            trueFalseErrors: trueFalseErrors,
            shortAnswerErrors: shortAnswerErrors,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyStatisticsTableProcessedTableManager = ProcessedTableManager<
    _$QuizDatabase,
    $DailyStatisticsTable,
    DailyStatistic,
    $$DailyStatisticsTableFilterComposer,
    $$DailyStatisticsTableOrderingComposer,
    $$DailyStatisticsTableAnnotationComposer,
    $$DailyStatisticsTableCreateCompanionBuilder,
    $$DailyStatisticsTableUpdateCompanionBuilder,
    (
      DailyStatistic,
      BaseReferences<_$QuizDatabase, $DailyStatisticsTable, DailyStatistic>
    ),
    DailyStatistic,
    PrefetchHooks Function()>;

class $QuizDatabaseManager {
  final _$QuizDatabase _db;
  $QuizDatabaseManager(this._db);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
  $$UserAnswersTableTableManager get userAnswers =>
      $$UserAnswersTableTableManager(_db, _db.userAnswers);
  $$ErrorStatisticsTableTableManager get errorStatistics =>
      $$ErrorStatisticsTableTableManager(_db, _db.errorStatistics);
  $$DailyStatisticsTableTableManager get dailyStatistics =>
      $$DailyStatisticsTableTableManager(_db, _db.dailyStatistics);
}
