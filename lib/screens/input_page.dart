import 'package:bmicalculator/calculator_brain.dart';
import 'package:bmicalculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/container.dart';
import '../constants.dart';
import '../components/round_button.dart';
import '../components/bottom_button.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height =  180;
  int weight = 60;
  int age = 18;
//
//  Color maleCardColor = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;
//
////  void updateColor(Gender selectedGender){
//    //male card pressed
//    if(selectedGender == Gender.male){
//      if(maleCardColor == inactiveCardColor){
//        maleCardColor = activeCardColor;
//        femaleCardColor = inactiveCardColor;
//      }
//      else{
//        maleCardColor  = inactiveCardColor;
//      }
//    }
//
//    //female card pressed
//    if(selectedGender == Gender.female){
//      if(femaleCardColor == inactiveCardColor){
//        femaleCardColor = activeCardColor;
//        maleCardColor = inactiveCardColor;
//      }
//      else{
//        femaleCardColor  = inactiveCardColor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconContent(gender: 'MALE',genderIcon: FontAwesomeIcons.mars),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconContent(gender: 'FEMALE',genderIcon: FontAwesomeIcons.venus),
                    )
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0)

                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )

                  ],
                ),

              )
            ),
            Expanded( 
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    weight--;
                                  });
                              },
                              ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )

                        ],
                      ),
                    )
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
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
              buttonTitle: 'CALCULATE',
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    )
                  )
                );
              },
            )
          ],
        ));
  }
}


