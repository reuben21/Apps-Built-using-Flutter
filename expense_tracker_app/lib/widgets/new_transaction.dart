import 'package:expense_tracker_app/COLORS.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <=0 ) {
      return;
    }
    widget.addTx(titleController.text,
        double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: titleController,
                cursorColor: colorLightGrey,
                maxLength: 20,
                onFieldSubmitted: (_)=>_submitData(),
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: colorLightGrey,
                    fontSize: 20,
                  ),
                  // helperText: 'Amount',
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorLightGrey,),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: amountController,
                cursorColor:colorLightGrey,
                maxLength: 20,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_)=>_submitData(),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(
                    color: colorLightGrey,
                    fontSize: 20,
                  ),
                  // helperText: 'Helper text',
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorLightGrey),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton.icon(
                onPressed: _submitData,
                icon: Icon(Icons.add, size: 18,color: colorLightGrey),
                label: Text("Add Item",
                    style: TextStyle(
                      color: colorLightGrey,
                      fontSize: 18,
                    )),
              ),
            )
          ]),
    );
  }
}
