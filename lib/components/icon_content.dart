import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.label, required this.cardIcon});

  final String label;
  final IconData cardIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
