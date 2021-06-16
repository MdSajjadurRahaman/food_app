import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:hexcolor/hexcolor.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    countTotal();
    return Scaffold(
      backgroundColor: HexColor("#F3F3F3"),
      appBar:
          appbar(context, strTitle: "Checkout", disappearedBackButton: false),
      body: Container(
        padding: EdgeInsets.all(30),
        alignment: Alignment.center,
        child: ListView(
          children: [
            cartList(),
            SizedBox(
              height: 20,
            ),
            checkoutDetails()
          ],
        ),
      ),
    );
  }

  cartList() {
    print(cart.length);
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Container(
                        height: 100,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(cart[index].url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(cart[index].name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.black)),
                          Text("rm" + cart[index].price.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Theme.of(context).accentColor)),
                        ],
                      ),
                      trailing: Text(cart[index].quantity.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.black)),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
          Container(
            //margin: EdgeInsets.symmetric(vertical: 10),
            height: 50,
            decoration: BoxDecoration(
              color: HexColor("#EFEFEF"),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: " add note..",
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

  checkoutDetails() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listtile(Icons.motorcycle, Colors.red, "Delivery", "edit"),
          _listtile(
              Icons.location_pin, Colors.blue, "Bangsar, Kuala Lumpur", "edit"),
          _listtile(Icons.alarm, Colors.orangeAccent, "25 mins", "choose time"),
          _listtile(Icons.money, Colors.green, "Online Bank", "change"),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 5,
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.black12,
          ),
          Text(
            "Total",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            "+ delivery fee RM5",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,),
          ),
          Text(
            "+ service fee RM2",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,),
          ),
          Text(
            "RM " + total.toString(),
            style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 40,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Proceed to payment",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Icon(
                  Icons.chevron_right_outlined,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ListTile _listtile(IconData icon, Color color, String title, String trail) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      contentPadding: EdgeInsets.all(0),
      minLeadingWidth: 1,
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        trail,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  countTotal() {
    total = 0.0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].price;
    }
  }
}
