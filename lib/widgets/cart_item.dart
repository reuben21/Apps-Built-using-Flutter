import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem(this.id, this.productId, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text(
                    'Are you sure?',
                  ),
                  content:
                      Text('Do you want to remove this item from the cart'),
                  actions: <Widget>[
                    FlatButton(onPressed: (){
                      Navigator.of(ctx).pop(false);
                    }, child: Text('No')),
                    FlatButton(onPressed: (){
                      Navigator.of(ctx).pop(true);
                    }, child: Text('Yes'))
                  ],
                ));
      },
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      background: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Icon(Icons.delete, color: Colors.white, size: 40),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundColor: kPrimaryColor[100],
              child: FittedBox(
                  child: Text(
                '\$ ${price}',
                style: Theme.of(context).textTheme.headline4,
              )),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('${quantity} x',
                style: Theme.of(context).textTheme.headline4),
          ),
        ),
      ),
    );
  }
}
