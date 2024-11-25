import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
//路由管理
import 'package:go_router/go_router.dart';

class PreviewQuestionsPage extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final String subject;

  const PreviewQuestionsPage({
    Key? key,
    required this.questions,
    required this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('预览题库 - $subject'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.pop(), // 使用 GoRouter 的 pop 方法返回
        ),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: 确认导入题库
            },
            child: Text('确认导入', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return _buildQuestionCard(question, index);
        },
      ),
    );
  }

  Widget _buildQuestionCard(Map<String, dynamic> question, int index) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 题号和类型
            Row(
              children: [
                Text(
                  '第${index + 1}题',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                _buildQuestionType(question['type']),
              ],
            ),
            SizedBox(height: 8),

            // 题目
            Text(
              question['topic'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            if (question['notice'] != null &&
                question['notice'].toString().isNotEmpty)
              SizedBox(
                width: double.infinity,
                child: HighlightView(
                  question['notice'],
                  language: 'js',
                  theme: themeMap['a11y-dark']!,
                  padding: EdgeInsets.all(12),
                  textStyle: TextStyle(
                      fontFamily:
                          'SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace'),
                ),
              ),
            // 选项（如果有）
            if (question['type'] == '单选题')
              ...(_buildOptions(question['options'].split(RegExp(r'\r?\n')))),

            // 判断题选项
            if (question['type'] == '判断题')
              Row(
                children: [
                  Text('选项：'),
                  Text('[ true / false ]'),
                ],
              ),
            //区别是有选项
            Divider(),
            if (question['type'] == '单选题')
              Text(
                '答案：${getSelectTag(question)} ${question['answer']}',
                style: TextStyle(color: Colors.green),
              )
            else if (question['type'] == '判断题')
              Text(
                '答案：${question['answer']}',
                style: TextStyle(color: Colors.green),
              ),

            // TODO: 还需要有个高亮
            // 提示信息（如果有）
            if (question['prompt'] != null &&
                question['prompt'].toString().isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  '提示：${question['prompt']}',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // MARK: 如果是单选题,判断选中的第几个 ABCD
  getSelectTag(Map<String, dynamic> question) {
    print(
        'question.split(RegExp()===${question['options'].split(RegExp(r'\r?\n'))}');
    print('question[answer]${question['answer']}');

    int temp = question['options']
        .split(RegExp(r'\r?\n'))
        .indexOf(question['answer'].toString());
    print('temp===$temp');
    if (temp != -1) {
      return '${String.fromCharCode(65 + temp)}. ';
    } else {
      return '?. ';
    }
  }

  Widget _buildQuestionType(String type) {
    String typeText = '';
    Color typeColor = Colors.blue;

    switch (type) {
      case '单选题':
        typeText = '单选题';
        typeColor = Colors.blue;
        break;
      case '判断题':
        typeText = '判断题';
        typeColor = Colors.orange;
        break;
      case '简答题':
        typeText = '简答题';
        typeColor = Colors.green;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: typeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        typeText,
        style: TextStyle(color: typeColor),
      ),
    );
  }

  List<Widget> _buildOptions(List<dynamic> options) {
    return options.asMap().entries.map((entry) {
      int idx = entry.key;
      String option = entry.value.toString();
      return Padding(
        padding: EdgeInsets.only(left: 16, top: 4),
        child: Text('${String.fromCharCode(65 + idx)}. $option'),
      );
    }).toList();
  }

  // String.fromCharCode(65 + 0)) A

  // String _formatAnswer(Map<String, dynamic> question) {
  //   if (question['type'] == '1' || question['type'] == '1.1') {
  //     if (question['answer'] is List) {
  //       return question['answer']
  //           .map((idx) => String.fromCharCode(65 + idx))
  //           .join('、');
  //     }
  //   }
  //   return question['answer'].toString();
  // }
}
