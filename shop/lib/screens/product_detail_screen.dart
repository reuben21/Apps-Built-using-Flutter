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
      // appBar: AppBar(
      //   title: Text(loadedProduct.title,
      //       style: Theme.of(context).textTheme.headline1),
      // ),
      body: Container(
        height: double.infinity,
        color: kPrimaryColorAccent[100],
        child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(

                  background: Container(
                    height: 300,
                    width: double.infinity,
                    child: Hero(
                        tag: loadedProduct.id,
                        child: Image.network(loadedProduct.imageUrl,
                            fit: BoxFit.cover)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              SliverList(

                  delegate: SliverChildListDelegate([
                    Text(
                      "${loadedProduct.title}",

                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Price : \$ ${loadedProduct.price}",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
                Divider(color: kSecondaryColor[100],),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    loadedProduct.description,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(
                  height: 800,
                ),
              ]))
            ],
          ),
        ),
    );
  }
}
