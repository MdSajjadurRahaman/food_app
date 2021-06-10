import 'package:flutter/material.dart';

PreferredSize appbartab(context,
    {required String strTitle, disappearedBackButton = true}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(100.0),
    child: AppBar(
      automaticallyImplyLeading: false, // hides leading widget
      flexibleSpace: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 10,
        ),
        alignment: Alignment.topLeft,
        child: Text(
          strTitle,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: TabBar(
        indicatorColor: Colors.red,
        labelColor: Colors.black,
        tabs: [
          Tab(
            text: "Ongoing",
          ),
          Tab(
            text: "History",
          )
        ],
      ),
    ),
  );
}
