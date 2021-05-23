import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.products,
      @required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;

  Orders( this.authToken,this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }






  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
        "https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/orders.json?auth=$authToken");
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if(extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(OrderItem(
          id: orderId,
          amount: orderData['amount'],
          products: (orderData['products'] as List<dynamic>)
              .map((item) => CartItem(
                  id: item['id'],
                  title: item['title'],
                  quantity: item['quantity'],
                  price: item['price']))
              .toList(),
          dateTime: DateTime.parse(orderData['dateTime'])));
    });
    _orders = loadedOrders;
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    print(cartProducts.map((e) => print(e)));
    final url = Uri.parse(
        "https://shopping-flutter-app-default-rtdb.asia-southeast1.firebasedatabase.app/orders.json?auth=$authToken");
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode({
            "amount": total,
            "products": cartProducts
                .map((cp) => {
                      'id': cp.id,
                      'title': cp.title,
                      'quantity': cp.quantity,
                      'price': cp.price
                    })
                .toList(),
            "dateTime": timeStamp.toIso8601String()
          }));
      var _responseData = json.decode(response.body);

      _orders.insert(
          0,
          OrderItem(
              id:
                  // DateTime.now().toString(),
                  _responseData['name'],
              amount: total,
              products: cartProducts,
              dateTime: timeStamp));

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }

    notifyListeners();
  }
}
