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
        body: ListView(
      children: [
        menuBar(),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 300, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              foodPhoto(),
              SizedBox(
                width: 20,
              ),
              foodDetails()
            ],
          ),
        ),
        Divider(
          thickness: 1,
        ),
      ],
    ));
  }

  menuBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 300, vertical: 10),
      child: ListTile(
        leading: Wrap(
          spacing: 12, // space between two icons
          children: <Widget>[
            Icon(Icons.chevron_left), // icon-1
            Text(
              "Back to home",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ) // icon-2
          ],
        ),
      ),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.black12),
      )),
    );
  }

  foodPhoto() {
    return Container(
      height: MediaQuery.of(context).size.height / 2 + 100,
      width: MediaQuery.of(context).size.width / 4,
      //margin: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20)),
    );
  }

  foodDetails() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: HexColor("#F6F5F5")),
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 2 + 100,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 25, right: 25, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                        color: Theme.of(context).accentColor),
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
          addToCart(),
        ],
      ),
    );
  }

  showFood(BuildContext context,
      {required String id,
      required String name,
      required double price,
      required String category,
      required String url}) async {
    final input =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Food(
        id: id,
        name: name,
        price: price,
        category: category,
        url: url,
      );
    }));
    final addCart;

    if (input != null) {
      var contain = cart.where(
        (element) => element.foodId == input[0],
      );
      if (contain.isNotEmpty) {
        print("hiyahiya");
        cart[cart.indexWhere((element) => element.foodId == input[0])]
            .quantity++;
        cart[cart.indexWhere((element) => element.foodId == input[0])].price =
            menus[menus.indexWhere((element) => element.id == input[0])].price *
                cart[cart.indexWhere((element) => element.foodId == input[0])]
                    .quantity;
      } else {
        addCart = Cart(
          input[0],
          input[1],
          input[2],
          input[3],
          input[4],
        );
        setState(() {
          cart.add(addCart);
          print(cart.length);
        });
      }
    }
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
