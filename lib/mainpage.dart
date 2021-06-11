import 'package:flutter/material.dart';
import 'package:food_app/Mainpages/homepage.dart';
import 'package:food_app/Mainpages/menupage.dart';
import 'package:food_app/Mainpages/morepage.dart';
import 'package:food_app/Mainpages/orderpage.dart';
import 'package:food_app/Mainpages/promopage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isSignedIn = false;
  PageController pageController = PageController(initialPage: 0);
  int getPageIndex = 0;

  onTapChangePage(int pageIndex) {
    pageController.jumpToPage(pageIndex);
  }

  whenPageChanges(int pageIndex) {
    setState(() {
      this.getPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSignedIn) {
      return homeScreen();
    } else {
      return loginScreen(); //BuildSignInScreen();
    }
  }

  loggedIn() {
    setState(() {
      isSignedIn = true;
    });
  }

  homeScreen() {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Homepage(),
          Promopage(),
          Orderpage(),
          Morepage(),
        ],
        controller: pageController,
        onPageChanged: whenPageChanges,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        //color: Colors.black,
        child: SalomonBottomBar(
          currentIndex: getPageIndex,
          //backgroundColor: Colors.orangeAccent,
          onTap: onTapChangePage,
          items: [
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.home,
                  color: getPageIndex == 0
                      ? HexColor("#FF9900")
                      : HexColor("#3C3C3C"),
                ),
                //unselectedColor: HexColor("#3C3C3C"),
                selectedColor: HexColor("#FF9900"),
                title: Text("Home")),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.confirmation_number_rounded,
                  color: getPageIndex == 1
                      ? HexColor("#FF9900")
                      : HexColor("#3C3C3C"),
                ),
                selectedColor: HexColor("#FF9900"),
                title: Text("Promo")),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.history,
                  color: getPageIndex == 2
                      ? HexColor("#FF9900")
                      : HexColor("#3C3C3C"),
                ),
                selectedColor: HexColor("#FF9900"),
                title: Text("Order")),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.menu,
                  color: getPageIndex == 3
                      ? HexColor("#FF9900")
                      : HexColor("#3C3C3C"),
                ),
                selectedColor: HexColor("#FF9900"),
                title: Text("More")),
          ],
        ),
      ),
    );
  }

  loginScreen() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              child: Image(
                image: AssetImage("assets/images/logo2.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              "Your best food app service!",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sign In",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                loggedIn();
              },
              child: Container(
                padding: EdgeInsets.all(15),
                height: 60,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 2, color: Colors.black12)),
                child: Row(
                  children: [
                    Image.asset("assets/images/google.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Sign in with Google"),
                  ],
                ),
              ),
            ),
            Text("dont have google account ?"),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
