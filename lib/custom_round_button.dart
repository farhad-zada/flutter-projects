import 'package:flutter/material.dart';

import 'constants.dart';

class CustomRoundButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  const CustomRoundButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: kCustomIconColor,
      child: Icon(icon),
    );
  }
}
