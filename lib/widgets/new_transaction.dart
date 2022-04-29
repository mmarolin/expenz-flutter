import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: 'Title',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.5, color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.lightGreen),
                      borderRadius: BorderRadius.circular(45),
                    )),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: TextField(
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                controller: amountController,
                decoration: InputDecoration(
                    labelText: 'Amount €',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.5, color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.lightGreen),
                      borderRadius: BorderRadius.circular(45),
                    )),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Icon(Icons.add, size: 25),
                onPressed: submitData,
              ),
            )
          ],
        ),
      ),
    );
  }
}
