import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {

  GenderWidget({required this.icon, required this.gender});

  final IconData icon;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50.0,
          color: Colors.white,
        ),
        SizedBox(height: 15,),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}