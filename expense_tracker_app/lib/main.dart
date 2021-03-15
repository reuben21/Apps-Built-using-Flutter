import 'package:flutter/material.dart';
import './transaction.dart';
import './card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'A New Monitor', amount: 69.99, date: DateTime.now()
    ),
    Transaction(
        id: 't1', title: 'A New Mouse', amount: 32.99, date: DateTime.now()
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expense Tracker'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: transactions.map((tx){
            return CardWidget(tx.title,tx.amount);
          }).toList()
          ,
        ));
  }
}
