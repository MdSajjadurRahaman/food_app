import 'package:flutter/material.dart';

PreferredSize appbar(context,
    {required String strTitle, disappearedBackButton = true}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(100.0),
      child: AppBar(
        automaticallyImplyLeading: false, // hides leading widget
        flexibleSpace: Container(
            padding: EdgeInsets.only(
              top: 20,
              left: disappearedBackButton ? 20 : 10,
              right: 10,
            ),
            alignment: Alignment.centerLeft,
            child: disappearedBackButton
                ? Text(
                    strTitle,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                : Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.chevron_left,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        strTitle,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 30.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
        backgroundColor: Colors.white,
        elevation: 0,
      ));
}
