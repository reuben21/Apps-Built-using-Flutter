import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
          color: Colors.redAccent,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.redAccent),
        ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.black,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.redAccent),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed("/");
          }),
          SizedBox(
            height: 20,
          ),
          buildListTile('Filters', Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
