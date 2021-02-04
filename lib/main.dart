import 'package:flutter/material.dart';
import 'cupertino_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { // StatelessWidget 화면이 변경될 일이 없는 위젯
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HelloPage('Hello World'));
  }
}

class HelloPage extends StatefulWidget { // 상태를 가질수 있는 위젯을 만들때 stateful 단축키를 쓴다
  final String title;

  const HelloPage(this.title); // 상태가 변경되지 않는 것은 재정의 위 필드에 정의
  @override
  _HelloPageState createState() => _HelloPageState();
} // 건드를 필요없이 위의 빌드가 호출이 된다. 이것은 위의 위젯의 상태를 가지기 위해 하는 작업

class _HelloPageState extends State<HelloPage> {
  String _message = 'Hello World'; // _를 붙이면 private라는 뜻이됨
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _changeMessage),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column( //열
              mainAxisAlignment : MainAxisAlignment.center, // 정렬 방향을 mainAxisAlignment 수직으로 하여 가운데로 오게 하겠다는 뜻
              // crossAxisAlignment 는 수평정렬 .end는 정렬맨 우측에 놓기
              children: <Widget>[
                Text(_message, style: TextStyle(fontSize: 30)),
                Text('$_counter', style: TextStyle(fontSize: 30)),
                RaisedButton(
                    child: Text('화면 이동'),
                    onPressed: (){
                      Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => CupertinoPage())
                      );
                    })
            ],
        ))
    );
  }

  void _changeMessage() {
    setState(() {
      _message='핼로 월드';
      _counter++;
    });
  }
}

