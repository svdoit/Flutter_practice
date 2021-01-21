import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Todo{
  bool isDone = false;
  String title;

  Todo(this.title);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일 관리',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  final _items = <Todo>[]; //할 일 목록 저장

  var _todoController = TextEditingController(); // 할 일 문자열 조작을 위한 컨트롤러

  @override
  void dispose(){
    _todoController.dispose(); //사용이 끝나면 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('남은 할 일'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _todoController,
                    ),
                  ),
                  RaisedButton(
                      child: Text('추가'),
                      onPressed: (){},
                  ),
                ],
              ),
              Expanded(
                  child:ListView(
                    children: <Widget>[],
                  ),
              ),
            ],
          ),
        )
    );
  }
}
