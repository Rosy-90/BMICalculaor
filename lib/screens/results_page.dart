import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String? bmi;
  final String? bmiResult;
  final String? inter;
  const ResultsPage(
      {super.key,
      required this.bmi,
      required this.bmiResult,
      required this.inter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI CALCULATOR")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
              child: Text(
            "Your Result",
            style: titleTextStyle,
            textAlign: TextAlign.center,
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    bmiResult!,
                    style: resultTextStyle,
                  )),
                  Expanded(
                      child: Text(
                    bmi!,
                    style: bmiTextStyle,
                  )),
                  Expanded(
                      child: Text(
                    inter!,
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: "RE-CALCULATE")
        ],
      ),
    );
  }
}
