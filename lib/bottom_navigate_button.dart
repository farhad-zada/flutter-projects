import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';

class BottomNavigateButton extends StatelessWidget {
  final String tittle;
  const BottomNavigateButton({super.key, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 3),
        height: 70,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: kBottomAppBarColor,
          shape: BoxShape.rectangle,
        ),
        constraints: const BoxConstraints.tightFor(height: 58.0, width: 258.0),
        child: Center(
          child: Text(
            tittle.toUpperCase(),
            style: kCustomTextStyle.copyWith(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
