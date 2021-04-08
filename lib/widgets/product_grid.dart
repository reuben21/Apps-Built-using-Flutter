import 'package:flutter/material.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  ProductsGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<Products>(context);
    final products = productsData.items;


    // TODO: implement build
    return GridView.builder(padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10)
      , itemBuilder: (ctx, i) => ProductItem(products[i].id,products[i].title,products[i].imageUrl)
      ,itemCount: products.length,);
  }
}
