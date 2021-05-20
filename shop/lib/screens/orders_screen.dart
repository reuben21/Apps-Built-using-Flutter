import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_item.dart' as ordItem;

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";



  @override
  Widget build(BuildContext context) {
    print("Building orders");
    // TODO: implement build
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text('Your Orders',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline1)),
        drawer: AppDrawer(),
        drawerScrimColor: kPrimaryColorAccent[100],
        body: FutureBuilder(future: Provider.of<Orders>(context, listen: false)
            .fetchAndSetOrders(),
          builder: (ctx, dataSnapshot) {

            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            } else {
              if (dataSnapshot.error != null) {
                return Center(child: CircularProgressIndicator(),);
              } else {
                return Consumer<Orders>(builder: (ctx,orderData,child)=>  ListView.builder(
                  itemBuilder: (ctx, i) =>
                      ordItem.OrderItem(orderData.orders[i]),
                  itemCount: orderData.orders.length,
                ));
              }
            }

            },
        ),
    );
  }
}
