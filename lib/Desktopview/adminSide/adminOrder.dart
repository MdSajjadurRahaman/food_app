import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_app/Secondarypages/orderdetails.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:food_app/widgets/tabheaderwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AdminOrder extends StatefulWidget {
  @override
  _AdminOrderState createState() => _AdminOrderState();
}

class _AdminOrderState extends State<AdminOrder> {
  bool isOngoing = true;
  List<Cart> activeCart = [];
  String orderId = "";
  String customerEmail = "";
  String location = "";
  DateTime time = DateTime.now();
  int paymentMethod = 0;
  double total = 0.0;

  List<bool> isSelected = [true, false, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  addDummyOrder() {
    Random random = new Random();
    int randomStatus = random.nextInt(3);
    for (int i = 1; i < 4; i++) {
      int randomNumber = random.nextInt(menus.length + 1);
      final addCart = Cart(
        menus[randomNumber].id,
        menus[randomNumber].name,
        randomStatus + 1,
        menus[randomNumber].price,
        menus[randomNumber].url,
      );
      setState(() {
        cart.add(addCart);
        print(cart.length);
      });
    }
    var orderId = Uuid().v4();
    final addOrder = Order(orderId, "test@mail.com", randomStatus,
        List.from(cart), 0, "Bangsar, Kuala Lumpur", DateTime.now(), 0);
    setState(() {
      print("hehe");
      order.add(addOrder);
      cart.clear();
    });
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Orders",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          )),
                      TextButton(
                          child:
                              Text("Refresh", style: TextStyle(fontSize: 14)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(20)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).accentColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          onPressed: () {
                            addDummyOrder();
                          }),
                    ],
                  ),
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
                child: Text("Order id : " + orderId,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18)),
              ),
              Divider(color: Colors.white),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: HexColor("#F8F8FA"),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Customer Details ",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(customerEmail, style: TextStyle(fontSize: 15)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(location, style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Divider(color: Colors.white),
              Container(
                child: activeCart.length != 0
                    ? Wrap(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: activeCart.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(activeCart[index].url),
                                    ),
                                    title: Text(
                                        activeCart[index].quantity.toString() +
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
                                                    activeCart[index].quantity)
                                                .toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: Colors.black)),
                                  ),
                                  Divider(color: Colors.white),
                                  index == activeCart.length - 1
                                      ? Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                ),
                                                child: Text("Order Notes ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 18)),
                                              ),
                                              Divider(color: Colors.white),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: HexColor("#F8F8FA"),
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                ),
                                                child: Text(loremipsum,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 13)),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Text('')
                                ],
                              );
                            },
                          ),
                        ],
                      )
                    : Text(''),
              ),
              Divider(color: Colors.white),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          height: 200,
          child: ListView(
            children: [
              ListTile(
                title: Text("Total ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black)),
                subtitle: Text(
                    paymentMethod == 0 ? "Paid Using FPX" : "Paid Using Other",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black45)),
                trailing: Text("RM " + total.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black)),
              ),
              Text("Status : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      color: Colors.black)),
              Divider(color: Colors.white),
              Container(
                alignment: Alignment.center,
                child: ToggleButtons(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text("Pending",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text("Delivering",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text("Cancel",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.black)),
                    ),
                  ],
                  fillColor: Theme.of(context).accentColor,
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = true;
                        } else {
                          isSelected[buttonIndex] = false;
                        }
                      }
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  countTotal() {
    for (int i = 1; i < activeCart.length; i++) {
      total += activeCart[i].quantity * activeCart[i].price;
    }
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
                  setState(() {
                    total = 0.0;

                    orderId = order[index].orderId;
                    customerEmail = order[index].customerEmail;
                    location = order[index].location;
                    time = order[index].time;
                    paymentMethod = order[index].paymentMethod;
                    activeCart.clear();
                    activeCart = List.from(order[index].cart);
                    countTotal();
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      left: BorderSide(width: 5.0, color: color),
                    ),
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
                    contentPadding: EdgeInsets.all(0),
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
                ));
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
                  setState(() {
                    orderId = order[index].orderId;
                    activeCart.clear();
                    activeCart = List.from(order[index].cart);
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      left: BorderSide(width: 5.0, color: color),
                    ),
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
                    contentPadding: EdgeInsets.all(0),
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
                ));
          }
          return SizedBox();
        },
      ),
    );
  }
}
