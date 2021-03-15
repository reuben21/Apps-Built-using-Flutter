import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        id: 't1', title: 'A New Monitor', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'A New Mouse', amount: 32.99, date: DateTime.now())
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expense Tracker'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: titleController,
                        cursorColor: Colors.blueAccent,
                        maxLength: 20,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20,
                          ),
                          // helperText: 'Amount',
                          suffixIcon: Icon(
                            Icons.check_circle,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6200EE)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: amountController,
                        cursorColor: Colors.blueAccent,
                        maxLength: 20,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20,
                          ),
                          // helperText: 'Helper text',
                          suffixIcon: Icon(
                            Icons.check_circle,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6200EE)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                          print(titleController.text);
                          // Respond to button press
                        },
                        icon: Icon(Icons.add, size: 18),
                        label: Text("Add Item",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18,
                            )),
                      ),
                    )
                  ]),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: transactions.map((tx) {
                  return CardWidget(tx.title, '\$${tx.amount.toString()}',
                      DateFormat.yMMMd().format(tx.date));
                }).toList(),
              ),
            ),
          ],
        ));
  }
}
