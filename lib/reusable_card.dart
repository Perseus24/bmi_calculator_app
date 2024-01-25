
import 'package:flutter/cupertino.dart';

class HomePageWidgets extends StatelessWidget {

  HomePageWidgets({required this.changeColor, this.cardChild});
  final Color changeColor;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: changeColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: cardChild,
    );
  }
}