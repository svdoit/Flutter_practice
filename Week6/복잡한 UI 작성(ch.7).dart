import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       title: Text(
           '복잡한 UI',
            style: TextStyle(color: Colors.black),
       ),
       centerTitle: true,
       actions: <Widget>[
         IconButton(
             icon: Icon(
               Icons.add,
               color: Colors.black,
             ),
             onPressed: (){},
         ),
       ],
     ),
     body: _pages[_index],
     bottomNavigationBar: BottomNavigationBar(
       onTap: (index){
         setState(() {
           _index = index;
         });
       },
       currentIndex: _index,
       items: <BottomNavigationBarItem>[
         BottomNavigationBarItem(
             title: Text('홈'),
             icon: Icon(Icons.home),
         ),
         BottomNavigationBarItem(
           title: Text('이용서비스'),
           icon: Icon(Icons.assignment),
         ),
         BottomNavigationBarItem(
           title: Text('내 정보'),
           icon: Icon(Icons.account_circle),
         ),
       ],
     ),
   );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                print('클릭');
              },
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                )
            ),
            GestureDetector(
              onTap: () {
              print('클릭');
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('블랙'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('클릭');
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('바이크'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('클릭');
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('대리'),
                ],
              ),
            ),
          ],
        ),

        //중간 여백
        SizedBox(
          height: 20,
        ),

        //둘째 줄
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                print('클릭');
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('클릭');
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('블랙'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('클릭');
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('바이크'),
                ],
              ),
            ),
            Opacity(
              opacity : 0.0,
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('대리'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMiddle(){
    return Text('Middle');
  }
  Widget _buildBottom(){
    return Text('Bottom');
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '이용서비스',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '내 정보',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}




