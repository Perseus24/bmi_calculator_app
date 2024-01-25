
import 'package:flutter/cupertino.dart';

class HomePageWidgets extends StatelessWidget {

  HomePageWidgets({required this.changeColor, this.cardChild, this.onPress});
  final Color changeColor;
  final Widget? cardChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: changeColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: cardChild,
      ),
    );
  }
}