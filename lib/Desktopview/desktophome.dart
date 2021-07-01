import 'package:flutter/material.dart';
import 'package:food_app/Desktopview/adminSide/adminDashboard.dart';
import 'package:food_app/Desktopview/desktopFood.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:food_app/Secondarypages/checkout.dart';
import 'package:food_app/Secondarypages/searchpage.dart';
import 'package:food_app/Tertiarypages/reviewpage.dart';
import 'package:hexcolor/hexcolor.dart';

class Desktophome extends StatefulWidget {
  @override
  _DesktophomeState createState() => _DesktophomeState();
}

class _DesktophomeState extends State<Desktophome> {
  String selectedCategory = "Pizza";

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          menuBar(),
          promoBanner(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 300, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                category(),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: VerticalDivider(
                    width: 5,
                    color: Colors.black12,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                menu(),
              ],
            ),
          )
        ],
      ),
    );
  }

  menuBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 300, vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/images/foodLogotitle.png"),
        ),
        trailing: Wrap(
          spacing: 12, // space between two icons
          children: <Widget>[
            searchbar(),
            GestureDetector(
              onTap: () {
                _signIn();
              },
              child: Container(
                height: 40,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Sign in",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            IconButton(
              icon: Icon(cart.isNotEmpty
                  ? Icons.shopping_cart_rounded
                  : Icons.shopping_cart_outlined),
              color: Theme.of(context).accentColor,
              onPressed: () async {
                final success = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return Checkout();
                }));
              },
            ), // icon-2
          ],
        ),
      ),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.black12),
      )),
    );
  }

  promoBanner() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 300, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
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
                ),
              )),
    );
  }

  category() {
    return Container(
        margin: EdgeInsets.only(bottom: 15, top: 5),
        width: 200,
        //height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        "Our Menu",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = "all";
                          print(selectedCategory);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "All menu",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: selectedCategory == "all"
                                  ? Theme.of(context).accentColor
                                  : Colors.black,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = categories[index].category;
                            print(selectedCategory);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            categories[index].category,
                            style: TextStyle(
                                color: selectedCategory ==
                                        categories[index].category
                                    ? Theme.of(context).accentColor
                                    : Colors.black,
                                fontSize: 15),
                          ),
                        ))
                  ],
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index].category;
                      print(selectedCategory);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(categories[index].category,
                        style: TextStyle(
                            color:
                                selectedCategory == categories[index].category
                                    ? Theme.of(context).accentColor
                                    : Colors.black,
                            fontSize: 15)),
                  ),
                );
              }
            }));
  }

  searchbar() {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 10),
      height: 40,
      width: 300,
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
              textInputAction: TextInputAction.go,
              onSubmitted: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Searchpage(search: searchController.text)),
                );
              },
              keyboardType: TextInputType.text,
              controller: searchController,
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
    List<Menu> homepageMenus;
    if (selectedCategory == "all") {
      homepageMenus = List.from(menus);
    } else {
      homepageMenus = List.from(
          menus.where((element) => element.category == selectedCategory));
    }

    return Container(
      //height: 1200,
      //color: Colors.red,
      width: MediaQuery.of(context).size.width / 2,
      child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 30, mainAxisSpacing: 60, crossAxisCount: 4),
          itemCount: homepageMenus.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                showFood(context,
                    id: homepageMenus[index].id,
                    name: homepageMenus[index].name,
                    price: homepageMenus[index].price,
                    category: homepageMenus[index].category,
                    url: homepageMenus[index].url);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    //margin: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(homepageMenus[index].url),
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
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      homepageMenus[index].name, //sampledata
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 18),
                    ),
                    subtitle: Text(
                      "RM " +
                          homepageMenus[index].price.toString(), //sampledata
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.shopping_cart_rounded),
                      color: Theme.of(context).accentColor,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            );
          }),
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
      var contain = cart.where(
        (element) => element.foodId == input[0],
      );
      if (contain.isNotEmpty) {
        print("hiyahiya");
        cart[cart.indexWhere((element) => element.foodId == input[0])]
            .quantity++;
        cart[cart.indexWhere((element) => element.foodId == input[0])].price =
            menus[menus.indexWhere((element) => element.id == input[0])].price *
                cart[cart.indexWhere((element) => element.foodId == input[0])]
                    .quantity;
      } else {
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

  Future<void> _signIn() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign in'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo food app.'),
                Text('Click bellow button to sign in as the restaurant admin'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                  child: new RaisedButton(
                      padding: EdgeInsets.all(10),
                      color: const Color(0xFF4285F4),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminDashboard()),
                        );
                      },
                      child: Text(
                        "Sign in with Google",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
