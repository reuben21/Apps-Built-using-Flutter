import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/widgets/order_item.dart' as ordItem;


class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
          title:
          Text('Your Orders', style: Theme.of(context).textTheme.headline1)),
      body: ListView.builder(itemBuilder:(ctx,i)=>ordItem.OrderItem(orderData.orders[i]) ,itemCount: orderData.orders.length,),
    );
  }
}
