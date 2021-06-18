import 'package:flutter/material.dart';
import 'package:food_app/Mainpages/homepage.dart';
import 'package:food_app/Mainpages/menupage.dart';
import 'package:food_app/Mainpages/morepage.dart';
import 'package:food_app/Mainpages/orderpage.dart';
import 'package:food_app/Mainpages/promopage.dart';
import 'package:food_app/widgets/loginMan.dart';
import 'package:food_app/widgets/sampledata.dart';
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
  bool isCartfilled = true;

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
                      ? Theme.of(context).accentColor
                      : HexColor("#3C3C3C"),
                ),
                //unselectedColor: HexColor("#3C3C3C"),
                selectedColor: Theme.of(context).accentColor,
                title: Text("Home")),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.confirmation_number_rounded,
                  color: getPageIndex == 1
                      ? Theme.of(context).accentColor
                      : HexColor("#3C3C3C"),
                ),
                selectedColor: Theme.of(context).accentColor,
                title: Text("Promo")),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.history,
                  color: getPageIndex == 2
                      ? Theme.of(context).accentColor
                      : HexColor("#3C3C3C"),
                ),
                selectedColor: Theme.of(context).accentColor,
                title: Text("Order")),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.menu,
                  color: getPageIndex == 3
                      ? Theme.of(context).accentColor
                      : HexColor("#3C3C3C"),
                ),
                selectedColor: Theme.of(context).accentColor,
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
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/3343624/pexels-photo-3343624.jpeg?crop=entropy&cs=srgb&dl=pexels-arthur-brognoli-3343624.jpg&fit=crop&fm=jpg&h=959&w=640"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop)),
        ),
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
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "The best food app in town!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat convallis cras vel rhoncus fringilla.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w200),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginMan()));
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  height: 57,
                  width: 293,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2, color: Colors.red)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(10),
                  height: 57,
                  width: 293,
                  decoration: BoxDecoration(
                      color: Color(0x00000000),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2, color: Colors.red)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Text(
              "Or, Login with",
              style: TextStyle(color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                loggedIn();
              },
              child: Container(
                padding: EdgeInsets.all(8),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 2, color: Color(0x00000000))),
                child: Row(
                  children: [
                    Image.asset("assets/images/google.png"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
