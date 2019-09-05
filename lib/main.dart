import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'En Raya'),
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
  int _counter = 0;
  var _marcas = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
  String _playerMark = ' ';

  void _incrementCounter(position) {
    setState(() {
      if (_marcas[position] == ' ') {
        _counter++;
        _playerMark = 'O';
        if (_counter % 2 == 0) {
          _playerMark = 'X';
        }
        _marcas[position] = _playerMark;
      }
    });
  }

  void _resetGame() {
    setState(() {
      _counter = 0;
      _marcas = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
    });
  }

  /*void _finishGame(){
    var player1;
    var player2;
    for (var i = 0; i < _marcas.length; i++) {
      
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              child: RaisedButton(
                onPressed: () {
                  _incrementCounter(index);
                },
                child: Text(
                  _marcas[index],
                  style: TextStyle(fontSize: 25.0),
                ),
                color: Colors.red,
              ),
              width: 50.0,
              height: 50.0,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetGame,
        backgroundColor: Colors.blue,
        child: Icon(Icons.restore),
      ),
    );
  }
}
