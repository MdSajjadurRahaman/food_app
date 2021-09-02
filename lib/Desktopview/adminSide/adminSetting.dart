import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/widgets/globalWidget.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fast_color_picker/fast_color_picker.dart';

class AdminSetting extends StatefulWidget {
  @override
  _AdminSettingState createState() => _AdminSettingState();
}

class _AdminSettingState extends State<AdminSetting> {
  Color _color = Colors.red;
  TextEditingController key1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F8F8FA"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 40,
                    children: [
                      Icon(
                        FontAwesomeIcons.cogs,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Settings",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white),
            Text(
              "Restaurants Settings",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Divider(color: Colors.white),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Restaurants Image",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Divider(color: Colors.white),
                      Container(
                        height: 150,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Restaurants Name",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Divider(color: Colors.white),
                        textField(restaurant[0].name),
                        Divider(color: Colors.white),
                        Text(
                          "Restaurants Locations",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Divider(color: Colors.white),
                        textField(restaurant[0].location),
                      ],
                    )),
              ],
            ),
            Divider(color: Colors.white),
            Text(
              "Restaurants Theme Color",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Divider(color: Colors.white),
            Center(
              child: FastColorPicker(
                selectedColor: _color,
                onColorSelected: (color) {
                  setState(() {
                    _color = color;
                  });
                },
              ),
            ),
            Text(
                "*Changing this will effect entire system color including customer side",
                style: TextStyle(fontSize: 12)),
            Divider(color: Colors.white),
            Text(
              "Tax Settings",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Divider(color: Colors.white),
            textField(restaurant[0].tax.toString(),
                needHeader: true, header: "%"),
            Divider(color: Colors.white),
            button("Save", () {}, Theme.of(context).accentColor, Colors.white,
                rounded: true),
            Divider(color: Colors.white),
            Text(
              "System Settings",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Divider(color: Colors.white),
            button("Payment Gateway Settings", () {
              _showMaterialDialog(
                  "Payment Gateway Settings", paymentGatewayOption,
                  needField: true);
            }, Colors.green, Colors.white,
                icon: FontAwesomeIcons.moneyCheck, rounded: true),
            Divider(color: Colors.white),
            button("Delivery Driver Settings", () {
              _showMaterialDialog("Delivery Driver Settings", deliveryOption);
            }, Colors.blue, Colors.white,
                icon: FontAwesomeIcons.truckLoading, rounded: true),
            Divider(color: Colors.white),
            restaurant[0].driver == "internal" ? internalDriver() : SizedBox(),
          ],
        ),
      ),
    );
  }

  internalDriver() {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery Fee",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Divider(color: Colors.white),
            textField("1", needHeader: true, header: "per KM"),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Internal Driver Staff",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                iconButton(Icons.add, () {
                  _showDriverDetails(0, isEdit: false);
                })
              ],
            ),
            Divider(color: Colors.white),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black12),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 250,
                      child: Text(
                        "Driver Email",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Container(
                          width: 250,
                          child: Text(
                            "Driver Name",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          child: Text(
                            "Driver Phone",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: driver.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: Container(
                              width: 250,
                              child: Text(
                                driver[index].email,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            title: Row(
                              children: [
                                Container(
                                  width: 250,
                                  child: Text(driver[index].name,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.black)),
                                ),
                                Container(
                                  width: 250,
                                  child: Text(driver[index].phone,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                            trailing: iconButton(Icons.info, () {
                              _showDriverDetails(index);
                            }));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDriverDetails(int index, {bool isEdit = true}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              isEdit ? "Driver Details" : "Add Driver",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
            content: Container(
                width: 500,
                height: 600,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Driver Name",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    textField(isEdit ? driver[index].name : "john"),
                    Divider(color: Colors.white),
                    Text(
                      "Driver Email",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    textField(
                        isEdit ? driver[index].email : "johndoe@gmail.com"),
                    Divider(color: Colors.white),
                    Text(
                      "Driver Phone",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    textField(isEdit ? driver[index].phone : "+601234567"),
                    Divider(color: Colors.white),
                    Text(
                      "Driver Password",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    isEdit
                        ? button(
                            "Reset Password", () {}, Colors.blue, Colors.white,
                            height: 50)
                        : button("Set default Password", () {}, Colors.blue,
                            Colors.white,
                            height: 50),
                    Divider(color: Colors.white),
                    Text("*Default password is password1",
                        style: TextStyle(fontSize: 12)),
                    Divider(color: Colors.white),
                    isEdit
                        ? button(
                            "Delete Account", () {}, Colors.red, Colors.white,
                            height: 50)
                        : SizedBox(),
                  ],
                )),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Save'),
              )
            ],
          );
        });
  }

  _showMaterialDialog(String title, dynamic list,
      {bool needField = false}) async {
    bool showTxt = false;
    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
              content: Container(
                height: showTxt ? 360 : 250,
                width: 600,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 600,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (list[index].name != "lalamove" &&
                                      list[index].name != "BillPlz") {
                                    for (int i = 0; i < list.length; i++) {
                                      list[i].isActive = false;
                                    }
                                    list[index].isActive = true;
                                    if (list[index].name != "testing" &&
                                        needField) {
                                      showTxt = true;
                                    } else {
                                      showTxt = false;
                                    }
                                  }
                                });
                              },
                              child: Container(
                                child: imgWithText(list[index].url,
                                    list[index].name, list[index].isActive),
                              ),
                            );
                          }),
                    ),
                    Offstage(
                        offstage: !showTxt,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              color: Colors.black12,
                            ),
                            Text("Insert Key",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Divider(
                              color: Colors.white,
                            ),
                            textField("Publishable Key"),
                            Divider(
                              color: Colors.white,
                            ),
                            textField("API Key"),
                          ],
                        ))
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')),
                TextButton(
                  onPressed: () {
                    setState(() {
                      for (int i = 0; i < list.length; i++) {
                        if (list[i].isActive) {
                          if (needField) {
                            restaurant[0].paymentGateway = list[i].name;
                          } else {
                            restaurant[0].driver = list[i].name;
                          }
                        }
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                )
              ],
            );
          });
        });
    setState(() {});
  }

  textField(String hint,
      {bool multiline = false, bool needHeader = false, String header = ""}) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextField(
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
        needHeader
            ? Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.black,
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
      ],
    );
  }

  submit() {
    return GestureDetector(
      onTap: () {},
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
}
