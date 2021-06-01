import '../COLORS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectDate == null) {
      return;
    }
    widget.addTx(
        titleController.text, double.parse(amountController.text), selectDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(

            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 1,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                controller: titleController,
                cursorColor: colorLightGrey,
                maxLength: 20,
                onFieldSubmitted: (_) => _submitData(),
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: colorLightGrey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorLightGrey)),

                  // helperText: 'Amount',
                  suffixIcon: Icon(
                    Icons.check_circle,
                    color: colorLightGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: colorLightGrey,
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: amountController,
                cursorColor: colorLightGrey,
                maxLength: 20,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_) => _submitData(),
                decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(color: colorLightGrey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorLightGrey)),

                  // helperText: 'Helper text',
                  suffixIcon: Icon(
                    Icons.check_circle,
                    color: colorLightGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorLightGrey),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(selectDate == null
                      ? 'No Date Chosen'
                      : DateFormat.yMd().format(selectDate)),
                  OutlinedButton.icon(
                    onPressed: _presentDatePicker,
                    icon: Icon(Icons.add, size: 18, color: colorLightGrey),
                    label: Text("Choose Date",
                        style: TextStyle(
                          color: colorLightGrey,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
              OutlinedButton.icon(
                onPressed: _submitData,
                icon: Icon(Icons.add, size: 18, color: colorLightGrey),
                label: Text("Add Item",
                    style: TextStyle(
                      color: colorLightGrey,
                      fontSize: 18,
                    )),
              ),
            ]),
      ),
    );
  }
}
