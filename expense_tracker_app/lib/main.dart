import 'package:expense_tracker_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './COLORS.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expense Tracker',
      theme: ThemeData(
          primaryColor: colorMediumGreen,
          accentColor: colorBlack,
          fontFamily: 'Montserrat',
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
              title: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: colorBlack)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData
                  .light()
                  .textTheme
                  .copyWith(
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

  bool _showChart = false;

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
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
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
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
    );

    final txList = Container(
        width: double.infinity,
        height: (MediaQuery
            .of(context)
            .size
            .height -
            appBar.preferredSize.height -
            MediaQuery
                .of(context)
                .padding
                .top) *
            0.75,
        child: TransactionList(
            _userTransactions, _deleteTransaction));
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(

          child: !isLandscape ? Column(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: (MediaQuery
                          .of(context)
                          .size
                          .height -
                          appBar.preferredSize.height -
                          MediaQuery
                              .of(context)
                              .padding
                              .top) *
                          0.25,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chart(_recentTransaction),
                      )), txList,
                ],
              ) : Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Show Chart"),
                        Switch(
                          value: _showChart,
                          onChanged: (value) {
                            setState(() {
                              _showChart = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  _showChart ? Container(
                      width: double.infinity,
                      height: (MediaQuery
                          .of(context)
                          .size
                          .height -
                          appBar.preferredSize.height -
                          MediaQuery
                              .of(context)
                              .padding
                              .top) *
                          0.7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chart(_recentTransaction),
                      )) : txList
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
