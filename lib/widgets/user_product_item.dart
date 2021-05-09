import 'package:flutter/material.dart';
import 'package:shop/colors.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        ),
      trailing: Row(children: <Widget>[
        IconButton(icon: Icon(Icons.edit), onPressed: (){},color: kSecondaryColor[100],),
        IconButton(icon: Icon(Icons.delete), onPressed: (){},color: kSecondaryColor[100],),
      ],),
    );
  }
}
