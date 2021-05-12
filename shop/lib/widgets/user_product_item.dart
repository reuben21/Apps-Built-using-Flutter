import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(this.title, this.imageUrl, this.id);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),

      decoration: BoxDecoration(
          color: kPrimaryColor[100],
        borderRadius: BorderRadius.all(Radius.circular(10))),
      
      child: ListTile(

        title: Text(title, style: Theme.of(context).textTheme.headline2),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          ),
        trailing: Container(
          width: 100,
          child: Row(children: <Widget>[
            IconButton(icon: Icon(Icons.edit), onPressed: (){
              Navigator.of(context).pushNamed(EditProductScreen.routeName,arguments: id);
            },color: kSecondaryColor[100],),
            IconButton(icon: Icon(Icons.delete), onPressed: (){
              Provider.of<Products>(context, listen: false).deleteProduct(id);
            },color: kSecondaryColor[100],),
          ],),
        ),
      ),
    );
  }
}
