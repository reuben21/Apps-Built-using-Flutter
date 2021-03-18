import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../widgets/card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;
  TransactionList(this.transactions,this.delTx);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: transactions.isEmpty
          ? Center(
          child: LayoutBuilder(builder:(ctx,constraints){
                return Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Text("No Items Added",
                        style: Theme.of(context).textTheme.title),
                    SizedBox(height: 10,),
                    Container(

                        height: constraints.maxHeight * 0.6,
                        child: Image.asset("assets/image/waiting.png",fit:BoxFit.cover))
                  ],
                );
              })

            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return CardWidget(transactions[index].id,
                    transactions[index].title,
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    DateFormat.yMMMd().format(transactions[index].date),delTx);
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
