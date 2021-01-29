import 'package:flutter/material.dart';

import '../constants.dart';

class ContentWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  ContentWidget(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: klabelTextStyle,
        )
      ],
    );
  }
}
