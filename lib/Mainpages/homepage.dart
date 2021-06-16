import 'package:flutter/material.dart';
import 'package:food_app/Secondarypages/checkout.dart';
import 'package:food_app/widgets/foodwidget.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:hexcolor/hexcolor.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/logo2.png"),
            ),
            title: Text(
              'Deliver to',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
            subtitle: Text('Bangsar, Kuala Lumpur'),
            trailing: Icon(
              Icons.location_on_outlined,
              color: Colors.black,
              size: 30,
            ),
          )),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            promoBanner(),
            searchbar(),
            category(),
            menu(),
          ],
        ),
      ),
      floatingActionButton: cart.length > 0
          ? Stack(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Checkout()),
                    );
                  },
                  child: const Icon(Icons.shopping_cart_rounded),
                  backgroundColor: Colors.red,
                ),
                Positioned(
                  right: 5,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orangeAccent),
                  ),
                )
              ],
            )
          : Container(),
    );
  }

  promoBanner() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: promotions.length,
          itemBuilder: (BuildContext context, int index) => Container(
                margin: EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width - 40,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(promotions[index].url),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              )),
    );
  }

  category() {
    return Container(
        margin: EdgeInsets.only(bottom: 15, top: 5),
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 50,
                        alignment: Alignment.center,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "View All",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 80,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            height: 40,
                            image: NetworkImage(categories[index].iconUrl),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(categories[index].category)
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 80,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 40,
                        image: NetworkImage(categories[index].iconUrl),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(categories[index].category)
                    ],
                  ),
                );
              }
            }));
  }

  searchbar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 40,
      decoration: BoxDecoration(
        color: HexColor("#EFEFEF"),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
          new Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search menu",
                hintStyle: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w400),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                isDense: true,
              ),
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  menu() {
    return Container(
      height: 1200,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
          itemCount: menus.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                showFood(context,
                    id: menus[index].id,
                    name: menus[index].name,
                    price: menus[index].price,
                    category: menus[index].category,
                    url: menus[index].url);
              },
              child: Container(
                height: 310,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(menus[index].url),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: HexColor("#000000").withOpacity(
                          0.4) //HexColor("#690000").withOpacity(0.35)
                      ),
                  child: Text(
                    menus[index].name, //sampledata
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            );
          }),
    );
  }

  bottomWidget() {
    return Positioned(
      bottom: 15,
      left: 10,
      right: 10,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 30,
              offset: Offset(0, -10), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(
                    Icons.motorcycle,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliver now in 25 min',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                      Text(
                        '5 Km',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black45),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(color: Colors.black12, height: 1),
            Container(
              padding:
                  EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.confirmation_number_rounded,
                        color: Colors.orange,
                        size: 25,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '20% OFF Self Pick up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "   Check for available offers",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
