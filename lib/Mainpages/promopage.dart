import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/sampledata.dart';

class Promopage extends StatefulWidget {
  @override
  _PromopageState createState() => _PromopageState();
}

class _PromopageState extends State<Promopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, strTitle: "Rewards\n& Promotions"),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            points(),
            promotion(),
          ],
        ),
      ),
    );
  }

  points() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      height: 180,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width / 2) - 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "My Points",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "20",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Text(
                    "browse\nrewards",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          VerticalDivider(thickness: 1, color: Colors.white),
          Container(
            width: (MediaQuery.of(context).size.width / 2) - 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Share with friends",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "Share this app to your friends\nand get free RM10 discount\non your next order",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 10),
                ),
                Text(
                  "Share left : 2 More friends",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 10),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Text(
                    "Share Now",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  promotion() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Browse Promotions",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87),
              ),
              Text(
                "View all",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: promotions.length,
            itemBuilder: (BuildContext context, int index) => Container(
              height: 150,
              margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(promotions[index].url),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: promotions[index].status
                        ? Colors.black.withOpacity(0)
                        : Colors.black.withOpacity(
                            0.4) //HexColor("#690000").withOpacity(0.35)
                    ),
                child: Text(
                  promotions[index].status ? "" : "EXPIRED",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
