import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminReport extends StatefulWidget {
  @override
  _AdminReportState createState() => _AdminReportState();
}

class _AdminReportState extends State<AdminReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F8F8FA"),
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Report",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
                TextButton(
                    child: Text("Refresh", style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(20)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).accentColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {}),
              ],
            ),
            Divider(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
