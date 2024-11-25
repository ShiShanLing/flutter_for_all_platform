import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:my_app/main.dart';
//路由管理

import 'package:desktop_window/desktop_window.dart';
import 'package:my_app/Head/head.dart';

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
  void _showAddSubjectDialog() async {
    final result = await showTextInputDialog(
      context: context,
      title: '添加新科目',
      textFields: [
        DialogTextField(
          hintText: '请输入科目名称',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '科目名称不能为空';
            }
            return null;
          },
        ),
      ],
    );
    if (result != null) {
      String subjectName = result[0]; // 获取第一个输入框的值
      print('输入的科目名称: $subjectName');
      insertNewLearningType(subjectName, (() async {
        print('触发回调');
        context.loaderOverlay.hide();
        toastification.show(
          style: ToastificationStyle.flatColored,
          alignment: Alignment.center,
          context: context, // optional if you use ToastificationWrapper
          title: Text('添加成功'),
          showProgressBar: false,
          autoCloseDuration: const Duration(milliseconds: 1300),
        );
      }));
    } else {}
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
  inputNewTopic() async {
    final result = await showOkCancelAlertDialog(
        context: context,
        title: '请确认导入的题目类型.',
        message: '目前导入的是"$selectedSubject"题目.',
        okLabel: '选择文件',
        cancelLabel: '再想想');
    print("result===$result");
    if (result == OkCancelResult.ok) {
      selectFile();
    }
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

  // MARK: database 操作

  insertNewLearningType(String name, VoidCallback callBack) async {
    context.loaderOverlay.show();

    print("开始操作");
    //插入新科目
    final dbHelper = DatabaseHelper();

    // 插入科目
    final subjectId = await dbHelper.insertSubject(name, null);

    // 获取所有科目
    final subjects = await dbHelper.getAllSubjects();
    for (var subject in subjects) {
      print('科目: ${subject['name']} id:${subject['id']}');
    }

    // 获取某个类型系下所有的题目
    // final questions = await dbHelper.getQuestionsBySubject(subjectId);

    // 使用完后关闭数据库
    await dbHelper.close();
    print('插入完成');
    callBack();
  }

  // MARK: loading
  _showSingleAnimationDialog(
      //试着弹框
      BuildContext context,
      Indicator indicator,
      bool showPathBackground) {
    print('_showSingleAnimationDialog-context---$context');
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: false,
        builder: (ctx) {
          return Scaffold(
            appBar: AppBar(
              title: Text(indicator.toString().split('.').last),
            ),
            body: Padding(
              padding: const EdgeInsets.all(64),
              child: Center(
                child: LoadingIndicator(
                  indicatorType: indicator,
                  colors: _kDefaultRainbowColors,
                  strokeWidth: 4.0,
                  pathBackgroundColor:
                      showPathBackground ? Colors.black45 : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

const List<Color> _kDefaultRainbowColors = const [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];
