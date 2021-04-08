import 'package:flutter/cupertino.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {

    return [..._items];
  }

}