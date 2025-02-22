import 'package:bmi_calculator_foo/input_page.dart';
import 'package:bmi_calculator_foo/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';


class Results extends StatelessWidget {
  const Results({super.key});

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
                    Text('OVERWEIGHT',
                      style: Theme.of(context).textTheme.headlineSmall,),
                    SizedBox(height: 80.0),
                    Text('154',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,),),
                    SizedBox(height: 60.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('A lot of folks are these days.  Don\'t feel bad, you\'re going to be okay.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {Navigator.push(
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
