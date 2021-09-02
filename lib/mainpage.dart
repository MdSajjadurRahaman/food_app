import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/Mainpages/homepage.dart';
import 'package:food_app/Mainpages/menupage.dart';
import 'package:food_app/Mainpages/morepage.dart';
import 'package:food_app/Mainpages/orderpage.dart';
import 'package:food_app/Mainpages/promopage.dart';
import 'package:food_app/driverside/driverhome.dart';
import 'package:food_app/widgets/globalWidget.dart';
import 'package:food_app/widgets/loginMan.dart';
import 'package:food_app/widgets/registMan.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:google_fonts/google_fonts.dart';
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
  TextEditingController uname = TextEditingController();
  TextEditingController pwd = TextEditingController();

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
            image: AssetImage("assets/images/bgpizza.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              height: 250,
              child: Image(
                image: AssetImage("assets/images/foodlogo2.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
            Text("The best pizza in town!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20))),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat convallis cras vel rhoncus fringilla.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12))),
            button("Login", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => loginMan()));
            }, Colors.red, Colors.white, rounded: true),
            button("Register", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => registMan()));
            }, Colors.transparent, Colors.white, rounded: true),
            Text(
              "Or, Login using",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12)),
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
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Text(
                  "Not a Customer ?",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Driverhome()));
                  },
                  child: Text(
                    "Tap to log in as the driver",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  loginScreen2() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  child: Image(
                    image: AssetImage("assets/images/foodlogo2.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Lets get started",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25))),
                textField("Username", uname, isWhite: false),
                textField("Password", uname, isWhite: false),
                button("Sign In", () {
                  setState(() {
                    isSignedIn = true;
                  });
                }, Colors.black, Colors.white, rounded: true, height: 50),
                Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                button("Continue with Google", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Driverhome()));
                }, Theme.of(context).accentColor, Colors.white,
                    icon: FontAwesomeIcons.google, rounded: true, height: 50),
              ],
            ),
          ),
        ));
  }
}
