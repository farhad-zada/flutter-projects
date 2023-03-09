import 'package:flutter/material.dart';
import 'constants.dart';

class MyIconWidget extends StatelessWidget {
  final String tittle;
  final IconData icon;
  const MyIconWidget({super.key, required this.tittle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
          color: kCustomIconColor,
        ),
        const SizedBox(
          height: 13.0,
          width: double.infinity,
        ),
        Text(
          tittle,
          style: kCustomTextStyle
        ),
      ],
    );
  }
}
