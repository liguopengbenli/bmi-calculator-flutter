import 'package:flutter/material.dart';

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
                  child: ReusableCard(Color(0XFF1DE33)),
                ),
                Expanded(child: ReusableCard(Color(0XFF1DE33)))
              ],
            )),
            Expanded(child: ReusableCard(Color(0XFF1DE33))),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(Color(0XFF1DE33))),
                Expanded(child: ReusableCard(Color(0XFF1DE33)))
              ],
            )),
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  Color Cardcolor = Color(0XFF1DE33);
  ReusableCard(Color Cardcolor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Cardcolor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
