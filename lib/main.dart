import 'package:flutter/material.dart';
import 'package:food_odering_app/pages/cart/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:food_odering_app/cart_provider.dart';
import 'package:food_odering_app/pages/home_page.dart';
import 'package:food_odering_app/pages/log_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: LoginPage(),
        ),
      ),
    );
  }
}