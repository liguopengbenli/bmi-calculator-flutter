import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(this.cardColor, [this.cardChild, this.touchFunction]);

  final Color cardColor;
  final Widget cardChild;
  final Function touchFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: touchFunction,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
