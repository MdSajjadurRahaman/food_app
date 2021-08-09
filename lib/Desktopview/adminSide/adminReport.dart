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
            Text("Report",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            Divider(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
