import 'package:flutter/material.dart';
import 'dart:math' as math show pi;

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:food_app/Desktopview/adminSide/adminMenu.dart';
import 'package:food_app/Desktopview/adminSide/adminOrder.dart';
import 'package:food_app/Desktopview/adminSide/adminPromo.dart';
import 'package:food_app/Desktopview/adminSide/adminReport.dart';
import 'package:food_app/Desktopview/adminSide/adminSetting.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<CollapsibleItem> _items = [];
  String _headline = "";
  AssetImage _avatarImg = AssetImage('assets/images/foodLogotitle.png');
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
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
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
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
          angle: math.pi / 2,
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
      backgroundColor: HexColor("#F8F8FA"),
      body: Container(
        padding: EdgeInsets.all(80),
        child: Column(
          children: [
            Row(
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
                      Text("Pizza Restaurant",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20)),
                      Text("Kuala Lumpur, Malaysia",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black38)),
                      Text("SSN : 023193019380182301",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: -3,
                          blurRadius: 10,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sales Overview",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20)),
                        Divider(color: Colors.white),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  salesList(
                                      Colors.green, "Total Sales", "2131"),
                                  salesList(
                                      Colors.red, "Sales this week", "21"),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  salesList(Colors.blueAccent, "Total Income",
                                      "RM20131"),
                                  salesList(Colors.orangeAccent,
                                      "Income this week", "RM221"),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: -3,
                          blurRadius: 10,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Customer total",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20)),
                        Divider(color: Colors.white),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: customerList(
                                  Colors.green, "504", "Registered"),
                            ),
                            Expanded(
                              flex: 1,
                              child: customerList(
                                  Colors.blueAccent, "30", "Guest"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: -3,
                      blurRadius: 10,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 180,
                      child: Image(
                        image: NetworkImage(
                            "https://i.ibb.co/hMHDj7h/download.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Text("Hi Admin!",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(
                        "Welcome to Pizza Dashboard, here you can manage your Income, Orders, Promotions, Menu and other! ",
                        style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            )
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
