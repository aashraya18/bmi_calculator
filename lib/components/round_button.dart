import 'package:flutter/material.dart';



class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,@required this.onPress});
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
          width: 36.0,
          height: 36.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4F5E),
    );
  }
}