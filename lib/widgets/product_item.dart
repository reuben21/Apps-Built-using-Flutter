import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(

        borderRadius: BorderRadius.circular(12),
        child: GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: id);
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: Container(
            color: kPrimaryColorAccent[100],
            child: Row(
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite, color: kSecondaryColor[100], size: 18,),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kSecondaryColor[100], fontSize: 14),),
                  ),
                  Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart, color: kSecondaryColor[100],
                          size: 18,),
                        onPressed: () {},
                      ),
                  ),


                ]
            ),


          ),
        ));
  }
}
