import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutterdemo/study/Strings.dart';
import 'dart:convert';
import 'package:flutterdemo/beans/feed.dart';

//网络数据加载请求学习
class ContentList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConstantListState();
  }
}

class ConstantListState extends State<ContentList> {
  var _items = [];

  @override
  void initState() {
    super.initState();
    loadDataFromNetwork();
  }

  void loadDataFromNetwork() async {
    var dataUrl =
        "https://app.kangzubin.com/iostips/api/feed/list?page=1&from=flutter-app&version=1.0";

    Response respon = await get(dataUrl);
    final body = json.decode(respon.body);
    final int code = body["code"];
    if (code == 0) {
      //表明返回的数据正确
      final feeds = body["data"]["feeds"];
      var items = [];
      feeds.forEach((item) =>
          items.add(Feed(item["author"], item["title"], item["postdate"])));
      setState(() {
        _items = items;
      });
    }
  }

  Widget _buildRow(int i) {
    Feed feed = this._items[i];
    return ListTile(
        title: Text(
          feed.title,
          overflow: TextOverflow.fade,
        ),
        subtitle: Text(
          '${feed.postdate} @${feed.author}',
        ),
        onTap: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('网络请求')),
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
