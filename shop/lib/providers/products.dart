import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shop/models/http_exception.dart';
import 'product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [];
  final String authToken;
  final String userId;

  Products(this.authToken, this.userId, this._items);

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // Future<void> fetchAndSetAllProducts() async {
  //   final url = Uri.parse(
  //       'https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken&orderBy="creatorId"&equalTo="$userId"');
  //   try {
  //     final response = await http.get(url);
  //     final extractedData = json.decode(response.body) as Map<String, dynamic>;
  //     final url2 = Uri.parse(
  //         "https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/userFavorites/$userId.json?auth=$authToken");
  //     final favoriteResponse = await http.get(url2);
  //     final favoriteData = json.decode(favoriteResponse.body);
  //     final List<Product> loadedProducts = [];
  //     extractedData.forEach((prodId, prodData) {
  //       loadedProducts.add(Product(
  //         id: prodId,
  //         title: prodData['title'],
  //         description: prodData['description'],
  //         price: prodData['price'],
  //         imageUrl: prodData['imageUrl'],
  //         isFavorite: favoriteData == null ? false : favoriteData[prodId] ?? false,
  //       ));
  //     });
  //
  //     _items = loadedProducts;
  //     notifyListeners();
  //   } catch (error) {}
  // }

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    final url = Uri.parse(
        'https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken&$filterString');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final url2 = Uri.parse(
          "https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/userFavorites/$userId.json?auth=$authToken");
      final favoriteResponse = await http.get(url2);
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          imageUrl: prodData['imageUrl'],
          isFavorite: favoriteData == null ? false : favoriteData[prodId] ?? false,
        ));
      });

      _items = loadedProducts;
      notifyListeners();
    } catch (error) {}
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
        "https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken");
    try {
      final response = await http.post(url,
          body: json.encode({
            "title": product.title,
            "description": product.description,
            "price": product.price,
            "imageUrl": product.imageUrl,
            'creatorId':userId
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

  Future<void> updatedProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse(
          "https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json?auth=$authToken");

      await http.patch(url,
          body: json.encode({
            "title": newProduct.title,
            "description": newProduct.description,
            "price": newProduct.price,
            "imageUrl": newProduct.imageUrl,
            "isFavorite": newProduct.isFavorite
          }));
      _items[prodIndex] = newProduct;
    } else {
      print(".....");
    }
    notifyListeners();
  }

  void deleteProduct(String id) async {
    final url = Uri.parse(
        "https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json?auth=$authToken");

    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];

    _items.removeAt(existingProductIndex);
    notifyListeners();

    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not Delete Product.');
    }
    existingProduct = null;

    // _items.insert(existingProductIndex, existingProduct);
  }
}
