import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {

    await Provider.of<Products>(context,listen: false).fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    print("Refreshing");
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Your Products', style: Theme.of(context).textTheme.headline1),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              })
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder:(ctx,snapshot)=> snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),) :RefreshIndicator(
          onRefresh: ()=> _refreshProducts(context),
          child:  Container(
              color: kPrimaryColorAccent[100],
              child: Consumer<Products>(
                builder:(ctx,productsData,_)=> Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    itemBuilder: (_, i) => UserProductItem(
                      productsData.items[i].title,
                      productsData.items[i].imageUrl,
                      productsData.items[i].id,
                    ),
                    itemCount: productsData.items.length,
                  ),
                ),
              ),
            ),

        ),
      ),
    );
  }
}
