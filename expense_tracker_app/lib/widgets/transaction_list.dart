import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../widgets/card.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: transactions.map((tx) {
          return CardWidget(tx.title, '\$${tx.amount.toString()}',
              DateFormat.yMMMd().format(tx.date));
        }).toList(),
      ),
    );
  }
}
