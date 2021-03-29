import 'package:expense_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../COLORS.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

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
      // print(DateFormat.E().format(weekDay));
      // print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0,1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0,(sum,item){
      return sum+item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // print(groupedTransactionValues);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: colorMediumGreen,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data){
            return  Flexible(
                fit:FlexFit.tight,
                child: ChartBar(data['day'],data['amount'],totalSpending == 0.0 ? 0.0 :(data['amount'] as double)/totalSpending));

            }).toList(),
        ),
      ),
    );
  }
}
