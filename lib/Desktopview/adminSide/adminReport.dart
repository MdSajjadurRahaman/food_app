import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/widgets/chart.dart';
import 'package:food_app/widgets/globalWidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

class AdminReport extends StatefulWidget {
  @override
  _AdminReportState createState() => _AdminReportState();
}

class _AdminReportState extends State<AdminReport> {
  List<Cart> activeCart = [];
  List<bool> _minimize = [];
  DateTime selectedDate = DateTime.now();
  TextEditingController _txt1 = TextEditingController();
  String dropdownValue = 'Delivered';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F8F8FA"),
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 40,
                    children: [
                      Icon(
                        FontAwesomeIcons.chartArea,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Reports",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          String contentText = "Content of Dialog";
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(22.0))),
                                contentPadding: EdgeInsets.all(0),
                                actionsPadding:
                                    EdgeInsets.only(bottom: 5, right: 5),
                                backgroundColor: Colors.white,
                                content: Container(
                                  width: 500,
                                  height: 400,
                                  padding: EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Filter",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18),
                                        ),
                                      ),
                                      inputRow(
                                          "Email", _txt1, context, "textfield"),
                                      inputRow(
                                          "From Date",
                                          _txt1,
                                          context,
                                          "datetime",
                                          () => _selectDate(context),
                                          selectedDate),
                                      inputRow(
                                          "Until Date",
                                          _txt1,
                                          context,
                                          "datetime",
                                          () => _selectDate(context),
                                          selectedDate),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Status",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          DropdownButton<String>(
                                            dropdownColor:
                                                Theme.of(context).accentColor,
                                            value: dropdownValue,
                                            icon: const Icon(
                                              Icons.arrow_downward,
                                              color: Colors.black,
                                            ),
                                            iconSize: 24,
                                            elevation: 16,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            underline: Container(
                                              height: 2,
                                              color: Colors.black,
                                            ),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownValue = newValue!;
                                              });
                                            },
                                            items: <String>[
                                              'Delivered',
                                              'Canceled'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: Text(
                                      "Cancel",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => setState(() {}),
                                    child: Text(
                                      "Save",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 20,
                        children: [
                          Text(
                            "Filter",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Icon(
                              FontAwesomeIcons.filter,
                              color: Theme.of(context).accentColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: HexColor("#F8F8FA"),
                  borderRadius: BorderRadius.circular(10)),
              child: LineChartSample1(),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Container(
                  width: 150,
                  child: Text(
                    "Datetime",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text("Status",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                    Container(
                      width: 250,
                      child: Text("Customer Email",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                  ],
                ),
                trailing: Wrap(
                  children: [
                    Container(
                      width: 150,
                      child: Text("Total",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 50,
                      child: Text("Action",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                  ],
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
          _minimize.add(true);
          String status;
          Color color;

          if (order[index].status == 0) {
            status = "Order Confirmed";
            color = Colors.orangeAccent;
          } else if (order[index].status == 1) {
            status = "Cooking";
            color = Colors.lime;
          } else if (order[index].status == 2) {
            status = "Waiting for Driver";
            color = Colors.pink;
          } else if (order[index].status == 3) {
            status = "Delivering";
            color = Colors.blue;
          } else if (order[index].status == 4) {
            status = "Delivered";
            color = Colors.green;
          } else {
            status = "Canceled";
            color = Colors.red;
          }

          String formattedDate =
              DateFormat('dd/mm/yyyy').format(order[index].time);

          if (order[index].status >= 4) {
            return GestureDetector(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(width: 1.0, color: Colors.black26),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              activeCart.clear();
                              activeCart = List.from(order[index].cart);
                              _minimize[index] = !_minimize[index];
                            });
                          },
                          leading: Container(
                            width: 150,
                            child: Text(
                              formattedDate.toString(),
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          title: Row(
                            children: [
                              Container(
                                width: 150,
                                child: Text(status,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.black)),
                              ),
                              Container(
                                width: 250,
                                child: Text(order[index].customerEmail,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                          trailing: Wrap(
                            children: [
                              Container(
                                width: 150,
                                child: Text(
                                    "RM " + order[index].total.toString(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                        color: Colors.black)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 50,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    _minimize[index]
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_up,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Offstage(
                        offstage: _minimize[index],
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(5)),
                            child: Wrap(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: activeCart.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                activeCart[index].url),
                                          ),
                                          title: Text(
                                              activeCart[index]
                                                      .quantity
                                                      .toString() +
                                                  " x " +
                                                  activeCart[index].name,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15,
                                                  color: Colors.black)),
                                          trailing: Text(
                                              "RM " +
                                                  (activeCart[index].price *
                                                          activeCart[index]
                                                              .quantity)
                                                      .toString(),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ));
          }
          return SizedBox();
        },
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
