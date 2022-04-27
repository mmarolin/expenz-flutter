import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightGreen,
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
