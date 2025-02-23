import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Color(0xFFFF0351),
        brightness: Brightness.dark,
        useMaterial3: true,
        ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}

