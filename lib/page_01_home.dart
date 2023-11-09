import 'package:flutter/material.dart';
import 'package:uts_application/page_09_chord.dart';
import 'page_02_aboutapp.dart';
import 'page_03_aboutdev.dart';
import 'page_04_bmi.dart';
import 'page_05_length.dart';
import 'page_06_mass.dart';
import 'page_07_currency.dart';
import 'page_08_temperature.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        padding: EdgeInsets.only(top: 125, left: 10, right: 10),
        children: <Widget>[
          // Fitur 1: BMI Calculator
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BMIScreen()));
            },
            child: Container(
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('BMI'),
            ),
          ),
          // Fitur 2: Konversi Suhu
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TemperatureConverter()));
            },
            child: Container(
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('Konversi Suhu'),
            ),
          ),
          // Fitur 3: Konversi Panjang
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LengthConverter()));
            },
            child: Container(
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('Length Conversion'),
            ),
          ),
          // Fitur 4: Konversi Massa
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WeightConverter()));
            },
            child: Container(
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('Weight Conversion'),
            ),
          ),
          // Fitur 5: Konversi Mata Uang
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CurrencyConverter()));
            },
            child: Container(
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('Konversi Mata Uang'),
            ),
          ),
          // Fitur 6: Konversi Music Chord Scale
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChordDisplayPage()));
            },
            child: Container(
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('Konversi Music Chord Scale'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About App',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About Dev',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (int index) {
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AboutApp(),
            ));
          } else if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AboutDev(),
            ));
          }
        }
      ),
    );
  }
}