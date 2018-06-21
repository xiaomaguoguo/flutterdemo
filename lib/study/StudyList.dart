import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutterdemo/study/Strings.dart';
import 'dart:convert';
import 'package:flutterdemo/beans/Item.dart';

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
    var studys = [Item("AA", "此处是A的描述"), Item("BB", "此处是B的描述")];
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
        subtitle: Text(
          '${item.desc}',
        ));
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
