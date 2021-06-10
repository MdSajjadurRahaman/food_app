import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';

class Morepage extends StatefulWidget {
  @override
  _MorepageState createState() => _MorepageState();
}

class _MorepageState extends State<Morepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, strTitle: "Jone Doe"),
    );
  }
}
