import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_item.dart' as ordItem;

class OrdersScreen extends StatefulWidget {
  static const routeName = "/orders";

  OrdersScreen({Key key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });

     await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();

      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('Your Orders',
              style: Theme.of(context).textTheme.headline1)),
      drawer: AppDrawer(),
      drawerScrimColor: kPrimaryColorAccent[100],
      body:_isLoading ? Center(child: CircularProgressIndicator(),): ListView.builder(
        itemBuilder: (ctx, i) => ordItem.OrderItem(orderData.orders[i]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}