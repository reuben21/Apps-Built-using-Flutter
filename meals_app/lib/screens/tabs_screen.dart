import 'package:flutter/material.dart';
import './favorites_screen.dart';

import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Deli Dart'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                    icon: Icon(
                      Icons.category,
                    ),
                    text: 'Categories'),
                Tab(
                    icon: Icon(
                      Icons.star,
                    ),
                    text: 'Favorites'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              CategoriesScreen(),
              FavoritesScreen(),
            ]
          ),
        ));
  }
}
