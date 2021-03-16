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
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return CardWidget(
              transactions[index].title,
              '\$${transactions[index].amount.toStringAsFixed(2)}',
              DateFormat.yMMMd().format(transactions[index].date));
        },
        itemCount: transactions.length,
        // children: transactions.map((tx) {
        //   return CardWidget(tx.title, '\$${tx.amount.toString()}',
        //       DateFormat.yMMMd().format(tx.date));
        // }).toList(),
      ),
    );
  }
}
