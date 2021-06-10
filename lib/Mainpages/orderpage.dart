import 'package:flutter/material.dart';
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
          appBar: appbartab(context, strTitle: "My Orders"),
          body: TabBarView(children: <Widget>[
            Center(
              child: berjalan(),
            ),
            Center(
              child: sejarah(),
            )
          ]),
        ));
  }
}

sejarah() {
  return Text("No history available");
}

berjalan() {
  return Text("No ongoing order");
}
