import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import '../colors.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: Container(
            color: kPrimaryColor[100],
            child: Row(children: <Widget>[
              Expanded(
                child: Consumer<Product>(
                  builder: (ctx, product, _) => IconButton(
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: kSecondaryColor[100],
                      size: 18,
                    ),
                    onPressed: () {
                      product.toggleFavoriteStatus();
                    },
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kSecondaryColor[100], fontSize: 14),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: kSecondaryColor[100],
                    size: 18,
                  ),
                  onPressed: () {
                    cart.addItem(product.id, product.price, product.title);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Added ${product.title} to Cart',
                              style: Theme.of(context).textTheme.headline4),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(label: 'Undo',textColor:kSecondaryColor[100],onPressed: (){
                            cart.removeSingleItem(product.id);
                          },)
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ));
  }
}
