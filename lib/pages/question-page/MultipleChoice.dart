import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/pages/question-page/Database/database.dart';

// 单选题组件
class MultipleChoiceWidget extends StatelessWidget {
  final Question question;
  final String? selectedAnswer;
  final bool showResult;
  final Function(String) onAnswer;

  const MultipleChoiceWidget({
    Key? key,
    required this.question,
    this.selectedAnswer,
    required this.showResult,
    required this.onAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //这路需要吧 choices 解析成数组
    List choicesList = jsonDecode(question.choices!);

    getChoicesWidgets() {
      List<Widget> choicesWidgets = [];
      print('choicesList===$choicesList');
      for (var choice in choicesList) {
        print('for in $choice');
        choicesWidgets.add(Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: showResult ? null : () => onAnswer(choice['label']),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: showResult && choice['label'] == question.correctAnswer
                    ? Colors.green.withOpacity(0.2)
                    : showResult && choice['label'] == selectedAnswer
                        ? Colors.red.withOpacity(0.2)
                        : Colors.white,
                border: Border.all(
                  color: selectedAnswer == choice['label']
                      ? Colors.blue
                      : Colors.grey,
                  width: selectedAnswer == choice['label'] ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedAnswer == choice['label']
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                    child: Center(
                      child: Text(choice['label']),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(choice['text']),
                  ),
                ],
              ),
            ),
          ),
        ));
      }

      print('choicesWidgets=====$choicesWidgets');
      return choicesWidgets;
    }

    return Column(
      children: getChoicesWidgets(),
    );
  }
}
