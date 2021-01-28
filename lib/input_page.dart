import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0XFF1D1E33);
const inactiveCardColor = Color(0XFF111328);

const bottomColor = Color(0XFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;

  void updateColor(int gender) {
    if (gender == 1) {
      if (maleColor == inactiveCardColor) {
        maleColor = activeCardColor;
        femaleColor = inactiveCardColor;
      } else {
        maleColor = inactiveCardColor;
      }
    } else {
      if (femaleColor == inactiveCardColor) {
        femaleColor = activeCardColor;
        maleColor = inactiveCardColor;
      } else {
        femaleColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(maleColor,
                        ContentWidget(FontAwesomeIcons.mars, "'MALE'")),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(0);
                      });
                    },
                    child: ReusableCard(femaleColor,
                        ContentWidget(FontAwesomeIcons.venus, "'FEMALE'")),
                  ),
                )
              ],
            )),
            Expanded(child: ReusableCard(activeCardColor)),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(activeCardColor)),
                Expanded(child: ReusableCard(activeCardColor))
              ],
            )),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              color: bottomColor,
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
