import 'package:flutter/material.dart';
import 'package:shop/screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor kPrimaryColor = const MaterialColor(
  0xFF0E7AC7,
  const <int, Color>{
    50: const Color(0xFF2f5d62),
    100: const Color(0xFF2f5d62),
    200: const Color(0xFF2f5d62),
    300: const Color(0xFF2f5d62),
    400: const Color(0xFF2f5d62),
    500: const Color(0xFF2f5d62),
    600: const Color(0xFF2f5d62),
    700: const Color(0xFF2f5d62),
    800: const Color(0xFF2f5d62),
    900: const Color(0xFF2f5d62),
  },
);


const MaterialColor kPrimaryColorAccent = const MaterialColor(
  0xFF0E7AC7,
  const <int, Color>{
    50: const Color(0xFF364547),
    100: const Color(0xFF364547),
    200: const Color(0xFF364547),
    300: const Color(0xFF364547),
    400: const Color(0xFF364547),
    500: const Color(0xFF364547),
    600: const Color(0xFF364547),
    700: const Color(0xFF364547),
    800: const Color(0xFF364547),
    900: const Color(0xFF364547),
  },
);




const MaterialColor kSecondaryColor = const MaterialColor(
  0xFF0E7AC7,
  const <int, Color>{
    50: const Color(0xFFffb037),
    100: const Color(0xFFffb037),
    200: const Color(0xFFffb037),
    300: const Color(0xFFffb037),
    400: const Color(0xFFffb037),
    500: const Color(0xFFffb037),
    600: const Color(0xFFffb037),
    700: const Color(0xFFffb037),
    800: const Color(0xFFffb037),
    900: const Color(0xFFffb037),
  },
);


const MaterialColor kSecondaryColorAccent = const MaterialColor(
  0xFF0E7AC7,
  const <int, Color>{
    50: const Color(0xFFffe268),
    100: const Color(0xFFffe268),
    200: const Color(0xFFffe268),
    300: const Color(0xFFffe268),
    400: const Color(0xFFffe268),
    500: const Color(0xFFffe268),
    600: const Color(0xFFffe268),
    700: const Color(0xFFffe268),
    800: const Color(0xFFffe268),
    900: const Color(0xFFffe268),
  },
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopyify',
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
              color: Colors.deepOrangeAccent,
              fontSize: 20,
              fontFamily: 'PlayfairDisplay',
            ),
            headline4: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'PlayfairDisplay',
            ),
            headline3: TextStyle(
              color: Colors.redAccent,
              fontSize: 15,
              fontFamily: 'PlayfairDisplay',
            ),
            headline2: TextStyle(
              color: Colors.white,
              fontSize: 14,
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
    );
  }
}
