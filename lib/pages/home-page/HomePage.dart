import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
//路由管理
import 'package:go_router/go_router.dart';

import 'package:desktop_window/desktop_window.dart';
import 'package:my_app/tools/ReadFileAnyToJSON.dart';
import 'package:my_app/tools/platform.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedSubject;
  // 预设的科目列表
  final List<String> subjects = ['语文', '数学', '英语', '物理', '化学', '生物'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('学习助手'),
        actions: [],
      ),
      body: Column(
        children: [
          // 科目选择区域
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  '选择学习科目：',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedSubject,
                    hint: Text('请选择科目'),
                    isExpanded: true,
                    items: subjects.map((String subject) {
                      return DropdownMenuItem<String>(
                        value: subject,
                        child: Text(subject),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSubject = newValue;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _showAddSubjectDialog,
                ),
                IconButton(
                  icon: Icon(Icons.restore_outlined),
                  onPressed: _showAddSubjectDialog,
                ),
              ],
            ),
          ),
          // 功能区域
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(16),
              crossAxisCount: getPlatformType() == PlatformType.PC ? 4 : 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildFeatureCard(
                  icon: Icons.play_circle_filled,
                  title: '开始答题',
                  onTap: () {
                    if (selectedSubject != null) {
                      context.go('/quizPage');
                    } else {
                      _showSelectSubjectAlert();
                    }
                  },
                ),
                _buildFeatureCard(
                  icon: Icons.error_outline,
                  // title: '错题集',
                  title: 'highlightDemo',
                  onTap: () {
                    if (selectedSubject != null) {
                      context.go('/highlightDemo');
                    } else {
                      _showSelectSubjectAlert();
                    }
                  },
                ),
                _buildFeatureCard(
                  icon: Icons.history,
                  title: '读取Excel',
                  // title: '答题历史',
                  onTap: () async {
                    if (selectedSubject != null) {
                      inputNewTopic();
                    } else {
                      _showSelectSubjectAlert();
                    }

                    // await DesktopWindow.setWindowSize(Size(500, 500));
                    // context.go('/excelReadApp');
                  },
                ),
                _buildFeatureCard(
                  icon: Icons.analytics,
                  title: '学习统计',
                  onTap: () {
                    context.go('');
                  },
                ),
                _buildFeatureCard(
                  icon: Icons.input,
                  title: '导入新题',
                  onTap: () {
                    context.go('');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.blue,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // MARK: 添加新科目
  void _showAddSubjectDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: Text('添加新科目'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: '科目名称',
              hintText: '请输入科目名称',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('取消'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    subjects.add(controller.text);
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('添加'),
            ),
          ],
        );
      },
    );
  }

  //重置当前科目的学习记录
  resetLearningRecord() {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: Text('确认删除"$selectedSubject"的学习记录吗?'),
          content: Text('删除可不再找回!!!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('取消'),
            ),
            ElevatedButton(
              //导入简答题和答案.存到本地
              onPressed: () {
                // TODO: 清空本科目的学习记录
              },
              child: Text('确认'),
            ),
          ],
        );
      },
    );
  }

  // MARK: 导入新题
  inputNewTopic() {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: Text('请确认导入的题目类型.'),
          content: Text('目前导入的是"$selectedSubject"题目.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('再想想'),
            ),
            ElevatedButton(
              //导入简答题和答案.存到本地
              onPressed: () {
                selectFile();
                Navigator.pop(context);
              },
              child: Text('选择文件'),
            ),
          ],
        );
      },
    );
  }

  // MARK: 选择文件
  selectFile() async {
    //读取excel文件
    Uint8List? fileData = await ReadFileAnyToJSONClass.readFile();
    print('fileData==${fileData?.length}');
    if (fileData != null) {
      //解析文件内容
      var json = ReadFileAnyToJSONClass.extractDataFromExcel(bytes: fileData);
      print('selectFile---json---$json');
      gotoPreviewPage(json);
    }
  }

  // MARK: 选择文件后跳转后预览页面
  gotoPreviewPage(List<Map<String, dynamic>> json) {
    context.push('/previewInput', extra: {
      'questions': json,
      'subject': selectedSubject,
    });
  }

  //
  void _showSelectSubjectAlert() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('请先选择一个科目'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
