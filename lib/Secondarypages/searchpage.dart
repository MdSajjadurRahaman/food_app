import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:hexcolor/hexcolor.dart';

class Searchpage extends StatefulWidget {
  final String search;
  Searchpage({
    required this.search,
  });
  @override
  _SearchpageState createState() => _SearchpageState(search: search);
}

class _SearchpageState extends State<Searchpage> {
  final String search;
  _SearchpageState({
    required this.search,
  });
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    searchController = TextEditingController(text: search);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, strTitle: "Search", disappearedBackButton: false),
      //backgroundColor: HexColor("#F3F3F3"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [searchBar()],
        ),
      ),
    );
  }

  searchBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
