import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tres en Raya'),
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
  var _winner = '';
  String _msg = 'Game in course';
  var lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  void _checkWinner(position) {
    if (_winner != '') {
      print('ganador' + _winner);
    } else {
      print('siguiente');
      setState(() {
        if (_marcas[position] == ' ') {
          _counter++;
          if (_counter % 2 == 0) {
            _playerMark = 'X';
          } else {
            _playerMark = 'O';
          }
          _marcas[position] = _playerMark;
        }
      });
    }
    for (var i = 0; i < lines.length; i++) {
      var option = lines[i];
      if (_marcas[option[0]] != ' ' &&
          _marcas[option[0]] == _marcas[option[1]] &&
          _marcas[option[0]] == _marcas[option[2]]) {
        setState(() {
          _winner = _marcas[option[0]];
          _msg = 'El ganador es: ' + _winner;
        });
      }
    }
  }

  void _resetGame() {
    setState(() {
      _counter = 0;
      _winner = '';
      _msg = 'Game in course';
      _marcas = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              _msg,
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                return Center(
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        _checkWinner(index);
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        color: _marcas[index] == ' '
                            ? Colors.blueGrey
                            : _marcas[index] == 'X' ? Colors.red : Colors.blue,
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Text(
                            _marcas[index],
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetGame,
        backgroundColor: Colors.blue,
        child: Icon(Icons.restore),
      ),
    );
  }
}
