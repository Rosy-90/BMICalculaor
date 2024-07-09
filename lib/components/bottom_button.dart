import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;
  const BottomButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: bottomHeightConstraint,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        color: bottomContainerColour,
        padding: const EdgeInsets.only(bottom: 20),
        child: Center(
          child: Text(
            buttonTitle,
            style: largeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
