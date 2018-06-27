import 'package:flutter/material.dart';

class MyButtonGesture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var a = new Text('KNothing', style: Theme.of(context).textTheme.display1);
    var b = Image.network(
      'https://avatars1.githubusercontent.com/u/1886738?s=400&u=6bfea97f21a2a365aeef9d5b4c206d24b83c5f81&v=4',
    );

    return new Scaffold(
        appBar: AppBar(title: new Text('手势检测学习')),
        body: new Center(
            child: new GestureDetector(
          onTap: () {
            print('检测到点击手势了');
          },
          onDoubleTap: () {
            print('检测到双击手势了');
          },
          onHorizontalDragCancel: () {
            print('水平拖拽取消了....');
          },
          child: new Container(
            height: 500.0,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(5.0),
                color: Colors.lightBlue[500]),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[a, b],
            ),
//            child: new Counter(),
          ),
        )));
  }
}

class Counter extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _increment method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text('Increment'),
        ),
        new Text('Count: $_counter'),
      ],
    );
  }
}
//child: new Center(
//child: new Text('HaHaHaHaHa.......', style: Theme.of(context).textTheme.display1))
