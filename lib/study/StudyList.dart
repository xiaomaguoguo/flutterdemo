import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutterdemo/study/Strings.dart';
import 'dart:convert';
import 'package:flutterdemo/beans/Item.dart';
import 'package:flutterdemo/route/SlideRightRoute.dart';
import 'package:flutterdemo/route/ScaleRoute.dart';
import 'ButtonGuesture.dart';
import 'NetworkList.dart';
import 'StateCount.dart';
import 'MyScaffold.dart';
import 'ShoppingCar.dart';
import 'ShoppingList.dart';
import 'TabbedAppBarSample.dart';

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
    var a = new Product(name: 'Eggs');
    var b = new Product(name: 'Flour');
    var c = new Product(name: 'Chocolate chips');
    var d = [a, b, c];
    var studys = [
      Item("StateCount.dart", "这是一个计数器", StateCount(title: '这是一个计步器')),
      Item("NetworkList.dart", "这是网络请求的练习", ContentList()),
      Item("MyScaffold.dart", "这是学习布局", MyAppBar()),
      Item("MyButtonGesture.dart", "手势学习", MyButtonGesture()),
      Item("ShoppingList.dart", "购物车小Demo", ShoppingList(products: d)),
      Item("TabbedAppBarSample.dart", "Tab页面学习", TabbedAppBarSample())
    ];
    studys.forEach((item) => items.add(item));
    setState(() {
      _items = items;
    });
  }

  void _onCartChanged(Product product, bool inCart) {}

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
    //以下为四种打开页面的方式，包括自定义动画
//    Navigator.push(context, SlideRightRoute(widget: item.widget));
//    Navigator.push(context, ScaleRoute(widget: item.widget));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return item.widget;
    }));

//    Navigator.of(context).push(PageRouteBuilder(
//          pageBuilder: (BuildContext context, Animation<double> animation,
//              Animation<double> secondaryAnimation) {
//            return item.widget;
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
      appBar: AppBar(
        title: Text('学习目录'),
      ),
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
