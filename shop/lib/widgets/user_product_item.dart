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

      title: Text(title, style: Theme.of(context).textTheme.headline2),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        ),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: (){},color: kSecondaryColor[100],),
          IconButton(icon: Icon(Icons.delete), onPressed: (){},color: kSecondaryColor[100],),
        ],),
      ),
    );
  }
}
