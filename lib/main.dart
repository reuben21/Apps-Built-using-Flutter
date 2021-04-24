import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';
import './colors.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}






class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=> Products(),
      child: MaterialApp(
        title: '',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor:kPrimaryColor[100],
          accentColor: kPrimaryColorAccent[100],
            textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: 'Handlee'),
              bodyText2: TextStyle(
                color: Colors.white,
                fontFamily: 'Handlee',
              ),
              headline6: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                fontFamily: 'PlayfairDisplay',
              ),
              headline5: TextStyle(
                color: kSecondaryColor[100],
                fontSize: 12,
                fontFamily: 'PlayfairDisplay',
              ),
              headline4: TextStyle(
                color: kSecondaryColor[100],
                fontSize: 14,
                fontFamily: 'PlayfairDisplay',
              ),
              headline3: TextStyle(
                color: kSecondaryColor[100],
                fontSize: 16,
                fontFamily: 'PlayfairDisplay',
              ),
              headline2: TextStyle(
                color: kSecondaryColor[100],
                fontSize: 18,
                fontFamily: 'PlayfairDisplay',
              ),
              headline1: TextStyle(
                color:  kSecondaryColor[100],
                fontSize: 25,
                fontFamily: 'Lato',
              ),
            ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName : (ctx) => ProductDetailScreen()
        },
      ),
    );
  }
}
