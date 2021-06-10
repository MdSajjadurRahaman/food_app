import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';

class Menupage extends StatefulWidget {
  @override
  _MenupageState createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, strTitle: "Menu"),
    );
  }
}
