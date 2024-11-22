//读取文件并转成json
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class QuestionModel {
  final String type;
  final String topic;
  final String topicId;
  final String answer;
  int learnNum;
  final String? notice;
  QuestionModel(
      {required this.topicId,
      required this.answer,
      required this.type,
      required this.topic,
      this.learnNum = 0,
      this.notice});
}

const div = {
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

class ReadFileAnyToJSONClass {
  //读取文件
  static Future<Uint8List?> readFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls', 'xlsm', 'et', 'csv'],
    );
    print("FilePickerResult=====$result");
    if (result != null) {
      // 方式1：如果 withData: true 生效，直接使用 bytes
      if (result.files.first.bytes != null) {
        return result.files.first.bytes;
      }

      // 方式2：如果 bytes 为空，则从文件路径读取
      //在 macOS/iOS 平台上，FilePicker 默认不会直接加载文件内容到内存中（bytes）。我们需要从文件路径读取内容：
      final path = result.files.first.path;
      if (path != null) {
        final file = File(path);
        return await file.readAsBytes();
      }
    }
    return null;
  }

  //file data转json
  static List<Map<String, dynamic>> extractDataFromExcel(
      {required Uint8List bytes}) {
    Excel excel = Excel.decodeBytes(bytes);
    final List<Map<String, dynamic>> result = [];
    Map<String, dynamic> createMap = {};
    final keys = <String>[];
    // get data from first sheet
    final int n = excel.tables[excel.tables.keys.first]?.rows.length ?? 0;
    // final List<Data?> rows in excel.tables[excel.tables.keys.first]!.rows
    for (int i = 0; i < n; i++) {
      createMap = {};
      print('createMap===$createMap');
      final rows = excel.tables[excel.tables.keys.first]!.rows[i];
      for (int j = 0; j < rows.length; j++) {
        // index = 0 it will show an header of sheet
        final row = rows[j];
        // Create Header(Keys) for map
        if (i == 0 && row != null) {
          // get header/key from excel and make it list
          keys.add('${row.value}'); // Store key as string
          // Default value is empty
          createMap['${row.value}'] = "";
        }
        // add value in map
        else if (i > 0 && row != null) {
          if (keys.length - 1 >= j) createMap[keys[j]] = row.value;
        }
      }

      // Now We have make ready
      // we have multiple map/json
      // we we can make list of map/json
      // we add map have key and value both => add if i!=0

      if (i != 0) result.add(Map<String, dynamic>.from(createMap));
    }
    return result;
  }
}
