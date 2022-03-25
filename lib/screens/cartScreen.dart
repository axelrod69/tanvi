import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Cart'),
      ),
    );
  }
}
