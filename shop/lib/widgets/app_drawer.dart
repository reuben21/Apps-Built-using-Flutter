import 'package:flutter/material.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(


      child: Column(

        children: <Widget>[
          AppBar(
              title:
              Text('Your Cart', style: Theme.of(context).textTheme.headline1)),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title:Text('Your Shop', style: Theme.of(context).textTheme.headline3),
            onTap: (){
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title:Text('Your Orders', style: Theme.of(context).textTheme.headline3),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            },
          )



        ],
      ),
    );
  }
}
