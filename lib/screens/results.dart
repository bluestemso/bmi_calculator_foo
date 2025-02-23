import 'package:bmi_calculator_foo/screens/input_page.dart';
import 'package:bmi_calculator_foo/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';


class Results extends StatelessWidget {
  const Results({super.key, required this.bmi, required this.result, required this.interpretation});

  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;


    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Your results:',
              style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(result,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: colorScheme.onSecondaryContainer),
                    ),
                    SizedBox(height: 80.0),
                    Text(bmi,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,),),
                    SizedBox(height: 60.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(interpretation,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => InputPage()),
            );},
            child: Container(
              color: colorScheme.primary,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: Text("RECALCULATE BMI",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
