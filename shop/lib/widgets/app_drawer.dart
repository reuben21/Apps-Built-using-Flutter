import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(


      child: Container(
        color: kPrimaryColorAccent[100],
        child: Column(


          children: <Widget>[
            AppBar(
                title:
                Text('Your Cart', style: Theme.of(context).textTheme.headline1)),
            Divider(),
            ListTile(
              leading: Icon(Icons.shop,color: kSecondaryColor[100],),
              title:Text('Your Shop', style: Theme.of(context).textTheme.headline3),
              onTap: (){
                Navigator.of(context).pushReplacementNamed("/");
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart,color: kSecondaryColor[100],),
              title:Text('Your Orders', style: Theme.of(context).textTheme.headline3),
              onTap: (){
                Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.edit,color: kSecondaryColor[100],),
              title:Text('Manage Products', style: Theme.of(context).textTheme.headline3),
              onTap: (){
                Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app,color: kSecondaryColor[100],),
              title:Text('Logout', style: Theme.of(context).textTheme.headline3),
              onTap: (){
                Navigator.of(context).pop();
                Provider.of<Auth>(context,listen: false).logout();
              },
            ),


          ],
        ),
      ),
    );
  }
}
