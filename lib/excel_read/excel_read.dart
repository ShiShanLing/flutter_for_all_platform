import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'ReadFileAnyToJSON.dart';

class MyExcelReadApp extends StatelessWidget {
  const MyExcelReadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter web test',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //选择题 判断题 问答题(有参考答案) 实际场景应该都是问答题,要能展示代码.
    // MARK: 选择文件
    selectFile() async {
      //读取excel文件
      Uint8List? fileData = await ReadFileAnyToJSONClass.readFile();
      print('fileData==${fileData?.length}');
      if (fileData != null) {
        //解析文件内容
        var json = ReadFileAnyToJSONClass.extractDataFromExcel(bytes: fileData);
        print('file-json---$json');
      }
    }

    //读取excel文件内容 转为 json格式
    readExcelDataToJSON() {}
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
                  ElevatedButton(
                      onPressed: () => selectFile(), child: Text('选择文件')),
                ],
              ),
            ],
          ),
        ));
  }
}
