import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';

class Orderpage extends StatefulWidget {
  @override
  _OrderpageState createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, strTitle: "My Order"),
      body: Container(
        alignment: Alignment.center,
        child: Text("No order for now :("),
      ),
    );
  }
}
