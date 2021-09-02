import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

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

Widget buildTextField(String labelText, hintText) {
  return TextField(
    decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: UnderlineInputBorder(),
        hintText: hintText,
        labelText: labelText),
  );
}

PreferredSize appbar2(context,
    {required String strTitle,
    disappearedBackButton = true,
    whiteTitle = false,
    disableTabBar = true,
    dynamic row}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(disappearedBackButton ? 100 : 150),
      child: AppBar(
        automaticallyImplyLeading: false, // hides leading widget
        flexibleSpace: Container(
            padding: EdgeInsets.only(top: 40, left: 20, right: 10, bottom: 20),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: disappearedBackButton
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Offstage(
                      offstage: disappearedBackButton,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color:
                              whiteTitle ? Colors.white : HexColor("#C4C4C4"),
                          size: 40,
                        ),
                      ),
                    ),
                    Container(
                      width: row == null
                          ? MediaQuery.of(context).size.width - 50
                          : MediaQuery.of(context).size.width / 2,
                      child: Text(
                        strTitle,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: whiteTitle ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 24)),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
                row == null ? Text("") : row
              ],
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
}

iconButton(
  IconData iconData,
  Function() function, {
  bool shaddow = true,
  double size = 24,
}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          shaddow
              ? BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 25,
                  spreadRadius: -8,
                )
              : BoxShadow(color: Colors.white),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        iconData,
        color: Colors.black,
        size: size,
      ),
    ),
  );
}
