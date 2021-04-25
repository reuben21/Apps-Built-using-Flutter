import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  // CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart',style: Theme.of(context).textTheme.headline1)),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total',style: Theme.of(context).textTheme.headline2
                    ),
                   Spacer(),
                    Chip(
                      label: Text('\$${cart.totalAmount}',style: TextStyle(color: kSecondaryColor[100]),),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                      child: Text('ORDER NOW',style:  Theme.of(context).textTheme.headline2),
                      onPressed: (){},


                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
