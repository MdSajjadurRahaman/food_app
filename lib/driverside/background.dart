import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 50,
            left: 40,
            child: Image.asset(
              "assets/images/signup_moon.png",
              width: size.width * 0.20,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class Backgroundd extends StatelessWidget {
  final Widget child;

  const Backgroundd({required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 50,
            left: 40,
            child: Image.asset(
              "assets/images/signin_sun.png",
              width: size.width * 0.20,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
