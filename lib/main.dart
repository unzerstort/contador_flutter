import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(title: "Contador de pessoas", home: Home())); //Material App
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= 20) {
        _mensagem = "Lotado, não pode entrar.";
        _pessoa = 20;
      } else if (_pessoa < 20 && _pessoa >= 0) {
        _mensagem = "Pode entrar!";
      } else {
        _pessoa = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: Text('Contador de pessoas',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey.shade900)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: $_pessoa',
              style: const TextStyle(fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: const Icon(Icons.remove),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(_mensagem,
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontStyle: FontStyle.italic,
                  fontSize: 16.0,
                ))
          ]

          //  Text('Pessoas: $_pessoa',
          // ),

          ),
    );
  }
}
