import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const botomContainerColor = Color(0xFFEB1555);
const homeWidgetsColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                HomePageWidgets(changeColor: homeWidgetsColor,),
                HomePageWidgets(changeColor: homeWidgetsColor,)
              ],
            ),
          ),
          HomePageWidgets(changeColor: homeWidgetsColor,),
          Expanded(
            child: Row(
              children: [
                HomePageWidgets(changeColor: homeWidgetsColor,),
                HomePageWidgets(changeColor: homeWidgetsColor,)
              ],
            ),
          ),
          Container(
            color: botomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      )
    );
  }
}

class HomePageWidgets extends StatelessWidget {

  HomePageWidgets({required this.changeColor});
  final Color changeColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: changeColor,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}

//Color(0xFF1D1E33),
