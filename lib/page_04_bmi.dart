import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  double weight = 0.0;
  double height = 0.0;
  double bmi = 0.0;

String classifyBMI(double bmi) {
  if (bmi < 18.5) {
    return 'Kurus';
  } else if (bmi >= 18.5 && bmi <= 24.9) {
    return 'Normal';
  } else {
    return 'Obesitas';
  }
}

  void calculateBMI() {
    if (weight > 0 && height > 0) {
      double heightInMeters = height / 100;
      double bmiValue = weight / (heightInMeters * heightInMeters);
      setState(() {
        bmi = bmiValue;
      });
      String classification = classifyBMI(bmiValue);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your BMI: ${bmiValue.toStringAsFixed(2)} ($classification)'),
      ),
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Input your weight (kg):'),
            TextField(
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            Text('Input your height (cm):'),
            TextField(
              onChanged: (value) {
                setState(() {
                  height = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Calculate BMI'),
            ),
            Text('Your BMI: ${bmi.toStringAsFixed(2)}'),
          ],
        ),
      ),
      
    );
  }
}