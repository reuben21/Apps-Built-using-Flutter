import 'package:expense_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../COLORS.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum=0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year
        ) {

          totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(groupedTransactionValues);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: colorMediumGreen,
      child: Row(
        children: <Widget>[
          // Expanded(
          //     flex: 1,
          //     child:
          // ),
          // Expanded(
          //     flex: 2,
          //     child:
          // ),
          // Expanded(
          //     flex: 1,
          //     child:
          // )
        ],
      ),
    );
  }
}
