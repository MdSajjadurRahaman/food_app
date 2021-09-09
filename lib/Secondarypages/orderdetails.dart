import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/widgets/globalWidget.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/ratingwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rating_dialog/rating_dialog.dart';

class OrderDetails extends StatefulWidget {
  final String orderId;
  OrderDetails({
    required this.orderId,
  });
  @override
  _OrderDetailsState createState() => _OrderDetailsState(orderId: orderId);
}

class _OrderDetailsState extends State<OrderDetails> {
  final String orderId;
  _OrderDetailsState({
    required this.orderId,
  });

  List<Order> orderDetails = <Order>[];

  @override
  Widget build(BuildContext context) {
    orderDetails
        .add(order[order.indexWhere((element) => element.orderId == orderId)]);

    print(orderDetails[0].status);

    return Scaffold(
      appBar: appbar2(context,
          strTitle: "Order Details",
          disappearedBackButton: false,
          row: refresh()),
      //backgroundColor: HexColor("#F3F3F3"),
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 100),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              //color: Colors.red,
              child: Container(
                  alignment: Alignment.center,
                  color: Theme.of(context).accentColor,
                  width: 50,
                  child: orderDetails[0].status == 0
                      ? iconWithText(
                          FontAwesomeIcons.utensils, "Order Confirmed", true)
                      : orderDetails[0].status == 1
                          ? iconWithText(
                              FontAwesomeIcons.utensils, "Cooking", true)
                          : orderDetails[0].status == 2
                              ? iconWithText(FontAwesomeIcons.utensils,
                                  "Waiting for Driver", true)
                              : orderDetails[0].status == 3
                                  ? iconWithText(FontAwesomeIcons.truckLoading,
                                      "Delivering", true)
                                  : orderDetails[0].status == 4
                                      ? iconWithText(FontAwesomeIcons.check,
                                          "Order Delivered", true)
                                      : iconWithText(FontAwesomeIcons.stop,
                                          "Order Cancelled", true)),
            ),
            bottomWidget(),
          ],
        ),
      ),
    );
  }

  Row refresh() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        iconButton(Icons.refresh, () {
          setState(() {
            orderDetails[0].status++;
          });
        }, shaddow: false)
      ],
    );
  }

  bottomWidget() {
    String status;
    Color color;
    int prog;

    if (orderDetails[0].status == 0) {
      status = "Order Confirmed";
      prog = 10;
      color = Colors.orangeAccent;
    } else if (orderDetails[0].status == 1) {
      status = "Cooking";
      prog = 20;
      color = Colors.blue;
    } else if (orderDetails[0].status == 2) {
      status = "Waiting for Driver";
      prog = 50;
      color = Colors.blue;
    } else if (orderDetails[0].status == 3) {
      status = "Delivering";
      prog = 70;
      color = Colors.blue;
    } else if (orderDetails[0].status == 4) {
      status = "Delivered";
      prog = 100;
      color = Colors.green;
    } else {
      status = "Canceled";
      prog = 0;
      color = Colors.red;
    }

    return Positioned(
      bottom: 15,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconWithText2(Icons.fiber_manual_record, status, color),
                iconWithText2(
                    Icons.location_pin, orderDetails[0].location, Colors.blue),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: prog / 100,
                  color: Theme.of(context).accentColor,
                  backgroundColor: Color(0xffD6D6D6),
                ),
              ),
            ),
            Offstage(
              offstage: orderDetails[0].status < 3,
              child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: -25,
                        blurRadius: 30,
                        offset: Offset(0, -10), // changes position of shadow
                      ),
                    ],
                  ),
                  child: orderDetails[0].status == 3
                      ? onGoingColumn()
                      : orderDetails[0].status == 4
                          ? deliveredColumn()
                          : canceledColumn()),
            )
          ],
        ),
      ),
    );
  }

  onGoingColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Driver details",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
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
              orderDetails[0].driverId,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
            trailing: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            )),
      ],
    );
  }

  deliveredColumn() {
    var contain = review.where(
      (element) => element.orderId == orderId,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Thank you for your order !",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        SizedBox(
          height: 5,
        ),
        contain.length == 0
            ? GestureDetector(
                onTap: () {
                  _showRatingDialog();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: Text(
                    "Share your review",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              )
            : Text(
                "your review has been submitted",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.black),
              ),
      ],
    );
  }

  void _showRatingDialog() {
    final _dialog = RatingWidget(
      // your app's name?
      title: 'Hows our food?',
      // encourage your user to leave a high rating?
      message:
          'Tap a star to set your rating. Add more review here if you want.',
      // your app's logo?
      //image: const FlutterLogo(size: 100),
      submitButton: 'Submit',
      initialRating: 0,
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');
        if (response.rating == 0 && response.comment.length == 0) {
          print("no review");
        } else if (response.rating > 0) {
          final addReview = Review(
            orderId,
            response.rating.toDouble(),
            response.comment,
          );
          setState(() {
            review.add(addReview);
            print(review.length);
          });
        } else {
          print("no review");
        }
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }

  canceledColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Driver details",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        ListTile(
          leading: Icon(
            Icons.account_box,
            size: 50,
          ),
          title: Text(
            "John Doe",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          subtitle: Text("VAP2002K"),
        ),
        Divider(
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.message,
              color: Theme.of(context).accentColor,
            ),
            Icon(
              Icons.call,
              color: Theme.of(context).accentColor,
            )
          ],
        )
      ],
    );
  }

  iconWithText2(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
        ),
      ],
    );
  }
}
