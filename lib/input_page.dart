import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0XFF1DE33);
const bottomColor = Color(0XFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  child: ReusableCard(activeCardColor),
                ),
                Expanded(child: ReusableCard(activeCardColor))
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

class ReusableCard extends StatelessWidget {
  ReusableCard(this.cardColor, [this.cardChild]);

  final Color cardColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
