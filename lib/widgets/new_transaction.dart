import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './user_transactions.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: 'Title',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: amountController,
                decoration: InputDecoration(
                    labelText: 'Amount €',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            TextButton(
              child: Text('Add Expenz'),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 53, 97, 55)),
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              onPressed: () {
                addTx(
                    titleController.text, double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
