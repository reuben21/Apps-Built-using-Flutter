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
              backgroundColor: kPrimaryColor[100],
                  title: Text(
                    'Are you sure?',style: Theme.of(context).textTheme.headline1
                  ),
                  content:
                      Text('Do you want to remove ${title} from the cart',style: Theme.of(context).textTheme.headline4),
                  actions: <Widget>[
                    TextButton(onPressed: (){
                      Navigator.of(ctx).pop(false);
                    }, child: Text('No',style: Theme.of(context).textTheme.headline3)),
                    TextButton(onPressed: (){
                      Navigator.of(ctx).pop(true);
                    }, child: Text('Yes',style: Theme.of(context).textTheme.headline3))
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
        color: kPrimaryColor[100],
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundColor: kPrimaryColorAccent[100],
              child: FittedBox(
                  child: Text(
                '\$ ${price}',
                style: Theme.of(context).textTheme.headline4,
              )),
            ),
            title: Text(title, style: Theme.of(context).textTheme.headline4,),
            subtitle: Text('Total: \$${(price * quantity)}', style: Theme.of(context).textTheme.headline4,),
            trailing: Text('${quantity} x',
                style: Theme.of(context).textTheme.headline4),
          ),
        ),
      ),
    );
  }
}
