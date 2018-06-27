import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutterdemo/study/Strings.dart';
import 'dart:convert';
import 'package:flutterdemo/beans/Item.dart';
import 'SlideRightRoute.dart';
import 'NetworkList.dart';
import 'StateCount.dart';

//学习进度列表
class StudyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudyListState();
  }
}

class StudyListState extends State<StudyList> {
  var _items = [];

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList() {
    //表明返回的数据正确
    var items = [];
    var studys = [
      Item("StateCount.dart", "这是一个计数器", StateCount(title: '这是一个计步器')),
      Item("NetworkList.dart", "这是网络请求的练习", ContentList())
    ];
    studys.forEach((item) => items.add(item));
    setState(() {
      _items = items;
    });
  }

  Widget _buildRow(int i) {
    Item item = this._items[i];
    return ListTile(
        title: Text(
          item.title,
          overflow: TextOverflow.fade,
        ),
        trailing: new Icon(Icons.favorite, color: Colors.red),
        subtitle: Text(
          '${item.desc}',
        ),
        onTap: () {
          _openNewPage(item);
        });
  }

  void _openNewPage(Item item) {
    Navigator.push(context, SlideRightRoute(widget: item.widget));
//    Navigator.push(context, SlideRightRoute(widget: ContentList()));
//    Navigator.of(context).push(PageRouteBuilder(
//          pageBuilder: (BuildContext context, Animation<double> animation,
//              Animation<double> secondaryAnimation) {
//            return new ContentList();
//          },
//          transitionsBuilder: (BuildContext context,
//              Animation<double> animation,
//              Animation<double> secondaryAnimation,
//              Widget child) {
//            return SlideTransition(
//              position: new Tween<Offset>(
//                begin: const Offset(-1.0, 0.0),
//                end: Offset.zero,
//              ).animate(animation),
//              child: new SlideTransition(
//                position: new Tween<Offset>(
//                  begin: Offset.zero,
//                  end: const Offset(-1.0, 0.0),
//                ).animate(secondaryAnimation),
//                child: child,
//              ),
//            );
//          },
//        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.stateListTitle)),
      body: new ListView.builder(
        padding: const EdgeInsets.all(13.0),
        itemCount: _items.length * 2,
        itemBuilder: (BuildContext context, int position) {
          // 此处为添加分割线
          if (position.isOdd) return Divider();
          final index = position ~/ 2;
          return _buildRow(index);
        },
      ),
    );
  }
}
