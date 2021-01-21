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
                    children: _items.map((todo) => _buildItemWidget(todo)).toList(),
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _buildItemWidget(Todo todo){
    return ListTile(
      onTap: (){}, // Todo클릭 시 완료/취소되도록 수정
      title: Text(
        todo.title, //할 일
        style: todo.isDone //완료일 때는 스타일 적용
            ? TextStyle(
          decoration: TextDecoration.lineThrough, //취소선
          fontStyle: FontStyle.italic,
        )
            : null, //아무 스타일도 적용 안 함
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: (){}, //Todo쓰레기통 클릭 시 삭제되도록 수정
      ),
    );
  }

  //할 일 추가 메서드
  void _addTodo(Todo todo){
    setState((){
      _items.add(todo);
      _todoController.text = '';
    });
  }

  //할 일 삭제 메서드
  void _deleteTodo(Todo todo){
    setState(() {
      _items.remove(todo);
    });
  }

  //할 일 완료/미완료 메서드
  void _toggleTodo(Todo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

}
