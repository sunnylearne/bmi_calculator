
import 'package:bmicalculator/components/calculate_button.dart';
import 'package:bmicalculator/components/reuseable_card.dart';
import 'package:bmicalculator/functions/constant.dart';
import 'package:flutter/material.dart';



class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  const ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.resultInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR RESULT',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: KTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: KActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(), 
                  style: KResultTextStyle),
                  Text(
                    bmiResult,
                    style: KNumberTextStyle,
                  ),
                  Text(
                    resultInterpretation,
                    style: KResultComment,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: CalculateButton(
              buttonText: 'RE-CALCULATE',
              onpresseds: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
