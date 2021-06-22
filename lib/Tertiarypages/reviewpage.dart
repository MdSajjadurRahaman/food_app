import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:hexcolor/hexcolor.dart';

class Reviewpage extends StatefulWidget {
  @override
  _ReviewpageState createState() => _ReviewpageState();
}

class _ReviewpageState extends State<Reviewpage> {
  double totalRate = 0.0;
  double avg = 0.0;
  int five = 0;
  int four = 0;
  int three = 0;
  int two = 0;
  int one = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context,
          strTitle: "Rating & Review", disappearedBackButton: false),
      backgroundColor: HexColor("#F3F3F3"),
      body: Column(
        children: [
          overallRating(),
          ratingReviews(),
        ],
      ),
    );
  }

  overallRating() {
    countRating();
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 40),
      color: Colors.white,
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 80,
            color: Theme.of(context).accentColor,
            alignment: Alignment.center,
            child: Text(avg.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white)),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              progressBarRating(5, five),
              progressBarRating(4, four),
              progressBarRating(3, three),
              progressBarRating(2, two),
              progressBarRating(1, one),
            ],
          )
        ],
      ),
    );
  }

  progressBarRating(double text, int prog) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(text.toString(), style: TextStyle(fontWeight: FontWeight.w700)),
        SizedBox(
          width: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2 - 40,
          height: 10,
          child: LinearProgressIndicator(
            value: prog / review.length,
            color: Theme.of(context).accentColor,
            backgroundColor: Color(0xffD6D6D6),
          ),
        ),
      ],
    );
  }

  countRating() {
    totalRate = 0.0;
    avg = 0.0;
    five = 0;
    four = 0;
    three = 0;
    two = 0;
    one = 0;

    for (int i = 0; i < review.length; i++) {
      totalRate += review[i].rating;
      if (review[i].rating == 5) {
        five++;
      } else if (review[i].rating == 4) {
        four++;
      } else if (review[i].rating == 3) {
        three++;
      } else if (review[i].rating == 2) {
        two++;
      } else {
        one++;
      }
    }

    setState(() {
      avg = totalRate / review.length;
    });
  }

  ratingReviews() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: review.length,
            itemBuilder: (BuildContext context, int index) {
              String email = order[order.indexWhere(
                      (element) => element.orderId == review[index].orderId)]
                  .customerEmail;

              List<Cart> thisOrder = order[order.indexWhere(
                      (element) => element.orderId == review[index].orderId)]
                  .cart;

              List<String> foodName = [];

              for (int i = 0; i < thisOrder.length; i++) {
                foodName.add(thisOrder[i].name);
              }

              String listOfOrder = foodName.join(", ");

              return Container(
                  width: MediaQuery.of(context).size.width - 50,
                  margin: EdgeInsets.only(bottom: 20),
                  //color: Colors.red,
                  //height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "John Doe",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "12/02/2021",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 10),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < review[index].rating; i++)
                            Icon(
                              Icons.star,
                              color: Theme.of(context).accentColor,
                            ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Says: " + review[index].review,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black12,
                      ),
                      Text(
                        "after ordering " + listOfOrder,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 11),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}
