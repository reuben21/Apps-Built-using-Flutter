import 'package:flutter/material.dart';
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
    final loadedProduct = Provider.of<Products>(context,listen: false).findById(productId);



    return Scaffold(appBar: AppBar(
      title: Text(loadedProduct.title, style: Theme.of(context).textTheme.headline1),
    ),);
  }
}