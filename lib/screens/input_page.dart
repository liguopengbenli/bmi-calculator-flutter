import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/Icon_content.dart';
import '../components/bottom_button.dart';
import '../components/icon_button.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 170;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      selectedGender == Gender.male
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      ContentWidget(FontAwesomeIcons.mars, "'MALE'"), () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  }),
                ),
                Expanded(
                  child: ReusableCard(
                      selectedGender == Gender.female
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      ContentWidget(FontAwesomeIcons.venus, "'FEMALE'"), () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  }),
                ),
              ],
            )),
            Expanded(
                child: ReusableCard(
              kactiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm', style: klabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }))
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  kactiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: klabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(FontAwesomeIcons.plus, () {
                            setState(() {
                              weight++;
                            });
                          }),
                          SizedBox(width: 10),
                          CustomIconButton(FontAwesomeIcons.minus, () {
                            setState(() {
                              weight--;
                            });
                          }),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: ReusableCard(
                    kactiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                            SizedBox(width: 10),
                            CustomIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            BottomBtn('CALCULATE', () {
              CalculatorBrain calc = CalculatorBrain(height, weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            calc.calculateBMI(),
                            calc.getResult(),
                            calc.getInterpretation(),
                          )));
            })
          ],
        ));
  }
}
