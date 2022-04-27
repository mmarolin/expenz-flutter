import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenz',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 32.55,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text('Expenz',
            style: TextStyle(color: Color.fromARGB(255, 83, 81, 81))),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.green],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            color: Colors.grey,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              height: 50,
              child: Text(
                'CHART!',
              ),
            ),
            elevation: 10,
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.greenAccent,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text('€ ${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 53, 97, 55),
                        )),
                    alignment: Alignment.center,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(tx.title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        margin: EdgeInsets.only(left: 15, bottom: 5),
                      ),
                      Container(
                        child: Text(tx.date.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            )),
                        margin: EdgeInsets.only(left: 15),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
