import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/badge.dart';
import '../widgets/product_grid.dart';
import '../providers/product.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement ProductsOverviewScreen
    // final productsContainer = Provider.of<Products>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('You Shop', style: Theme.of(context).textTheme.headline1),
        actions: <Widget>[
          PopupMenuButton(
            color: kPrimaryColor[100],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  // productsContainer.showFavoritesOnly();
                  _showOnlyFavorites = true;
                } else {
                  // productsContainer.showAll();
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites',
                    style: Theme.of(context).textTheme.headline4),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All',
                    style: Theme.of(context).textTheme.headline4),
                value: FilterOptions.All,
              )
            ],
            icon: Icon(
              Icons.more_vert,
              color: kSecondaryColor[100],
            ),
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) =>
                Badge(child: ch, value: cartData.cartItemCount.toString()),
            child: IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(
              Icons.shopping_cart,
              color: kSecondaryColor[100],
            )),
          )
        ],
      ),
      drawer: AppDrawer(),
      drawerScrimColor: kPrimaryColorAccent[100],
      body: Container(
          color: kPrimaryColorAccent[100],
          child: ProductsGrid(_showOnlyFavorites)),
    );
  }
}
