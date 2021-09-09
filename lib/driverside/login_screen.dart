import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/driverside/background.dart';
import 'package:food_app/driverside/driverhome.dart';
import 'package:food_app/driverside/signup_screen.dart';

import 'feilds.dart';


class Body extends StatelessWidget {
  const Body({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Backgroundd(
      key: key!,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.02),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {}, key: key!,
            ),
            RoundedPasswordField(
              onChanged: (value) {}, key: key!,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {}, key: key!,
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),

                );

              }, key: key!,

            ),
            OrDivider(),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/google.svg",
                  press: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Driverhome(),));}, key: key!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// GestureDetector(
// onTap: () {
// Navigator.push(context,
// MaterialPageRoute(builder: (context) => LoginScreen(),));
// },
// child: Text(
// "Tap to log in as the driver",
// style: GoogleFonts.poppins(
// textStyle: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.w700,
// fontSize: 12)),
// ),
// ),


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(key: key!,),
    );
  }
}
