import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onButtonPressed;
  const RoundIconButton(
      {super.key, required this.icon, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        constraints: const BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: const CircleBorder(),
        fillColor: const Color(0XFF4C4F5E),
        onPressed: onButtonPressed,
        child: Icon(icon));
  }
}
