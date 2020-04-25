import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.gender,@required this.genderIcon});
  final String gender;
  final IconData genderIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          genderIcon,
          size: 60.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
            gender,
            style: kLabelTextStyle,
        )
      ],
    );
  }
}