import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/colors.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  //
  // ProductDetailScreen(this.title);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    // TODO: implement build
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title,
            style: Theme.of(context).textTheme.headline1),
      ),
      body: Container(
        height: double.infinity,
        color: kPrimaryColorAccent[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child:
                      Image.network(loadedProduct.imageUrl, fit: BoxFit.cover),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Price \$ ${loadedProduct.price}",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  loadedProduct.description,
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
