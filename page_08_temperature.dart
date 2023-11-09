import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double inputValue = 0.0;
  double convertedValue = 0.0;
  String inputUnit = 'Celsius';
  String outputUnit = 'Fahrenheit';
  List<String> units = ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur'];

  void updateValues(double value, String input, String output) {
    double convertedValueInOutputUnit = 0.0;

    switch (input) {
      case 'Celsius':
        if (output == 'Fahrenheit') {
          convertedValueInOutputUnit = (value * 9 / 5) + 32;
        } else if (output == 'Kelvin') {
          convertedValueInOutputUnit = value + 273.15;
        } else if (output == 'Reamur') {
          convertedValueInOutputUnit = value * 4 / 5;
        } else {
          convertedValueInOutputUnit = value;
        }
        break;
      case 'Fahrenheit':
        if (output == 'Celsius') {
          convertedValueInOutputUnit = (value - 32) * 5 / 9;
        } else if (output == 'Kelvin') {
          convertedValueInOutputUnit = (value + 459.67) * 5 / 9;
        } else if (output == 'Reamur') {
          convertedValueInOutputUnit = (value - 32) * 4 / 9;
        } else {
          convertedValueInOutputUnit = value;
        }
        break;
      case 'Kelvin':
        if (output == 'Celsius') {
          convertedValueInOutputUnit = value - 273.15;
        } else if (output == 'Fahrenheit') {
          convertedValueInOutputUnit = (value * 9 / 5) - 459.67;
        } else if (output == 'Reamur') {
          convertedValueInOutputUnit = (value - 273.15) * 4 / 5;
        } else {
          convertedValueInOutputUnit = value;
        }
        break;
      case 'Reamur':
        if (output == 'Celsius') {
          convertedValueInOutputUnit = value * 5 / 4;
        } else if (output == 'Fahrenheit') {
          convertedValueInOutputUnit = (value * 9 / 4) + 32;
        } else if (output == 'Kelvin') {
          convertedValueInOutputUnit = (value * 5 / 4) + 273.15;
        } else {
          convertedValueInOutputUnit = value;
        }
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
        title: Text('Temperature Converter'),
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
                Text('Converted Value: $convertedValue $outputUnit'),
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
