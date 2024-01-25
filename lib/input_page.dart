import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCard = inactiveCardColor;
  Color femaleCard = inactiveCardColor;

  void tapped(int gender){
    if(gender == 1){
      setState(() {
        if(maleCard == inactiveCardColor){
          maleCard = activeCardColor;
          femaleCard = inactiveCardColor;
        }else{
          maleCard = inactiveCardColor;
        }
      });
    }else{
      setState(() {
        if(femaleCard == inactiveCardColor){
          femaleCard = activeCardColor;
          maleCard = inactiveCardColor;
        }else{
          femaleCard = inactiveCardColor;
        }
      });
    }
  }
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
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      tapped(1);
                    },
                    child: HomePageWidgets(
                     changeColor: maleCard,
                     cardChild: GenderWidget(icon: FontAwesomeIcons.mars, gender:'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      tapped(2);
                    },
                    child: HomePageWidgets(
                      changeColor: femaleCard,
                      cardChild: GenderWidget(icon: FontAwesomeIcons.venus, gender:'FEMALE'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: HomePageWidgets(changeColor: activeCardColor,)),
          Expanded(
            child: Row(
              children: [
                Expanded(child: HomePageWidgets(changeColor: activeCardColor,)),
                Expanded(child: HomePageWidgets(changeColor: activeCardColor,))
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      )
    );
  }
}



//Color(0xFF1D1E33),
