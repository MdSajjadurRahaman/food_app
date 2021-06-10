import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';

class Promopage extends StatefulWidget {
  @override
  _PromopageState createState() => _PromopageState();
}

class _PromopageState extends State<Promopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, strTitle: "Promo"),
    );
  }
}
