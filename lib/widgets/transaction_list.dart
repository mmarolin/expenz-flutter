import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransaction = [
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
    return Column(
      children: _userTransaction.map((tx) {
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  margin: EdgeInsets.only(left: 15, bottom: 5),
                ),
                Container(
                  child: Text(DateFormat.yMMMd().add_Hm().format(tx.date),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      )),
                  margin: EdgeInsets.only(left: 15),
                ),
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
