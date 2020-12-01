import 'package:bmicalculator/components/calculate_button.dart';
import 'package:bmicalculator/components/child_content.dart';
import 'package:bmicalculator/components/reuseable_card.dart';
import 'package:bmicalculator/components/round_icon_button.dart';
import 'package:bmicalculator/functions/calculate_brain.dart';
import 'package:bmicalculator/functions/constant.dart';
import 'package:bmicalculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender;
  int height = 180;
  int weight = 74;
  int age = 47;

  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.Male) if (maleCardColor == inactiveCardColor) {
  //     maleCardColor = activeCardColor;
  //     femaleCardColor = inactiveCardColor;
  //   } else {
  //     maleCardColor = inactiveCardColor;
  //   }

  //   if (selectedGender == Gender.Female) if (femaleCardColor == inactiveCardColor) {
  //     femaleCardColor = activeCardColor;
  //     maleCardColor = inactiveCardColor;
  //   } else {
  //     femaleCardColor = inactiveCardColor;

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    onpress: () {
                      setState(() {
                        selectGender = Gender.Male;
                      });
                    },
                    colour: selectGender == Gender.Male
                        ? KActiveCardColor
                        : KInactiveCardColor,
                    cardChild: ChildContent(
                        icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onpress: () {
                      setState(() {
                        selectGender = Gender.Female;
                      });
                    },
                    colour: selectGender == Gender.Female
                        ? KActiveCardColor
                        : KInactiveCardColor,
                    cardChild: ChildContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: KActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: KLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: KNumberTextStyle),
                      Text(
                        'cm',
                        style: KLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x15EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xff8D8E98),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: KLabelTextStyle),
                          Text(
                            weight.toString(),
                            style: KNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: KActiveCardColor),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: KLabelTextStyle),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            buttonText: 'CALCULATE',
            onpresseds: () {
              CalculateBrain calculate = CalculateBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calculate.calculateBmi(),
                    resultText: calculate.getResult(),
                    resultInterpretation: calculate.getInterpretation()  ,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
