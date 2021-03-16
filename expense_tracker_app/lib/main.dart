import 'package:expense_tracker_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './COLORS.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Tracker',
      theme: ThemeData(
          primaryColor: colorMediumGreen,
          accentColor: colorBlack,
          fontFamily: 'Montserrat',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: colorBlack)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: colorBlack)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense Tracker'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: colorBlack,
              size: 25.0,
              semanticLabel: 'Delete Icon',
            ),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Chart(_recentTransaction),
              )),
          TransactionList(_userTransactions),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: const Icon(
            Icons.add_circle_outline,
            color: colorMediumGreen,
            size: 30.0,
            semanticLabel: 'Delete Icon',
          ),
          onPressed: () => _startAddNewTransaction(context),
          color: colorBlack,
        ),
      ),
    );
  }
}
