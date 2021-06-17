import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:hexcolor/hexcolor.dart';

class Paymentpage extends StatefulWidget {
  final double total;
  Paymentpage({
    required this.total,
  });
  @override
  _PaymentpageState createState() => _PaymentpageState(total: this.total);
}

class _PaymentpageState extends State<Paymentpage> {
  final double total;
  _PaymentpageState({
    required this.total,
  });

  int paymentStatus = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            appbar(context, strTitle: "Payment", disappearedBackButton: false),
        backgroundColor: HexColor("#F3F3F3"),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(40),
            child: paymentStatus == 0
                ? paymentSet()
                : paymentStatus == 1
                    ? completePayment()
                    : failPayment()));
  }

  paymentSet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'This is a test payment',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Theme.of(context).accentColor),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Here you can try to whether complete or fail the payment',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 15, color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              paymentStatus = 1;
            });
          },
          child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            height: 40,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
            ),
            child: Text(
              "Complete Payment",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              paymentStatus = 2;
            });
          },
          child: Container(
            height: 40,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
            ),
            child: Text(
              "Fail Payment",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  completePayment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Payment Successfully\nDone!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        Column(
          children: [
            Container(
              height: 100,
              child: Image(
                image: NetworkImage(
                    "https://image.flaticon.com/icons/png/512/758/758702.png"),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "RM" +
                  total.toString() +
                  " Amount\nsuccessfully deducted from you",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            height: 60,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
            child: Text(
              "Done",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  failPayment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Payment Failed!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        Column(
          children: [
            Container(
              height: 100,
              child: Image(
                image: NetworkImage(
                    "https://image.flaticon.com/icons/png/512/1828/1828666.png"),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Err Note:\nTransaction failed, Unauthorized",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context, false);
          },
          child: Container(
            height: 60,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
            ),
            child: Text(
              "Done",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
