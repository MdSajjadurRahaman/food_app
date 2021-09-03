import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/Tertiarypages/StripeTest.dart';
import 'package:food_app/Tertiarypages/paymentpage.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uuid/uuid.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  double total = 0.0;
  bool usePromo = false;
  double deliveryFee = 5;
  double tax = 0;
  double totals = 0;
  String discount = "-";
  var _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, strTitle: "", disappearedBackButton: false),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: ListView(
          children: [
            Text(
              "Order Summary",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            cartList(),
            checkoutDetails()
          ],
        ),
      ),
    );
  }

  cartList() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: cart.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Container(
                      height: 40,
                      width: 60,
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
                        Text(
                          cart[index].quantity.toString() +
                              "x " +
                              cart[index].name,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      "RM" + cart[index].price.toString(),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          /*
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
          )*/
        ],
      ),
    );
  }

  checkoutDetails() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          usePromo
              ? Text("Promo used : " + _controller.text)
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).accentColor),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Container(
                      //margin: EdgeInsets.symmetric(vertical: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Promocode..',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          isDense: true,
                          suffixIcon: IconButton(
                            onPressed: () {
                              promoChecK();
                            },
                            icon: Icon(Icons.chevron_right_outlined),
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ))),
          SizedBox(
            height: 10,
          ),
          _listtile(FontAwesomeIcons.locationArrow, Colors.blue,
              "Bangsar, Kuala Lumpur", "edit"),
          _listtile(FontAwesomeIcons.moneyCheck, Colors.green, "Online Bank",
              "change"),
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
            "+ delivery fee = " + deliveryFee.toString(),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black45,
                decorationThickness: 2.85),
          ),
          Text(
            "+ Tax " + restaurant[0].tax.toString() + "% = " + tax.toString(),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black45),
          ),
          usePromo
              ? Text(
                  "- Discount " + discount,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black45),
                )
              : SizedBox(),
          Text(
            "RM " + totals.toString(),
            style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              gotoPayment(context);
            },
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }

  promoChecK() {
    print(totals);
    var contain = promotions.where(
      (element) => element.promoCode == _controller.text,
    );
    if (contain.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Thank you for using our promo"),
      ));
      setState(() {
        int index = promotions
            .indexWhere((element) => element.promoCode == _controller.text);
        if (promotions[index].isPercentage) {
          totals = totals * (promotions[index].amount / 100);
          discount = promotions[index].amount.toString() + "%";
        } else {
          totals = totals - (promotions[index].amount);
          discount = "RM " + promotions[index].amount.toString();
        }
        usePromo = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("No Promo Found with code : " + _controller.text),
      ));
    }
  }

  ListTile _listtile(IconData icon, Color color, String title, String trail) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      contentPadding: EdgeInsets.all(0),
      minLeadingWidth: 1,
      leading: Icon(
        icon,
        size: 20,
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
    setState(() {
      tax = total * (restaurant[0].tax / 100);
      totals = total + tax + 5;
    });
  }

  gotoPayment(
    BuildContext context,
  ) async {
    final success =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (restaurant[0].paymentGateway == "testing") {
        return Paymentpage(total: total);
      } else if (restaurant[0].paymentGateway == "Stripe") {
        return NoWebhookPaymentScreen();
      } else {
        return Paymentpage(total: total);
      }
    }));
    final addOrder;
    if (success != null && success == true) {
      var orderId = Uuid().v4();
      addOrder = Order(orderId, "test@mail.com", 0, List.from(cart), 0,
          "Bangsar, Kuala Lumpur", DateTime.now(), 0, deliveryFee, tax, totals);
      setState(() {
        print("hehe");
        order.add(addOrder);
        print(order.length);
        print(order[0].cart[0].name);
        cart.clear();
        Navigator.pop(context, true);
      });
    } else {
      print("payment_fail");
      Navigator.pop(context);
    }
  }
}
