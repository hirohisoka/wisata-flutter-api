import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisata/homepage.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Image.asset(
                'images/wisata.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              child: Text(
                'WISATA INDONESIA',
                style: TextStyle(

                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
