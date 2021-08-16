import 'package:flutter/material.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminPromo extends StatefulWidget {
  @override
  _AdminPromoState createState() => _AdminPromoState();
}

class _AdminPromoState extends State<AdminPromo> {
  TextEditingController id = TextEditingController(text: "");
  TextEditingController name = TextEditingController(text: "");
  TextEditingController code = TextEditingController(text: "");
  TextEditingController amount = TextEditingController(text: "");
  bool isActive = true;
  String imgUrl = "";

  bool isEdit = false;
  int _groupValue = 0;
  @override
  Widget build(BuildContext context) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Promotions",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          )),
                      TextButton(
                          child:
                              Text("Add Promo", style: TextStyle(fontSize: 14)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(20)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).accentColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          onPressed: () {
                            setState(() {
                              isEdit = false;
                              name.clear();
                              id.clear();
                              code.clear();
                              amount.clear();
                              imgUrl = "";
                            });
                          }),
                    ],
                  ),
                  Divider(color: Colors.white),
                  promoList(),
                ],
              ),
            ),
          ),
          addNewPromo()
        ],
      ),
    );
  }

  promoList() {
    return Container(
      //height: 1200,
      //color: Colors.red,
      width: MediaQuery.of(context).size.width / 2,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: promotions.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(
                        width: 5.0,
                        color: promotions[index].status
                            ? Theme.of(context).accentColor
                            : Colors.grey),
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
                    backgroundImage: NetworkImage(promotions[index].url),
                  ),
                  title: Wrap(
                    children: [
                      Text(promotions[index].name,
                          style: TextStyle(fontWeight: FontWeight.w900)),
                      Text(promotions[index].status ? " Active" : " Inactive",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: menus[index].isActive
                                  ? Theme.of(context).accentColor
                                  : Colors.grey)),
                    ],
                  ),
                  subtitle: Text(promotions[index].promoCode),
                  trailing: Container(
                    child: Wrap(
                      children: [
                        Text(menus[index].id,
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15)),
                        VerticalDivider(
                          color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              imgUrl = promotions[index].url;
                              isEdit = true;
                              id.text = promotions[index].id;
                              name.text = promotions[index].name;
                              code.text = promotions[index].promoCode;
                            });
                          },
                          child: Icon(
                            Icons.edit_outlined,
                            color: Theme.of(context).accentColor,
                          ),
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

  idGenerator() {
    setState(() {
      id.text = new DateTime.now().millisecondsSinceEpoch.toString();
      code.text = new DateTime.now().millisecondsSinceEpoch.toString();
    });
  }

  addNewPromo() {
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
              Text("Add Promotion",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
              Divider(color: Colors.white),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: HexColor("#F2F2F2"),
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                ),
              ),
              Divider(color: Colors.white),
              textField("01291737171",
                  needHeader: true, header: "ID", text: id),
              Divider(color: Colors.white),
              textField("Fisttimefree",
                  needHeader: true, header: "Name", text: name),
              Divider(color: Colors.white),
              textField("100",
                  needHeader: true, header: "amount", text: amount),
              radioButton(),
              Divider(color: Colors.white),
              textField("abc123-0002",
                  needHeader: true, header: "Code", text: code),
              Divider(color: Colors.white),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  idGenerator();
                },
                child: const Text(
                  'Generate Id & code',
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: submit(),
      ),
    );
  }

  radioButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new Radio(
          value: 0,
          groupValue: _groupValue,
          onChanged: (int? value) {
            setState(() {
              _groupValue = value!;
            });
          },
        ),
        new Text(
          'RM',
          style: new TextStyle(fontSize: 16.0),
        ),
        new Radio(
          value: 1,
          groupValue: _groupValue,
          onChanged: (int? value) {
            setState(() {
              _groupValue = value!;
            });
          },
        ),
        new Text(
          '%',
          style: new TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  submit() {
    return GestureDetector(
      onTap: () {
        if (id.text.isNotEmpty && name.text.isNotEmpty) {
          final addPromo = Promotion(id.text, name.text, true, code.text,
              "https://i.ibb.co/NFfysyq/No-Image-Available.png");
          setState(() {
            promotions.add(addPromo);
            id.clear();
            name.clear();
            code.clear();
            amount.clear();
          });
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Yay! Promo Added!')));
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
          isEdit ? "Update" : "Save",
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
