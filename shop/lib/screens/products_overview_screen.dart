import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';
import '../providers/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('You Shop', style: Theme.of(context).textTheme.headline1),
      ),
      body:ProductsGrid() ,
    );
  }
}

