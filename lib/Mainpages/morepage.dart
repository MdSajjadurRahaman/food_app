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
      backgroundColor: Colors.white,
      appBar: appbar(context, strTitle: "Jone Doe"),
      body: new Scaffold(
          body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
                onPressed: () => {},
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.account_circle),
                        Text(
                          "   My Profile",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        )
                      ],
                    ))),
            FlatButton(
                onPressed: () => {},
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.help),
                          Text(
                            "   Help",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey),
                          )
                        ]))),
            FlatButton(
                onPressed: () => {},
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.feedback),
                          Text(
                            "   FeedBack",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey),
                          )
                        ]))),
            FlatButton(
                onPressed: () => {},
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.inbox),
                          Text(
                            "   Inbox",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey),
                          )
                        ])))
          ],
        ),
      )),
    );
  }
}
