import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 判断题组件
class TrueFalseWidget extends StatelessWidget {
  final bool? selectedAnswer;
  final bool showResult;
  final Function(bool) onAnswer;

  const TrueFalseWidget({
    Key? key,
    this.selectedAnswer,
    required this.showResult,
    required this.onAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: showResult ? null : () => onAnswer(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: Text('正确', style: TextStyle(fontSize: 18)),
        ),
        ElevatedButton(
          onPressed: showResult ? null : () => onAnswer(false),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: Text('错误', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
