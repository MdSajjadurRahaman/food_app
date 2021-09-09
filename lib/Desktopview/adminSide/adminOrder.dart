import 'dart:async';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/Secondarypages/orderdetails.dart';
import 'package:food_app/widgets/globalWidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:food_app/widgets/tabheaderwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:mock_data/mock_data.dart';

class AdminOrder extends StatefulWidget {
  @override
  _AdminOrderState createState() => _AdminOrderState();
}

class _AdminOrderState extends State<AdminOrder> {
  bool isOngoing = true;
  List<Cart> activeCart = [];
  List<Driver> _driver = [];
  String orderId = "";
  int orderIndex = 0;
  String customerEmail = "";
  String location = "";
  DateTime time = DateTime.now();
  int paymentMethod = 0;
  double total = 0.0;
  String dropdownValue = 'Confirmed';
  String currentStatus = 'Order Confirmed';
  bool isDeliver = false;

  List<bool> isSelected = [true, false, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  addDummyOrder() {
    Random random = new Random();
    int randomStatus = random.nextInt(6);
    String name = mockName();
    String email =
        (name.replaceAll(new RegExp(r"\s+"), "").toLowerCase() + "@gmail.com");
    DateTime randomdate = mockDate(DateTime(2021, 7, 01));
    double totalBeforeTax = 0;
    double total = 0;
    double tax = 0;
    double deliveryfee = 5;
    for (int i = 1; i < 4; i++) {
      int randomNumber = random.nextInt(menus.length + 1);
      final addCart = Cart(
        menus[randomNumber].id,
        menus[randomNumber].name,
        randomStatus + 1,
        menus[randomNumber].price,
        menus[randomNumber].url,
      );
      totalBeforeTax += (menus[randomNumber].price * (randomStatus + 1));
      print("a" + totalBeforeTax.toString());
      setState(() {
        cart.add(addCart);
        print(cart.length);
      });
    }
    tax = totalBeforeTax * (restaurant[0].tax / 100);
    print("b" + tax.toString());
    total = totalBeforeTax + tax + deliveryfee;
    print("c" + total.toString());
    var orderId = Uuid().v4();
    final addOrder = Order(orderId, email, randomStatus, List.from(cart), 0,
        "Bangsar, Kuala Lumpur", randomdate, 0, deliveryfee, tax, total);
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
                              FontAwesomeIcons.fileAlt,
                              color: Colors.white,
                              size: 50,
                            ),
                            Text(
                              "Orders",
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
                          onTap: () {
                            addDummyOrder();
                          },
                          child: Icon(
                            FontAwesomeIcons.sync,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 20,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isOngoing = true;
                            });
                          },
                          child: Text(
                            "Ongoing",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color:
                                      isOngoing ? Colors.black : Colors.black26,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isOngoing = false;
                            });
                          },
                          child: Text(
                            "History",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: !isOngoing
                                      ? Colors.black
                                      : Colors.black26,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                Text(
                  "Order Details",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                ),
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(activeCart[index].url),
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
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                  child: Text("Order Totals ",
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
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                  child: Wrap(
                                                    runSpacing: 20,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Tax",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      13)),
                                                          Text(
                                                              "RM " +
                                                                  order[index]
                                                                      .tax
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      13)),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Delivery Fee",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      13)),
                                                          Text(
                                                              "RM " +
                                                                  order[index]
                                                                      .deliveryfee
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      13)),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Totals",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      13)),
                                                          Text(
                                                              "RM " +
                                                                  order[index]
                                                                      .total
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      13)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
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
          bottomNavigationBar: Offstage(
            offstage: orderId == "" || !isOngoing,
            child: submit(),
          )),
    );
  }

  multichoose() {
    return Container(
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
    );
  }

  statusWidget(bool isDeliver) {
    if (isDeliver) {
      return Column(
        children: [
          Text("Driver assigned " + _driver[0].name,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              )),
          Text("Waiting for driver to pick up...",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              )),
        ],
      );
    } else {
      return Text("Current state : " + currentStatus,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ));
    }
  }

  submit() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          statusWidget(isDeliver),
          GestureDetector(
            onTap: () async {
              if (!isDeliver) {
                final dialog = await showDialog(
                    context: context,
                    builder: (context) {
                      String contentText = "Content of Dialog";
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22.0))),
                            contentPadding: EdgeInsets.all(0),
                            actionsPadding:
                                EdgeInsets.only(bottom: 5, right: 5),
                            backgroundColor: Theme.of(context).accentColor,
                            content: Container(
                              width: 400,
                              height: 350,
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Update State",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  currentStatus == "Order Confirmed"
                                      ? iconWithText(FontAwesomeIcons.utensils,
                                          "Order Confirmed", true)
                                      : currentStatus == "Cooking"
                                          ? iconWithText(
                                              FontAwesomeIcons.utensils,
                                              "Cooking",
                                              true)
                                          : currentStatus ==
                                                  "Waiting for Driver"
                                              ? iconWithText(
                                                  FontAwesomeIcons.utensils,
                                                  "Waiting for Driver",
                                                  true)
                                              : currentStatus == "Delivering"
                                                  ? iconWithText(
                                                      FontAwesomeIcons
                                                          .truckLoading,
                                                      "Delivering",
                                                      true)
                                                  : currentStatus == "Delivered"
                                                      ? iconWithText(
                                                          FontAwesomeIcons
                                                              .utensils,
                                                          "Delivered",
                                                          true)
                                                      : iconWithText(
                                                          FontAwesomeIcons
                                                              .utensils,
                                                          "Cancelled",
                                                          true),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  //getRandomDriver(_driver),
                                  Text(
                                    "Click dropdown bellow to change the state",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10),
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    dropdownColor:
                                        Theme.of(context).accentColor,
                                    value: dropdownValue,
                                    icon: Icon(
                                      FontAwesomeIcons.chevronDown,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.white),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'Confirmed',
                                      'Cooking',
                                      'Delivering',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    height: 40,
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
                                        color: Colors.white38,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => setState(() {
                                  if (dropdownValue == "Confirmed") {
                                    order[order.indexWhere((element) =>
                                            element.orderId == orderId)]
                                        .status = 0;
                                    currentStatus = dropdownValue;
                                    Navigator.pop(context, 'Cancel');
                                  } else if (dropdownValue == "Cooking") {
                                    order[order.indexWhere((element) =>
                                            element.orderId == orderId)]
                                        .status = 1;
                                    currentStatus = dropdownValue;
                                    Navigator.pop(context, 'Cancel');
                                  } else {
                                    order[order.indexWhere((element) =>
                                            element.orderId == orderId)]
                                        .status = 2;
                                    currentStatus = "Searching for driver..";
                                    Navigator.pop(context, 'deliver');
                                  }
                                }),
                                child: Text(
                                  "Save",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    });
                setState(() {});
                if (dialog != null && dialog == "deliver") {
                  Random random = new Random();
                  int randomIndex = random.nextInt(driver.length);
                  print(randomIndex);
                  _driver.add(driver[randomIndex]);
                  order[order
                          .indexWhere((element) => element.orderId == orderId)]
                      .driverId = driver[randomIndex].email;
                  Timer(Duration(seconds: 2), () {
                    setState(() {
                      isDeliver = true;
                    });
                  });
                }
              } else {
                setState(() {
                  order[order
                          .indexWhere((element) => element.orderId == orderId)]
                      .status = 3;
                  isDeliver = false;
                  currentStatus = "Delivering";
                });
              }
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 20, left: 50, right: 50),
              decoration: BoxDecoration(
                  color: isDeliver
                      ? Colors.black45
                      : Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(5)),
              alignment: Alignment.center,
              child: Text(
                "Update state",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
          ),
        ],
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
              DateFormat('EEEE, dd MMMM yyyy').format(order[index].time);

          if (order[index].status < 4) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    total = 0.0;
                    currentStatus = status;
                    orderId = order[index].orderId;
                    customerEmail = order[index].customerEmail;
                    location = order[index].location;
                    time = order[index].time;
                    orderIndex = index;
                    paymentMethod = order[index].paymentMethod;
                    activeCart.clear();
                    _driver.clear();
                    if (order[index].driverId.length > 0 &&
                        status == "Waiting for Driver") {
                      _driver.add(driver[driver.indexWhere((element) =>
                          element.email == order[index].driverId)]);
                      isDeliver = true;
                    } else {
                      isDeliver = false;
                    }
                    activeCart = List.from(order[index].cart);
                    countTotal();
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black26),
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.fiber_manual_record,
                      color: color,
                    ),
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
                    trailing: Icon(Icons.remove_red_eye),
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
              DateFormat('EEEE, dd MMMM yyyy').format(order[index].time);

          if (order[index].status >= 4) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    currentStatus = status;
                    orderId = order[index].orderId;
                    activeCart.clear();
                    _driver.clear();
                    isDeliver = false;
                    orderIndex = index;
                    activeCart = List.from(order[index].cart);
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black26),
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.fiber_manual_record,
                      color: color,
                    ),
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
                    trailing: Icon(Icons.remove_red_eye),
                  ),
                ));
          }
          return SizedBox();
        },
      ),
    );
  }
}
