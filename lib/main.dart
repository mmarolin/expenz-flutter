import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenz',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenz'),
      ),
      body: Column(children: <Widget>[
        Card(
          child: Text('CHART!'),
          elevation: 10,
        ),
        Card(
          child: Text('LIST OF TX'),
          elevation: 10,
        ),
      ]),
    );
  }
}
