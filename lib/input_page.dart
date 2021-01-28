import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Icon_content.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 170;

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
                  Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      })
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(kactiveCardColor)),
                Expanded(child: ReusableCard(kactiveCardColor))
              ],
            )),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              color: kbottomColor,
              width: double.infinity,
              height: kbottomContainerHeight,
            )
          ],
        ));
  }
}
