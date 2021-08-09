import 'package:flutter/material.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminMenu extends StatefulWidget {
  @override
  _AdminMenuState createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  TextEditingController name = TextEditingController(text: "");
  TextEditingController price = TextEditingController(text: "");
  TextEditingController category = TextEditingController(text: "");
  TextEditingController desc = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor("#F8F8FA"),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(50),
              child: ListView(
                children: [
                  Text("Menus",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
                  Divider(color: Colors.white),
                  menu(),
                ],
              ),
            ),
          ),
          addNewMenu()
        ],
      ),
    );
  }

  menu() {
    return Container(
      //height: 1200,
      //color: Colors.red,
      width: MediaQuery.of(context).size.width / 2,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: menus.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(
                        width: 5.0, color: Theme.of(context).accentColor),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: -10,
                      blurRadius: 10,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(menus[index].url),
                  ),
                  title: Text(menus[index].name,
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  subtitle: Text(menus[index].category),
                  trailing: Container(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("RM " + menus[index].price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15)),
                        VerticalDivider(
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.edit_outlined,
                          color: Theme.of(context).accentColor,
                        ),
                        Icon(Icons.delete_outline,
                            color: Theme.of(context).accentColor)
                      ],
                    ),
                  ),
                ));
          }),
    );
  }

  addNewMenu() {
    return Expanded(
      flex: 1,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 3,
                blurRadius: 30,
                offset: Offset(0, -10), // changes position of shadow
              ),
            ],
          ),
          child: ListView(
            children: [
              Text("Add New Menu",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
              Divider(color: Colors.white),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: HexColor("#F2F2F2"),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                ),
              ),
              Divider(color: Colors.white),
              textField("Meatlover", text: name),
              Divider(color: Colors.white),
              textField("200", needHeader: true, header: "RM", text: price),
              Divider(color: Colors.white),
              textField("200", text: category),
              Divider(color: Colors.white),
              textField("Lorem ipsum...", multiline: true, text: desc),
            ],
          ),
        ),
        bottomNavigationBar: submit(),
      ),
    );
  }

  submit() {
    return GestureDetector(
      onTap: () {
        if (name.text.isNotEmpty && price.text.isNotEmpty) {
          final addMenu = Menu(
              "123" + name.text,
              name.text,
              double.parse(price.text),
              "https://via.placeholder.com/150.jpg",
              "Pizza");
          setState(() {
            menus.add(addMenu);
            name.clear();
            price.clear();
            category.clear();
            desc.clear();
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: EdgeInsets.only(bottom: 20, left: 50, right: 50),
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        child: Text(
          "Save",
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }

  textField(String hint,
      {bool multiline = false,
      bool needHeader = false,
      String header = "",
      TextEditingController? text}) {
    return Row(
      children: [
        needHeader
            ? Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Theme.of(context).accentColor,
                  child: Text(
                    header,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              )
            : Text(""),
        Expanded(
          flex: 5,
          child: TextField(
            controller: text!,
            textAlign: TextAlign.start,
            keyboardType:
                multiline ? TextInputType.multiline : TextInputType.text,
            maxLines: multiline ? null : 1,
            minLines: multiline ? null : 1,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: HexColor("#F2F2F2"),
            ),
          ),
        ),
      ],
    );
  }
}
