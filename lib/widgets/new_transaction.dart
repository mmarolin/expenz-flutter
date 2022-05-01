import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
                controller: _titleController,
                onSubmitted: (_) => submitData(),
                decoration: InputDecoration(
                    labelText: 'Title',
                    filled: true,
                    fillColor: Color.fromARGB(255, 175, 174, 174),
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
                controller: _amountController,
                decoration: InputDecoration(
                    labelText: 'Amount €',
                    filled: true,
                    fillColor: Color.fromARGB(255, 175, 174, 174),
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
            Container(
              height: 80,
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : 'Date: ${DateFormat.yMd().format(_selectedDate!)}',
                        style: TextStyle(fontSize: 16)),
                  ),
                  TextButton(
                    child: Text('Choose Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
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
                child: Icon(Icons.add,
                    size: 24, color: Color.fromARGB(255, 53, 97, 55)),
                onPressed: submitData,
              ),
            )
          ],
        ),
      ),
    );
  }
}
