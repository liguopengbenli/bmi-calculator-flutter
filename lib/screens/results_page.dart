import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CACULATOR'),
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
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                  kactiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Normal',
                          style: kResultTextStyle,
                        ),
                      ),
                      Text(
                        '18.3',
                        style: kBMITextStyle,
                      ),
                      Text(
                        'Your BMI result is quite low, you should eat more!',
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ),
            BottomBtn('RE-CALCULATE', () {
              Navigator.pop(context);
            })
          ],
        ));
  }
}
