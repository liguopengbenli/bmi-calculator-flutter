import 'package:flutter/material.dart';

import '../constants.dart';

class BottomBtn extends StatelessWidget {
  BottomBtn(this.btnTitle, this.onTap);

  final String btnTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            btnTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        color: kbottomColor,
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}
