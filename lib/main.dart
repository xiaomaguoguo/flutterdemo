import 'package:flutter/material.dart';
import 'package:flutterdemo/study/StudyList.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true; //这步可以打开调试，哈哈
//  debugPaintBaselinesEnabled = true;
//  debugPaintPointersEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.red,
      ),

//      home: new StateCount(title: 'Flutter Demo Home Page'),
//      home: ContentList(),
      home: StudyList(),
    );
  }
}

/*void main() {
  runApp(new MaterialApp(
    home: new MyAppHome(), // becomes the route named '/'
    routes: <String, WidgetBuilder> {
      '/a': (BuildContext context) => new MyPage(title: 'page A'),
      '/b': (BuildContext context) => new MyPage(title: 'page B'),
      '/c': (BuildContext context) => new MyPage(title: 'page C'),
    },
  ));
}*/

//打开新页面： Navigator.of(context).pushNamed('/b'); 关闭当前页面可以使用 Navigator.of(context).pop(this);
