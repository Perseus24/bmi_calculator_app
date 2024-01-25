

import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult, required this.bmiDesc, required this.bmiInter});

  final String bmiInter;
  final String bmiDesc;
  final String bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
           child: Container(
             margin: EdgeInsets.only(left: 10, top: 20),
             child: Text('Your Result', style: kVeryLargeButtonTextStyle,),
           )
          ),
          Expanded(
            flex: 6,
            child: HomePageWidgets(
              changeColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiDesc.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: kResultTextColor
                    ),
                  ),
                  Text(
                      bmiResult,
                    style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w900
                    )
                  ),
                  Text(
                    bmiInter,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  )
                ],
              ),
            )
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onPressed: (){
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context){
                    return InputPage();
                  })
              );
            },
          )
        ],
      ),
    );
  }
}
