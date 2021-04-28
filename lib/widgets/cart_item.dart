import 'package:flutter/material.dart';
import 'package:shop/colors.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItem(this.id, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: kPrimaryColor[100],
            child: FittedBox(child: Text('\$ ${price}')),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${(price*quantity)}'),
          trailing: Text('${quantity} x',style: Theme.of(context).textTheme.headline4),
        ),
      ),
    );
  }
}
