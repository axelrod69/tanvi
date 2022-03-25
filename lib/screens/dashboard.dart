import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
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
