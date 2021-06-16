import 'package:flutter/material.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:hexcolor/hexcolor.dart';

class Food extends StatefulWidget {
  final String id;
  final String name;
  final double price;
  final String url;
  final String category;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.url,
  });

  @override
  _FoodState createState() => _FoodState(
        id: this.id,
        name: this.name,
        price: this.price,
        category: this.category,
        url: this.url,
      );
}

class _FoodState extends State<Food> {
  final String id;
  final String name;
  final double price;
  final String url;
  final String category;

  _FoodState({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: header(context, strTitle: "Review"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: HexColor("#F6F5F5"),
        child: ListView(
          children: [
            Stack(
              children: [
                foodPhoto(),
                foodDetails(),
                header(),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: addToCart(),
    );
  }

  header() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.chevron_left),
            ),
          ),
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.favorite_rounded,
                color: Theme.of(context).accentColor,
              )),
        ],
      ),
    );
  }

  foodPhoto() {
    return Container(
      height: MediaQuery.of(context).size.height / 2 - 80,
      width: MediaQuery.of(context).size.width,
      //margin: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  foodDetails() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: HexColor("#F6F5F5")),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 250),
      padding: EdgeInsets.only(left: 25, right: 25, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 35,
                      color: Theme.of(context).accentColor),
                ),
              ),
              Text(
                "MYR" + price.toString(),
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            category,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: Colors.black45),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            loremipsum,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.black45),
          ),
        ],
      ),
    );
  }

  addToCart() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, [id, name, 1, price, url]);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: Text(
          "add to cart",
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
