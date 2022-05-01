import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.66475,
      child: transactions.isEmpty
          ? Column(children: <Widget>[
              SizedBox(height: 20),
              Opacity(
                opacity: 0.5,
                child: Text(
                  'No expenses added yet!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                height: 250,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ])
          : ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30,
                          child: Padding(
                              padding: EdgeInsets.all(6),
                              child: FittedBox(
                                child: Text('€ ${transactions[index].amount}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor)),
                              )),
                        ),
                        title: Container(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(transactions[index].title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          margin: EdgeInsets.only(left: 15, bottom: 5),
                        ),
                        subtitle: Container(
                          child: Text(
                              DateFormat.MMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              )),
                          margin: EdgeInsets.only(left: 15),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outlined),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        )),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
