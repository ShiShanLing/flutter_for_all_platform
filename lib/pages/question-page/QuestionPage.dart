import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/pages/question-page/Database/database.dart';
import 'package:my_app/pages/question-page/ShortAnswer.dart';
import 'package:my_app/pages/question-page/TrueFalse.dart';
import 'package:my_app/pages/question-page/multipleChoice.dart';
import './tables/tables.dart';
import 'package:go_router/go_router.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextEditingController _shortAnswerController = TextEditingController();
  /*
  每天题目打乱,
  需要记录今天的题目循序,以及答题位置(第几题).
  需要记录每道题答错次数.
  */
  // 示例题目列表
  final List<Question> questionList = [
    // 单选题示例
    Question(
      id: 99,
      questionText: "下列哪个是世界上最大的洲？",
      questionType: QuestionTypeDb.multipleChoice,
      choices: jsonEncode([
        {"text": "非洲", "label": "A"},
        {"text": "亚洲", "label": "B"},
        {"text": "北美洲", "label": "C"},
        {"text": "南美洲", "label": "D"}
      ]),
      correctAnswer: "B",
      explanation: "亚洲是世界上最大的洲，面积约为44,579,000平方公里。",
      createdAt: DateTime.now(),
    ),
    // 判断题示例
    Question(
      id: 1,
      questionText: "地球是太阳系中最大的行星。",
      questionType: QuestionTypeDb.trueFalse,
      correctAnswer: 'false',
      explanation: "木星是太阳系中最大的行星。",
      createdAt: DateTime.now(),
    ),
    // 简答题示例
    Question(
      id: 0,
      questionText: "简述光合作用的过程。",
      questionType: QuestionTypeDb.shortAnswer,
      correctAnswer: "植物利用叶绿素吸收阳光能量，将二氧化碳和水转化为葡萄糖和氧气的过程。",
      explanation: "完整答案应包含：原料（CO2和H2O）、条件（光照和叶绿素）、产物（葡萄糖和O2）。",
      createdAt: DateTime.now(),
    ),
  ];

  int currentQuestionsIndex = 0;
  dynamic selectedAnswer;
  bool showResult = false;
  Map<int, dynamic> userAnswers = {};

  void checkAnswer(dynamic answer) {
    setState(() {
      selectedAnswer = answer;
      userAnswers[currentQuestionsIndex] = answer;
      showResult = true;
    });
  }

  void nextQuestions() {
    if (currentQuestionsIndex < questionList.length - 1) {
      setState(() {
        currentQuestionsIndex++;
        selectedAnswer = null;
        showResult = false;
        _shortAnswerController.clear();
      });
    }
  }

  Widget buildQuestionsContent() {
    Question currentQuestions = questionList[currentQuestionsIndex];

    switch (currentQuestions.questionType) {
      case QuestionTypeDb.multipleChoice:
        return MultipleChoiceWidget(
          question: currentQuestions,
          selectedAnswer: selectedAnswer,
          showResult: showResult,
          onAnswer: checkAnswer,
        );

      case QuestionTypeDb.trueFalse:
        return TrueFalseWidget(
          selectedAnswer: selectedAnswer,
          showResult: showResult,
          onAnswer: checkAnswer,
        );

      case QuestionTypeDb.shortAnswer:
        return ShortAnswerWidget(
          showResult: showResult,
          onAnswer: checkAnswer,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('综合测试'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 进度指示器
                LinearProgressIndicator(
                  value: (currentQuestionsIndex + 1) / questionList.length,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                SizedBox(height: 20),

                // 题目序号和类型
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '第 ${currentQuestionsIndex + 1}/${questionList.length} 题',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      questionList[currentQuestionsIndex].questionType ==
                              QuestionTypeDb.multipleChoice
                          ? '单选题'
                          : questionList[currentQuestionsIndex].questionType ==
                                  QuestionTypeDb.trueFalse
                              ? '判断题'
                              : '简答题',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // 题目内容
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      questionList[currentQuestionsIndex].questionText,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // 答题区域
                buildQuestionsContent(),

                SizedBox(height: 20),

                // 答案解析
                if (showResult) ...[
                  Card(
                    color: Colors.blue.withOpacity(0.1),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '答案解析：',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                              questionList[currentQuestionsIndex].explanation ??
                                  '暂无解析'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // 下一题按钮
                  ElevatedButton(
                    onPressed: currentQuestionsIndex < questionList.length - 1
                        ? nextQuestions
                        : () {
                            // 显示得分统计
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('测试完成'),
                                content: Text('恭喜你完成所有题目！'),
                                actions: [
                                  TextButton(
                                    onPressed: () => context.go('/'),
                                    child: Text('确定'),
                                  ),
                                ],
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      currentQuestionsIndex < questionList.length - 1
                          ? '下一题'
                          : '完成',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _shortAnswerController.dispose();
    super.dispose();
  }
}
