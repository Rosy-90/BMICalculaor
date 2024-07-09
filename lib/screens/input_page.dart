//import 'dart:js_interop';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../constants.dart';

enum Gender { female, male }

//int weight = 0;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _counter = 0;
  Color maleCardColor = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;
  Gender? selectedGender;

  int height = 180;
  int weight = 60;
  int age = 20;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print("counter is $_counter");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      //body: Container(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateColor(Gender.male);
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? activeCardColour
                          : inActiveCardColour,
                      cardChild: const IconContent(
                        label: "MALE",
                        cardIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateColor(Gender.female);
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? activeCardColour
                          : inActiveCardColour,
                      cardChild: const IconContent(
                          label: "Female", cardIcon: FontAwesomeIcons.venus),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Height", style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        const Text(
                          "cm",
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: const Color(0xFFEB1555),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          inactiveColor: const Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onButtonPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onButtonPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onButtonPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onButtonPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculateBrain calc = CalculateBrain(height, weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmi: calc.calculateBMI(),
                            bmiResult: calc.getResult(),
                            inter: calc.getInterPretation(),
                          )));
            },
            buttonTitle: "CALCULATE",
          )
        ],
      ),
      //),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
