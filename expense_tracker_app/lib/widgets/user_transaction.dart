import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {


  @override
  _UserTransactionState createState() {
    return _UserTransactionState();
  }
}

class _UserTransactionState extends State<UserTransaction> {

  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'A New Monitor', amount: 69.99, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}