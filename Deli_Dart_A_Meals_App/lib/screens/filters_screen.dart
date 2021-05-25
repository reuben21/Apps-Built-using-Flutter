// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _veganFree = false;
  bool _lactoseFree = false;

  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian= widget.currentFilters['vegetarian'];
    _veganFree= widget.currentFilters['vegan'];
    _lactoseFree= widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title, style: Theme.of(context).textTheme.headline4),
        value: currentValue,
        subtitle:
            Text(description, style: Theme.of(context).textTheme.headline3),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Filters!'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final _selectedFilter = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _veganFree,
                    'vegetarian': _vegetarian,
                  };
                  // print(_selectedFilter);
                  widget.saveFilters(_selectedFilter);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection'),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchListTile("Gluten Free",
                    'Only include Gluten free meals', _glutenFree, (newValue) {

                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Lactose Free",
                    'Only include Lactose free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan Free", 'Only include Vegan free meals', _veganFree,
                    (newValue) {
                  setState(() {
                    _veganFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian Free",
                    'Only include Vegetarian free meals',
                    _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
