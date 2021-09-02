import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/driverside/deliverydetails.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:mock_data/mock_data.dart';
import 'package:uuid/uuid.dart';

class Driverhome extends StatefulWidget {
  @override
  _DriverhomeState createState() => _DriverhomeState();
}

class _DriverhomeState extends State<Driverhome> {
  int pageIndex = 0;
  bool ongoing = true;

  addDummyOrder() {
    Random random = new Random();
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
        2,
        menus[randomNumber].price,
        menus[randomNumber].url,
      );
      totalBeforeTax += (menus[randomNumber].price * 2);
      setState(() {
        cart.add(addCart);
        print(cart.length);
      });
    }
    tax = totalBeforeTax * (restaurant[0].tax / 100);
    total = totalBeforeTax + tax + deliveryfee;
    var orderId = Uuid().v4();
    final addOrder = Order(orderId, email, 2, List.from(cart), 0,
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
      appBar: appbar2(context, strTitle: "Appointment", row: refresh()),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: pageIndex == 0
                            ? Border(
                                bottom:
                                    BorderSide(width: 4, color: Colors.black))
                            : Border()),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Text("Active",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: pageIndex == 0
                                    ? Colors.black
                                    : Colors.black26,
                                fontWeight: FontWeight.w700,
                                fontSize: 12))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: pageIndex == 1
                            ? Border(
                                bottom:
                                    BorderSide(width: 4, color: Colors.black))
                            : Border()),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Text("History",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: pageIndex == 1
                                    ? Colors.black
                                    : Colors.black26,
                                fontWeight: FontWeight.w700,
                                fontSize: 12))),
                  ),
                ),
              ],
            ),
            order.indexWhere((element) => element.status == 3).isNegative
                ? SizedBox()
                : ongoingCust(),
            Text(
              "Next Queue",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 15,
                    fontWeight: FontWeight.w800),
              ),
            ),
            queueList(),
          ],
        ),
      ),
    );
  }

  ongoingCust() {
    String formattedDate = DateFormat('EEEE, dd MMMM yyyy')
        .format(order[order.indexWhere((element) => element.status == 3)].time);
    return GestureDetector(
      onTap: () async {
        final success =
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DeliveryDetails(
            orderId: order[order.indexWhere((element) => element.status == 3)]
                .orderId,
            index: order.indexWhere((element) => element.status == 3),
          );
        }));
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ongoing Customer",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Icon(
                  FontAwesomeIcons.solidUserCircle,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: Text(
                order[order.indexWhere((element) => element.status == 3)]
                    .customerEmail,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order[order.indexWhere((element) => element.status == 3)]
                        .location,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Text(
                    formattedDate.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  queueList() {
    return Expanded(
      child: ListView.builder(
        itemCount: order.length,
        itemBuilder: (BuildContext context, int index) {
          String formattedDate =
              DateFormat('EEEE, dd MMMM yyyy').format(order[index].time);
          if (pageIndex == 0
              ? order[index].status == 2
              : order[index].status == 4) {
            return GestureDetector(
              onTap: () async {
                final success = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return DeliveryDetails(
                    orderId: order[index].orderId,
                    index: index,
                  );
                }));
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: HexColor("#F0F0F0"),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    EdgeInsets.only(top: 10, bottom: 20, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            FontAwesomeIcons.solidUserCircle,
                            color: Theme.of(context).accentColor,
                            size: 30,
                          ),
                        ),
                        title: Text(
                          order[index].customerEmail,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                        ),
                        subtitle: Text(
                          order[index].location,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                          ),
                        )),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.clock,
                          size: 18,
                        ),
                        Text(
                          formattedDate.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Row refresh() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        iconButton(Icons.refresh, () {
          addDummyOrder();
        })
      ],
    );
  }
}
