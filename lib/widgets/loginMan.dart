import 'package:flutter/material.dart';
import 'package:food_app/mainpage.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/registMan.dart';

class loginMan extends StatefulWidget {
  @override
  _loginManState createState() => _loginManState();
}

class _loginManState extends State<loginMan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/1301945/pexels-photo-1301945.jpeg?crop=entropy&cs=srgb&dl=pexels-kevin-bidwell-1301945.jpg&fit=crop&fm=jpg&h=960&w=640"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop)),
        ),
        padding: EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: 100,
              child: Image(
                image: AssetImage("assets/images/logo2.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Welcome!",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Login to your account.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 25,
            ),
            buildTextField("Email or Username", ""),
            buildTextField("Password", ""),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(10),
                  height: 57,
                  width: 293,
                  decoration: BoxDecoration(
                      color: Color(0x00000000),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2, color: Colors.red)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Center(
                child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Or, Login with",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 2, color: Color(0x00000000))),
                      child: Row(
                        children: [
                          Image.asset("assets/images/google.png"),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => registMan()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, hintText) {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          fillColor: Colors.red,
          filled: false,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.white)),
          focusColor: Colors.white,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white)),
    );
  }
}
