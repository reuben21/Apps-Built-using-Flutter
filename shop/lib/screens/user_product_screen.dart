import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {

  static const routeName = '/user-products';

  UserProductScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('You Shop', style: Theme.of(context).textTheme.headline1),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.add), onPressed: () {})
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => UserProductItem(
              productsData.items[i].title, productsData.items[i].imageUrl),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
