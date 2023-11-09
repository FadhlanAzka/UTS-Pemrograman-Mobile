import 'package:flutter/material.dart';
import 'page_01_home.dart';
import 'page_03_aboutdev.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Aplikasi Konversi dan Kalkulator',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Ini adalah aplikasi yang membantu Anda dalam aktivitas sehari-hari dengan menyediakan berbagai fitur berguna.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Fitur Aplikasi:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '1. BMI Calculator: Hitung indeks massa tubuh Anda dan lihat status berat badan Anda.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '2. Konversi Suhu: Konversi suhu antara Celcius, Fahrenheit, dan Kelvin.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '3. Konversi Panjang: Konversi panjang antara unit metrik dan imperial.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '4. Konversi Massa: Konversi massa antara unit metrik dan imperial.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '5. Konversi Mata Uang: Konversi mata uang berdasarkan nilai tukar yang terbaru.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '6. Konversi Music Chord Scale: Konversi akord musik dan skala.',
              style: TextStyle(fontSize: 16),
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
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Home(),
            ));
          } else if (index == 2) { // Index 2 adalah tombol "Notification"
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AboutDev(), // Pindah ke halaman "Notification"
            ));
          }
        }
      ),
    );
  }
}