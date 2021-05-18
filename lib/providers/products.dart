import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  // void showFavoritesOnly(){
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
  //
  // void showAll(){
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    var url = Uri.parse(
        "https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/products.json");
    try {
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String,dynamic>;
    final List<Product> loadedProducts = [];
    extractedData.forEach((prodId, prodData) {
      loadedProducts.add(Product(id: prodId, title: prodData['title'], description: prodData['description'], price:prodData['price'], imageUrl: prodData['imageUrl'],isFavorite: prodData['isFavorite']));
    });
    _items = loadedProducts;
    notifyListeners();
    } catch(error) {

    }

  }

  Future<void> addProduct(Product product) async {
    var url = Uri.parse(
        "https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/products.json");
    try {
      final response = await http.post(url,
          body: json.encode({
            "title": product.title,
            "description": product.description,
            "price": product.price,
            "imageUrl": product.imageUrl,
            "isFavorite": product.isFavorite
          }));
      var _responseData = json.decode(response.body);
      final newProduct = Product(
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
          id: _responseData['name']);
      _items.add(newProduct);
      notifyListeners();

    } catch (error) {
      print(error);
      throw error;
    }



  }

  void updatedProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
    } else {
      print(".....");
    }
    notifyListeners();
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
