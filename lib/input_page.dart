import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';

const bottomHeightConstraint = 80.00;
const activeCardColour = Colors.blue;
const inActiveCardColour = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xFFEB1555);

enum Gender {
  female,
  male
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int _counter = 0;
  Color maleCardColor = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;
  Gender? selectedGender;

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
        title: const Text("BMI Calculator"),
      ),
      //body: Container(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap:() {
                      setState(() {
                        //updateColor(Gender.male);
                       selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male ? activeCardColour : inActiveCardColour,
                      cardChild: IconContent(
                        label: "MALE",
                        cardIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap:() {
                      setState(() {
                        //updateColor(Gender.female);
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.female ? activeCardColour : inActiveCardColour,
                      cardChild: IconContent(
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
            ),
          ),
          const Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: activeCardColour),
                ),
                Expanded(
                  child: ReusableCard(colour: activeCardColour),
                ),
              ],
            ),
          ),
          Container(
            height: bottomHeightConstraint,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            color: bottomContainerColour,
          )
        ],
      ),
      //),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}