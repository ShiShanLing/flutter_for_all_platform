import 'package:flutter/material.dart';
//存储库
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyStorageApp extends StatelessWidget {
  const MyStorageApp({super.key});

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
    const storage = FlutterSecureStorage();

    Future<void> readAll() async {
      final all = await storage.readAll();
      print('_readAll-all----$all');
    }

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
                ],
              ),
            ],
          ),
        ));
  }
}
