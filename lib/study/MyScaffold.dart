import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text('AAAAAAAAAAA'),
        ),
        body: new Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: new Text('Hello, world!')),
        backgroundColor: Colors.orange);

//    return new Container(
//      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
//      padding: const EdgeInsets.symmetric(horizontal: 8.0),
//      decoration: new BoxDecoration(color: Colors.red),
//      // Row 是水平方向的线性布局（linear layout）
//      child: new Row(
//        //列表项的类型是 <Widget>
//        children: <Widget>[
//          new IconButton(
//            icon: new Icon(Icons.menu),
//            tooltip: 'Navigation menu',
//            onPressed: null, // null 会禁用 button
//          ),
//          // Expanded expands its child to fill the available space.
//          new Expanded(
//            child: title,
//          ),
//          new IconButton(
//            icon: new Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: null,
//          ),
//        ],
//      ),
//    );
  }
}
