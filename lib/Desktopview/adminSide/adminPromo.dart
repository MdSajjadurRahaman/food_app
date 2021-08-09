import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminPromo extends StatefulWidget {
  @override
  _AdminPromoState createState() => _AdminPromoState();
}

class _AdminPromoState extends State<AdminPromo> {
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
                  Text("Promotions",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
                  Divider(color: Colors.white),
                ],
              ),
            ),
          ),
          addNewPromo()
        ],
      ),
    );
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
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                ),
              ),
              Divider(color: Colors.white),
              textField("Fisttimefree"),
              Divider(color: Colors.white),
              textField("100", needHeader: true, header: "amount"),
              radioButton(),
              Divider(color: Colors.white),
              textField("abc123-0002", needHeader: true, header: "Code"),
              Divider(color: Colors.white),
              textField("Lorem ipsum...", multiline: true),
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

  textField(String hint,
      {bool multiline = false, bool needHeader = false, String header = ""}) {
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
