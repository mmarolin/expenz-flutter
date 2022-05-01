import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
import './themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'Expenz',
            debugShowCheckedModeBanner: false,
            themeMode: currentMode,
            theme: ThemeClass.lightTheme,
            darkTheme: ThemeClass.darkTheme,
            home: MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 99.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Groceries',
    //   amount: 32.55,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        isScrollControlled: true,
        builder: (_) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.80,
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 60,
          title: Container(
            margin: EdgeInsets.only(left: 3, top: 5),
            child: Text(
              'Expenz',
              style: TextStyle(
                fontFamily: 'ShadowsIntoLight',
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5),
              child: IconButton(
                  icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                      ? Icons.dark_mode
                      : Icons.light_mode),
                  onPressed: () {
                    MyApp.themeNotifier.value =
                        MyApp.themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                  }),
            ),
            Container(
              padding: EdgeInsets.only(right: 10, left: 10, top: 5),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _startAddNewTransaction(context)),
            ),
          ]),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 5),
            Chart(_recentTransactions),
            Expanded(
                child: TransactionList(_userTransactions, _deleteTransaction))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Color.fromARGB(255, 53, 97, 55)),
        backgroundColor: Colors.lightGreen,
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
