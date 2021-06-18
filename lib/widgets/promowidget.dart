import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:flutter/services.dart';

class Promowidget extends StatefulWidget {
  final String id;

  Promowidget({
    required this.id,
  });
  @override
  _PromowidgetState createState() => _PromowidgetState(id: id);
}

class _PromowidgetState extends State<Promowidget> {
  final String id;

  _PromowidgetState({
    required this.id,
  });

  List<Promotion> _promo = <Promotion>[];

  @override
  Widget build(BuildContext context) {
    _promo
        .add(promotions[promotions.indexWhere((element) => element.id == id)]);
    return Scaffold(
      appBar: appbar(context,
          strTitle: _promo[0].name, disappearedBackButton: false),
      body: Container(
        child: Column(
          children: [
            promoImage(),
            description(),
          ],
        ),
      ),
      bottomSheet: claimPromo(),
    );
  }

  promoImage() {
    return Container(
        height: 150,
        margin: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(_promo[0].url),
            fit: BoxFit.cover,
          ),
        ));
  }

  description() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _promo[0].name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(loremipsum),
        ],
      ),
    );
  }

  claimPromo() {
    return GestureDetector(
      onTap: () {
        if (_promo[0].status) {
          setState(() {
            _promo[0].status = false;
            promotions[promotions
                    .indexWhere((element) => element.id == _promo[0].id)]
                .status = false;

            Clipboard.setData(ClipboardData(text: _promo[0].promoCode));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Promo Claimed & Copied into your clipboard"),
            ));
          });
        }
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: _promo[0].status ? 80 : 120,
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _promo[0].status
                  ? Text("")
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _promo[0].promoCode,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black87),
                          ),
                          GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                    ClipboardData(text: _promo[0].promoCode));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Promocode Copied"),
                                ));
                              },
                              child: Icon(Icons.copy)),
                        ],
                      ),
                    ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: _promo[0].status
                        ? Theme.of(context).accentColor
                        : Colors.black45,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: Text(
                  _promo[0].status ? "Claim Promo" : "Claimed",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
