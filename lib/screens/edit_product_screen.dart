import 'package:flutter/material.dart';
import 'package:shop/colors.dart';

class EditProductScreen extends StatefulWidget {

  static const routeName = '/edit-product';

  EditProductScreen({Key key}) : super(key: key);

  @override
  _EditProductScreenState createState() {
    return _EditProductScreenState();
  }
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('You Shop', style: Theme.of(context).textTheme.headline1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Title', focusColor: kPrimaryColor[100]),
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
