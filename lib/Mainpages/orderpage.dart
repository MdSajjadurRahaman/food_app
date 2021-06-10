import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/tabheaderwidget.dart';

class Orderpage extends StatefulWidget {
  @override
  _OrderpageState createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appbartab(context, strTitle: "My Order"),
          body: const TabBarView(children: <Widget>[
            Center(
              child: Text("No ongoing order"),
            ),
            Center(
              child: Text("No history available"),
            )
          ]),
        ));
  }
}
