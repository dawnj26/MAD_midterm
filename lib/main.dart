import 'package:flutter/material.dart';
import 'package:quinto_midtermproject/screens/home_screen.dart';

void main() => runApp(const ShoppingCart());

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
