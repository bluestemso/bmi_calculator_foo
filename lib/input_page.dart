import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'gender_column.dart';
import 'constants.dart';
import 'results.dart';

enum Gender {male, female, none}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 60;
  int age = 30;

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
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    backgroundColor: selectedGender == Gender.male ? null : colorScheme.tertiaryContainer,
                    cardChild: GenderColumn(gender: 'MALE'),
                    onPress: () {
                      setState(() {selectedGender = Gender.male;});
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    backgroundColor: selectedGender == Gender.female ? null : colorScheme.tertiaryContainer,
                    cardChild: GenderColumn(gender: 'FEMALE',),
                    onPress: () {
                      setState(() {selectedGender = Gender.female;});
                    }
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              backgroundColor: colorScheme.secondaryContainer,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT",
                      style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                        style: Theme.of(context).textTheme.displayLarge?.copyWith
                          (fontWeight: FontWeight.bold),
                      ),
                      Text("cm",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 18.0,
                      )
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(weight.toString(),
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.bold)
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(age.toString(),
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                fontWeight: FontWeight.bold)
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),)
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Results()),
            );},
            child: Container(
              color: colorScheme.primary,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: Text("CALCULATE BMI",
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

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, this.icon, this.onPress});

  final IconData? icon;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Theme.of(context).colorScheme.secondary,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon,
        color: Theme.of(context).colorScheme.onSecondary,
      )
    );
  }
}
