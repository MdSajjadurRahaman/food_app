import 'package:flutter/material.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/mainpage.dart';

class Morepage extends StatefulWidget {
  @override
  _MorepageState createState() => _MorepageState();
}

class _MorepageState extends State<Morepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, strTitle: "Hi, Jone Doe"),
      body: tombol(),
    );
  }
}

class MyProfile extends StatelessWidget {
  bool isObscurePassword = true;
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
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            profilPic(),
            SizedBox(height: 30),
            buildTextField("Full Name", "Ikhwanul Jone Doe", false),
            buildTextField("Email", "jone.doe@gmail.com", false),
            buildTextField("Phone Number", "+601112223334", false),
            SizedBox(height: 30),
            ElevatedButton.icon(
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()))
                    },
                icon: Icon(Icons.close),
                label: Text("Sign Out"))
          ],
        ));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ))
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ),
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
                        MaterialPageRoute(builder: (context) => MyProfile()))
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
              onPressed: () => {},
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
              onPressed: () => {},
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
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage("assets/images/google.png"),
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
