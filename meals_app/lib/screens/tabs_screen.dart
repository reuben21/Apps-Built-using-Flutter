import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
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

  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favourites'}
  ];

  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title'], style: Theme.of(context).textTheme.headline6),
      ),
      drawer:MainDrawer(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        currentIndex: _selectPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
