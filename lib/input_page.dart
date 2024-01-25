import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';


enum GenderNames {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderNames? selectedGender;
  int height = 180;
  int weight = 50;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HomePageWidgets(
                   changeColor: selectedGender == GenderNames.male? kActiveCardColor : kInactiveCardColor,
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
                    changeColor: selectedGender == GenderNames.female? kActiveCardColor : kInactiveCardColor,
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
          Expanded(
            child: HomePageWidgets(
              changeColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                       height.toString(),
                       style: kNumberTextStyle
                      ),
                      Text(
                       'cm',
                       style: kLabelTextStyle,)
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.white,
                    inactiveColor: Color(0xFF8D8E98),
                    thumbColor: kBottomContainerColor,
                    overlayColor: MaterialStateProperty.all(Color(0x29EB1555)),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                  
                    }
                  )
                ],
              ),
            )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HomePageWidgets(
                    changeColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                        style: kLabelTextStyle,),
                        Text(weight.toString(),
                        style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  weight--;
                                });
                              },),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            )

                          ],
                        )
                      ],
                    ),
                  )
                ),
                Expanded(
                  child: HomePageWidgets(
                    changeColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                          style: kLabelTextStyle,),
                        Text(age.toString(),
                          style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },
                            )

                          ],
                        )
                      ],
                    ),

                  )
                )
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onPressed: (){
              CalculatorBrain calculate = CalculatorBrain(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context){
              return ResultsPage(bmiResult: calculate.calculateBMI(height, weight), bmiDesc:  calculate.getDescription(), bmiInter: calculate.getInterpretation());
              })
            );
          },
        ),
      ]
      )
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(child: Text(text, style: kLargeButtonTextStyle,)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}




class RoundIconButton extends StatelessWidget {

  RoundIconButton({required this.icon, required this.onPress});

  final IconData icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon, color: Colors.white,),
      onPressed: onPress
    );
  }
}




//Color(0xFF1D1E33),
