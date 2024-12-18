import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'example_map.dart';
import 'package:go_router/go_router.dart';

const title = 'Flutter Highlight Gallery';

class MyHighlightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String language = 'js';
  String theme = 'a11y-dark';

  Widget _buildMenuContent(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(children: <Widget>[
        Text(text, style: TextStyle(fontSize: 16)),
        Icon(Icons.arrow_drop_down)
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.keyboard_return),
              onPressed: () {
                context.pop();
              }),
          PopupMenuButton(
            child: _buildMenuContent(language),
            itemBuilder: (context) {
              return exampleMap.keys.map((key) {
                return CheckedPopupMenuItem(
                  value: key,
                  checked: language == key,
                  child: Text(key),
                );
              }).toList();
            },
            onSelected: (selected) {
              setState(() {
                language = selected;
              });
            },
          ),
          PopupMenuButton<String>(
            child: _buildMenuContent(theme),
            itemBuilder: (context) {
              return themeMap.keys.map((key) {
                return CheckedPopupMenuItem(
                  value: key,
                  checked: theme == key,
                  child: Text(key),
                );
              }).toList();
            },
            onSelected: (selected) {
              setState(() {
                theme = selected;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.code),
            tooltip: 'Source Code',
            onPressed: () {
              launchUrl(Uri.parse('https://github.com/pd4d10/highlight'));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HighlightView(
              exampleMap[language] ?? '',
              language: language,
              theme: themeMap[theme]!,
              padding: EdgeInsets.all(12),
              textStyle: TextStyle(
                  fontFamily:
                      'SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace'),
            )
          ],
        ),
      ),
    );
  }
}
