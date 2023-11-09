import 'package:flutter/material.dart';

class LengthConverter extends StatefulWidget {
  @override
  _LengthConverterState createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  double inputValue = 0.0;
  double convertedValue = 0.0;
  String inputUnit = 'km';
  String outputUnit = 'm';
  List<String> units = ['km', 'hm', 'dam', 'm', 'dm', 'cm', 'mm', 'mi', 'yd', 'ft', 'in'];

  void updateValues(double value, String input, String output) {
    double valueInMeters = 0.0;

    switch (input) {
      case 'km':
        valueInMeters = value * 1000;
        break;
      case 'hm':
        valueInMeters = value * 100;
        break;
      case 'dam':
        valueInMeters = value * 10;
        break;
      case 'm':
        valueInMeters = value;
        break;
      case 'dm':
        valueInMeters = value / 10;
        break;
      case 'cm':
        valueInMeters = value / 100;
        break;
      case 'mm':
        valueInMeters = value / 1000;
        break;
      case 'mi':
        valueInMeters = value * 1609.34;
        break;
      case 'yd':
        valueInMeters = value * 0.9144;
        break;
      case 'ft':
        valueInMeters = value * 0.3048;
        break;
      case 'in':
        valueInMeters = value * 0.0254;
        break;
    }

    double convertedValueInOutputUnit = 0.0;

    switch (output) {
      case 'km':
        convertedValueInOutputUnit = valueInMeters / 1000;
        break;
      case 'hm':
        convertedValueInOutputUnit = valueInMeters / 100;
        break;
      case 'dam':
        convertedValueInOutputUnit = valueInMeters / 10;
        break;
      case 'm':
        convertedValueInOutputUnit = valueInMeters;
        break;
      case 'dm':
        convertedValueInOutputUnit = valueInMeters * 10;
        break;
      case 'cm':
        convertedValueInOutputUnit = valueInMeters * 100;
        break;
      case 'mm':
        convertedValueInOutputUnit = valueInMeters * 1000;
        break;
      case 'mi':
        convertedValueInOutputUnit = valueInMeters / 1609.34;
        break;
      case 'yd':
        convertedValueInOutputUnit = valueInMeters / 0.9144;
        break;
      case 'ft':
        convertedValueInOutputUnit = valueInMeters / 0.3048;
        break;
      case 'in':
        convertedValueInOutputUnit = valueInMeters / 0.0254;
        break;
    }

    setState(() {
      inputValue = value;
      convertedValue = convertedValueInOutputUnit;
      inputUnit = input;
      outputUnit = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Length Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Textbox untuk input
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Input Value',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center, // Penambahan properti textAlign
                    onChanged: (value) {
                      updateValues(double.tryParse(value) ?? 0.0, inputUnit, outputUnit);
                    },
                  ),
                ),
                SizedBox(width: 20),
                // Dropdown untuk unit konversi input
                DropdownButton<String>(
                  value: inputUnit,
                  items: units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        inputUnit = value;
                        updateValues(inputValue, inputUnit, outputUnit);
                      });
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Hasil konversi
                Text('Converted Value: $convertedValue'),
                // Dropdown untuk unit konversi output
                DropdownButton<String>(
                  value: outputUnit,
                  items: units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        outputUnit = value;
                        updateValues(inputValue, inputUnit, outputUnit);
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}