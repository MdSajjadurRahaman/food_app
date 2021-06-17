import 'package:flutter/material.dart';
import 'package:food_app/Mainpages/feedback.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/mainpage.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:food_app/widgets/tabheaderwidget.dart';

class Morepage extends StatefulWidget {
  @override
  _MorepageState createState() => _MorepageState();
}

class _MorepageState extends State<Morepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, strTitle: "Hi, " + profiles[0].user),
      body: tombol(),
    );
  }
}

// ignore: camel_case_types
class inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.red),
        backgroundColor: Colors.white,
        title: Text(
          "Inbox",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Text("No message available"),
      ),
    );
  }
}

class NoProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "My Account",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Center(
                child: profilPic(),
              ),
              SizedBox(height: 30),
              Text(
                profiles[0].user,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              buildTextnoField("Full Name", profiles[0].user),
              buildTextnoField("Email", profiles[0].email),
              buildTextnoField("Phone Number", profiles[0].phone),
              buildTextnoField("Location", profiles[0].location),
              SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyProfile()))
                  },
                  child: Text("Edit My Profile",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.blue)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton.icon(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()))
                },
                icon: Icon(Icons.close),
                label: Text("Sign Out"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          )),
    );
  }

  Widget buildTextnoField(String labelText, hintText) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: UnderlineInputBorder(),
          hintStyle:
              TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
          hintText: hintText,
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24.0),
          labelText: labelText),
    );
  }
}

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(context, strTitle: "Edit my profile"),
        body: Center(
            child: Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    profilPic(),
                    SizedBox(height: 30),
                    buildTextField("Full Name", profiles[0].user),
                    buildTextField("Phone Number", profiles[0].phone),
                    buildTextField("Email", profiles[0].email),
                    buildTextField("Location", profiles[0].location),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () => {Navigator.pop(context)},
                          child: Text("CANCEL",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.red)),
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text("SAVE",
                              style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ))));
  }

  Widget buildTextField(String labelText, hintText) {
    return TextField(
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: UnderlineInputBorder(),
          hintText: hintText,
          labelText: labelText),
    );
  }
}

// ignore: camel_case_types
class tombol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          //profilPic(),
          FlatButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NoProfile()))
                  },
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.account_circle),
                      Text(
                        "   My Account",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey),
                      )
                    ],
                  ))),
          FlatButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => inbox()))
                  },
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.inbox), //change icon here!
                        Text(
                          "   Inbox", //change name here!
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        )
                      ]))),
          FlatButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FeedBack()))
                  },
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.feedback),
                        Text(
                          "   FeedBack",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        )
                      ]))),
          FlatButton(
              onPressed: () => {},
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.help),
                        Text(
                          "   Help",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        )
                      ])))
        ],
      ),
    ));
  }
}

// ignore: camel_case_types
class profilPic extends StatelessWidget {
  const profilPic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            backgroundImage: AssetImage("assets/images/logo2.png"),
          ),
          Positioned(
              right: -12,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: FlatButton(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white)),
                    color: Colors.grey,
                    onPressed: () {},
                    child: Icon(Icons.camera_alt_rounded)),
              ))
        ],
      ),
    );
  }
}
