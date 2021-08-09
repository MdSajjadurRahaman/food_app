import 'package:flutter/material.dart';
import 'package:food_app/Secondarypages/orderdetails.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:food_app/widgets/tabheaderwidget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class AdminOrder extends StatefulWidget {
  @override
  _AdminOrderState createState() => _AdminOrderState();
}

class _AdminOrderState extends State<AdminOrder> {
  bool isOngoing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F8F8FA"),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(50),
              child: ListView(
                children: [
                  Text("Orders",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
                  Divider(color: Colors.white),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    TextButton(
                        child: Text("Ongoing".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(20)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                isOngoing
                                    ? Theme.of(context).accentColor
                                    : Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          setState(() {
                            isOngoing = true;
                          });
                        }),
                    SizedBox(width: 10),
                    TextButton(
                        child: Text("History".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(20)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                isOngoing
                                    ? Colors.black
                                    : Theme.of(context).accentColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          setState(() {
                            isOngoing = false;
                          });
                        }),
                  ]),
                  isOngoing
                      ? Center(
                          child: order.length == 0
                              ? Center(child: Text("No order available"))
                              : ongoing(context),
                        )
                      : Center(
                          child: order.length == 0
                              ? Text("No past order available")
                              : history(context),
                        )
                ],
              ),
            ),
          ),
          orderDetails()
        ],
      ),
    );
  }

  orderDetails() {
    return Expanded(
      flex: 1,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 3,
                blurRadius: 30,
                offset: Offset(0, -10), // changes position of shadow
              ),
            ],
          ),
          child: ListView(
            children: [
              Text("Order Details",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
              Divider(color: Colors.white),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text("Order id : ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18)),
              ),
              Divider(color: Colors.white),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: HexColor("#F2F2F2"),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Items",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20)),
                          Text("RM 0",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20)),
                        ],
                      ),
                      Divider(),
                    ],
                  )),
              Divider(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  ongoing(BuildContext context) {
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

          if (order[index].status < 2) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderDetails(
                            orderId: order[index].orderId,
                          )),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    trailing: Icon(Icons.fiber_manual_record, color: color),
                    title: Text(formattedDate.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.black)),
                    subtitle: Text(status + " - " + order[index].location,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.black)),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  history(BuildContext context) {
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

          if (order[index].status >= 2) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderDetails(
                            orderId: order[index].orderId,
                          )),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    trailing: Icon(Icons.fiber_manual_record, color: color),
                    title: Text(formattedDate.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.black)),
                    subtitle: Text(status + " - " + order[index].location,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.black)),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
