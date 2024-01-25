import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

enum GenderNames {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderNames? selectedGender;
  Color maleCard = inactiveCardColor;
  Color femaleCard = inactiveCardColor;

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
                  child: HomePageWidgets(
                   changeColor: selectedGender == GenderNames.male? activeCardColor : inactiveCardColor,
                   cardChild: GenderWidget(icon: FontAwesomeIcons.mars, gender:'MALE'),
                    onPress: (){
                      setState(() {
                        selectedGender = GenderNames.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: HomePageWidgets(
                    changeColor: selectedGender == GenderNames.female? activeCardColor : inactiveCardColor,
                    cardChild: GenderWidget(icon: FontAwesomeIcons.venus, gender:'FEMALE'),
                    onPress: (){
                      setState(() {
                        selectedGender = GenderNames.female;
                      });
                    },
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
