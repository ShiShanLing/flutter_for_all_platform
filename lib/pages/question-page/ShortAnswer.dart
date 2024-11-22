import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 简答题组件
class ShortAnswerWidget extends StatefulWidget {
  final bool showResult;
  final Function(String) onAnswer;

  const ShortAnswerWidget({
    Key? key,
    required this.showResult,
    required this.onAnswer,
  }) : super(key: key);

  @override
  _ShortAnswerWidgetState createState() => _ShortAnswerWidgetState();
}

class _ShortAnswerWidgetState extends State<ShortAnswerWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          maxLines: 4,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '请输入你的答案...',
          ),
          enabled: !widget.showResult,
        ),
        SizedBox(height: 16),
        if (!widget.showResult)
          ElevatedButton(
            onPressed: () => widget.onAnswer(_controller.text),
            child: Text('提交答案'),
          ),
      ],
    );
  }
}
