  import 'package:flutter/material.dart';

class WeightConverter extends StatefulWidget {
  @override
  _WeightConverterState createState() => _WeightConverterState();
}

class _WeightConverterState extends State<WeightConverter> {
  double inputValue = 0.0;
  double convertedValue = 0.0;
  String inputUnit = 'kg';
  String outputUnit = 'g';
  List<String> units = ['kg', 'g', 'mg', 'lb', 'oz'];

  void updateValues(double value, String input, String output) {
    double valueInGrams = 0.0;

    switch (input) {
      case 'kg':
        valueInGrams = value * 1000;
        break;
      case 'g':
        valueInGrams = value;
        break;
      case 'mg':
        valueInGrams = value / 1000;
        break;
      case 'lb':
        valueInGrams = value * 453.592;
        break;
      case 'oz':
        valueInGrams = value * 28.3495;
        break;
    }

    double convertedValueInOutputUnit = 0.0;

    switch (output) {
      case 'kg':
        convertedValueInOutputUnit = valueInGrams / 1000;
        break;
      case 'g':
        convertedValueInOutputUnit = valueInGrams;
        break;
      case 'mg':
        convertedValueInOutputUnit = valueInGrams * 1000;
        break;
      case 'lb':
        convertedValueInOutputUnit = valueInGrams / 453.592;
        break;
      case 'oz':
        convertedValueInOutputUnit = valueInGrams / 28.3495;
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
        title: Text('Weight Converter'),
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
                    textAlign: TextAlign.center,
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
