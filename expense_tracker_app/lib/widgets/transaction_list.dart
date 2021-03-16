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
      height: 500,
      child: transactions.isEmpty
          ? Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  Text("No Items Added",
                      style: Theme.of(context).textTheme.title),
                  SizedBox(height: 10,),
                  Container(

                      height: 400,
                      child: Image.asset("assets/image/waiting.png",fit:BoxFit.cover))
                ],
              ),
            )
          : ListView.builder(
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