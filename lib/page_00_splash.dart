import 'package:flutter/material.dart';
import 'page_01_home.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context) => Home()));
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 250,)
          ],
        ),
      ),
    );
  }
}