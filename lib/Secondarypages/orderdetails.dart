import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/ratingwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
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
      appBar: appbar(context,
          strTitle: "Order Details", disappearedBackButton: false),
      backgroundColor: HexColor("#F3F3F3"),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 100),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              //color: Colors.red,
              child: Container(
                width: 50,
                child: orderDetails[0].status != 2
                    ? Image(
                        image: AssetImage("assets/images/prep.gif"),
                        fit: BoxFit.fitWidth,
                      )
                    : Icon(
                        Icons.check,
                        size: 150,
                        color: Colors.green,
                      ),
              ),
            ),
            bottomWidget(),
          ],
        ),
      ),
    );
  }

  bottomWidget() {
    String status;
    Color color;
    int prog;

    if (orderDetails[0].status == 0) {
      status = "Preparing";
      prog = 20;
      color = Colors.orangeAccent;
    } else if (orderDetails[0].status == 1) {
      status = "Cooking";
      prog = 50;
      color = Colors.blue;
    } else if (orderDetails[0].status == 2) {
      status = "Finding Driver";
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
      left: 10,
      right: 10,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconWithText(Icons.fiber_manual_record, status, color),
              iconWithText(
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
          Container(
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
              child: orderDetails[0].status < 2
                  ? onGoingColumn()
                  : orderDetails[0].status == 2
                      ? deliveredColumn()
                      : canceledColumn())
        ],
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

  iconWithText(IconData icon, String text, Color color) {
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
