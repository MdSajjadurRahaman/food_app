import 'dart:math';

import 'package:flutter/material.dart';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/Desktopview/adminSide/adminMenu.dart';
import 'package:food_app/Desktopview/adminSide/adminOrder.dart';
import 'package:food_app/Desktopview/adminSide/adminPromo.dart';
import 'package:food_app/Desktopview/adminSide/adminReport.dart';
import 'package:food_app/Desktopview/adminSide/adminSetting.dart';
import 'package:food_app/widgets/chart.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uuid/uuid.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<CollapsibleItem> _items = [];
  String _headline = "";
  int accept = 0;
  AssetImage _avatarImg = AssetImage('assets/images/foodLogotitle.png');
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  addDummyOrder() async {
    Random random = new Random();
    int randomStatus = random.nextInt(3);
    double totalBeforeTax = 0;
    double total = 0;
    double tax = 0;
    double deliveryfee = 5;
    for (int i = 1; i < 4; i++) {
      int randomNumber = random.nextInt(menus.length + 1);
      final addCart = Cart(
        menus[randomNumber].id,
        menus[randomNumber].name,
        randomStatus + 1,
        menus[randomNumber].price,
        menus[randomNumber].url,
      );
      totalBeforeTax += (menus[randomNumber].price * (randomStatus + 1));
      setState(() {
        cart.add(addCart);
        print(cart.length);
      });
    }
    tax = totalBeforeTax * (restaurant[0].tax / 100);
    total = totalBeforeTax + tax + deliveryfee;
    await showDialog(
      context: context,
      builder: (context) {
        String contentText = "Content of Dialog";
        return StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              body: Container(
                padding: EdgeInsets.all(50),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_active_rounded,
                      size: 100,
                      color: Colors.white,
                    ),
                    Text(
                      "New Order Alert",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      "test@gmail.com",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 50,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              accept = 1;
                            });
                          },
                          child: Text(
                            "Accept",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: accept == 1
                                      ? Colors.white
                                      : Colors.white38,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              accept = 2;
                            });
                          },
                          child: Text(
                            "Reject",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: accept == 2
                                      ? Colors.white
                                      : Colors.white38,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Confrim ?",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Offstage(
                      offstage: accept == 0,
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 50,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (accept == 1) {
                                var orderId = Uuid().v4();
                                final addOrder = Order(
                                    orderId,
                                    "test@mail.com",
                                    0,
                                    List.from(cart),
                                    0,
                                    "Bangsar, Kuala Lumpur",
                                    DateTime.now(),
                                    0,
                                    deliveryfee,
                                    tax,
                                    total);
                                setState(() {
                                  print("hehe");
                                  order.add(addOrder);
                                  cart.clear();
                                  accept = 0;
                                });
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                                setState(() {
                                  accept = 0;
                                });
                              }
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                accept = 0;
                              });
                            },
                            child: Text(
                              "No",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    setState(() {});
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.store_mall_directory,
        onPressed: () => setState(() {
          pageController.jumpToPage(0);
        }),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Orders',
        icon: Icons.history,
        onPressed: () => setState(() {
          pageController.jumpToPage(1);
        }),
      ),
      CollapsibleItem(
        text: 'Menus',
        icon: Icons.assignment,
        onPressed: () => setState(() {
          pageController.jumpToPage(2);
        }),
      ),
      CollapsibleItem(
        text: 'Promotions',
        icon: Icons.confirmation_number_rounded,
        onPressed: () => setState(() {
          pageController.jumpToPage(3);
        }),
      ),
      CollapsibleItem(
        text: 'Report',
        icon: Icons.multiline_chart,
        onPressed: () => setState(() {
          pageController.jumpToPage(4);
        }),
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () => setState(() {
          pageController.jumpToPage(5);
        }),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor("#F8F8FA"),
      body: SafeArea(
        child: CollapsibleSidebar(
          items: _items,
          avatarImg: _avatarImg,
          title: 'Pizza Restaurant',
          onTitleTap: () {
            addDummyOrder();
          },
          body: PageView(
            children: <Widget>[
              Dashboard(),
              AdminOrder(),
              AdminMenu(),
              AdminPromo(),
              AdminReport(),
              AdminSetting()
            ],
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
          ),
          backgroundColor: Colors.black,
          selectedTextColor: Colors.limeAccent,
          selectedIconBox: Theme.of(context).accentColor,
          selectedIconColor: Colors.white,
          textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
          titleStyle: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          toggleTitleStyle:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Text(
              _headline,
              style: Theme.of(context).textTheme.headline1,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('assets/images/foodLogotitle.png'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Dashboard'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Menu'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Orders'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Promotions'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            color: HexColor("#EBEBEB"),
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(30),
        //padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 50),
                    height: 100,
                    //margin: EdgeInsets.only(bottom: 10),
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pizza Restaurant Sdn. Bhd.",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          "Kuala Lumpur, Malaysia",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          "SSN : 023193019380182301",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  salesWidget("Today's Sales", 500,
                      "https://image.flaticon.com/icons/png/512/1134/1134921.png"),
                  VerticalDivider(),
                  salesWidget("This Week Sales", 2000,
                      "https://image.flaticon.com/icons/png/512/4285/4285646.png"),
                  VerticalDivider(),
                  salesWidget("This Month Sales", 10000,
                      "https://image.flaticon.com/icons/png/512/2413/2413641.png"),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: LineChartSample1(),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Image(
                        image: NetworkImage(
                            "https://i.ibb.co/hMHDj7h/download.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Text(
                      "Hi Admin!",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      "Welcome to Pizza Dashboard, here you can manage your Income, Orders, Promotions, Menu and other! ",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  salesWidget(String title, double amount, String url) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        height: 120,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(url),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  "RM " + amount.toString(),
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  salesList(Color color, String title, String subtitle) {
    return ListTile(
      leading: Icon(
        Icons.money,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
    );
  }

  customerList(Color color, String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.people,
          color: color,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(subtitle),
      ],
    );
  }
}
