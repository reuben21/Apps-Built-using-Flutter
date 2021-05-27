import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/orders.dart' as ord;
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),

      child: Card(
          margin: EdgeInsets.all(10),
          color: kPrimaryColor[100],
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('\$ ${widget.order.amount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headline3),
                subtitle: Text(
                    DateFormat('dd/MM/yyyy hh:mm')
                        .format(widget.order.dateTime),
                    style: Theme.of(context).textTheme.headline4),
                trailing: IconButton(
                  icon: Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    color: kSecondaryColor[100],
                  ),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ),

              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      color: kPrimaryColorAccent[100],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: EdgeInsets.all(20),
                  height:_expanded ?
                      min(widget.order.products.length * 20.0 + 50.0, 180.0) : 0,
                  child: ListView(
                      children: widget.order.products
                          .map((prod) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(prod.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                  Text('${prod.quantity}x \$ ${prod.price}',
                                      style:
                                          Theme.of(context).textTheme.headline4)
                                ],
                              ))
                          .toList()),
                )
            ],
          )),
    );
  }
}
