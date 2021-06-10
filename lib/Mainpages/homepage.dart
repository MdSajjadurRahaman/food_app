import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';
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
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
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
        child: Stack(
          children: [
            ListView(
              children: [
                promoBanner(),
                searchbar(),
                menu(),
              ],
            ),
            bottomWidget(),
          ],
        ),
      ),
    );
  }

  promoBanner() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://st4.depositphotos.com/14582236/30991/v/1600/depositphotos_309919246-stock-illustration-pepperoni-pizza-banner-ads.jpg"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    );
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
      height: 1000,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        primary: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            height: 310,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1260968.jpg&fm=jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: HexColor("#000000")
                      .withOpacity(0.4) //HexColor("#690000").withOpacity(0.35)
                  ),
              child: const Text(
                "Super Cheesy Pizza",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          Container(
            height: 310,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/2762942/pexels-photo-2762942.jpeg?cs=srgb&dl=pexels-ana-madeleine-uribe-2762942.jpg&fm=jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: HexColor("#000000")
                      .withOpacity(0.4) //HexColor("#690000").withOpacity(0.35)
                  ),
              child: const Text(
                "Super Cheesy Pizza",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          Container(
            height: 310,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?cs=srgb&dl=pexels-brett-jordan-825661.jpg&fm=jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: HexColor("#000000")
                      .withOpacity(0.4) //HexColor("#690000").withOpacity(0.35)
                  ),
              child: const Text(
                "Super Cheesy Pizza",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          Container(
            height: 310,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/1049626/pexels-photo-1049626.jpeg?cs=srgb&dl=pexels-edward-eyer-1049626.jpg&fm=jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: HexColor("#000000")
                      .withOpacity(0.4) //HexColor("#690000").withOpacity(0.35)
                  ),
              child: const Text(
                "Super Cheesy Pizza",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          Container(
            height: 310,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/4193881/pexels-photo-4193881.jpeg?cs=srgb&dl=pexels-ponyo-sakana-4193881.jpg&fm=jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: HexColor("#000000")
                      .withOpacity(0.4) //HexColor("#690000").withOpacity(0.35)
                  ),
              child: const Text(
                "Super Cheesy Pizza",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          Container(
            height: 310,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/3761662/pexels-photo-3761662.jpeg?cs=srgb&dl=pexels-horizon-content-3761662.jpg&fm=jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: HexColor("#000000")
                      .withOpacity(0.4) //HexColor("#690000").withOpacity(0.35)
                  ),
              child: const Text(
                "Super Cheesy Pizza",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
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
                    Icons.timer,
                    color: Colors.red,
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
                            fontWeight: FontWeight.bold, color: Colors.black),
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
            Divider(
              thickness: 2,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.confirmation_number_rounded,
                    color: Colors.orange,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '20% OFF Self Pick up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 200,
                        color: Colors.orangeAccent,
                        child: Text(
                          "Check for available offers",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
