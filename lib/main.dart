import 'package:flutter/material.dart';
import 'page_00_splash.dart';

void main() {
  runApp(UTS());
}

class UTS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utilities',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Warna primer coklat terang
        hintColor: Colors.white, // Warna aksen putih
      ),
      initialRoute: '/splash',
      routes: {
        '/splash' : (context) => SplashScreen(),
      },
    );
  }
}