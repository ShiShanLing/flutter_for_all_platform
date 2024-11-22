import 'dart:typed_data';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//存储库
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'tools/ReadFileAnyToJSON.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter web test',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

//留着吧
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    const storage = FlutterSecureStorage();

    Future<void> readAll() async {
      final all = await storage.readAll();
      print('_readAll-all----$all');
    }
    //数据库设计

    /*
      目前制作简答题.
    */
    const dic = {
      "js": {
        "question_bank": [
          {
            //问题类型:1单选择题1.1多选题/2判断题/3问答题,填空题暂时不需要
            "type": '3',
            //题目
            "topic": '下面代码是干啥的?',
            //随机生成一个ID
            "topic_id": '1',
            //如果是选择判断,会有选项,是字符串 判断是[true, false],选择['', '', '']abc会打乱
            "options": [''],
            //答案,如果是简答题是个字符串,如果是选择题是一个数组
            "answer": '读取Excel文件内容,并转为JSON.',
            //提示信息,用于展示有提示信息的题目,比如有图片,有代码. excel图片怎么实现??
            "notice": "",
            "learn_num": 0
            //
          }
        ],
        //错题集,但是连续成功回答两次,就删除这个错题.
        "error_list": {
          'topic_id': {
            "num": 3,
          }
        },
      }
    };

    // MARK: 选择文件
    selectFile() async {
      //读取excel文件
      Uint8List? fileData = await ReadFileAnyToJSONClass.readFile();
      print('fileData==${fileData?.length}');
      if (fileData != null) {
        //解析文件内容
        var json = ReadFileAnyToJSONClass.extractDataFromExcel(bytes: fileData);
        //把json存到本地 如果不存在的话
        print('file-json---$json');
      }
    }

    /*
      基本逻辑 excel 中有3列 题目,提示信息,答案.
      失败的单独存一个对象中,用来记录这道题失败的次数(只做记录,用来刷失败的题目),如果下次成功了就删除;
      需要记录当前学习进度-因为可能学习到一半就关闭应用了.
    */
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('A random AWESOME idea:'), // ← Example change.

                  ElevatedButton(
                      onPressed: () {
                        storage.write(key: 'name', value: '石山岭');
                        readAll();
                      },
                      child: Text('写入1')),
                  ElevatedButton(
                      onPressed: () {
                        readAll();
                      },
                      child: Text('读取')),
                  ElevatedButton(
                      onPressed: () {
                        storage.deleteAll();
                        readAll();
                      },
                      child: Text('删除')),
                  ElevatedButton(
                      onPressed: () => selectFile(), child: Text('选择文件')),
                ],
              ),
            ],
          ),
        ));
  }
}
