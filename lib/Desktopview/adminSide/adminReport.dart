import 'package:flutter/material.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

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
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    )),
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Chart Coming Soon",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Expanded(
              child: reportList(),
            )
          ],
        ),
      ),
    );
  }

  reportList() {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: order.length,
        itemBuilder: (BuildContext context, int index) {
          String status;
          Color color;

          if (order[index].status == 0) {
            status = "Preparing";
            color = Colors.orangeAccent;
          } else if (order[index].status == 1) {
            status = "Delivering";
            color = Colors.blue;
          } else if (order[index].status == 2) {
            status = "Delivered";
            color = Colors.green;
          } else {
            status = "Canceled";
            color = Colors.red;
          }

          String formattedDate =
              DateFormat('EEEE, dd MMMM yyyy').format(order[index].time);

          return GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: -10,
                      blurRadius: 10,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(formattedDate.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.white)),
                  subtitle: Text(status + " - " + order[index].location,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white)),
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
