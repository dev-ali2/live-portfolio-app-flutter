import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Spacing {
  BuildContext context;

  Spacing(this.context);
  Size getSize() => MediaQuery.of(context).size;

  //static paddings
  static double sp5 = 5;
  static double sp10 = 10;
  static double sp15 = 15;
  static double sp20 = 20;
  static double sp25 = 25;
  static double sp30 = 30;
  static double sp35 = 35;
  static double sp40 = 40;
  //static margins
  static double sm5 = 5;
  static double sm10 = 10;
  static double sm15 = 15;
  static double sm20 = 20;
  static double sm25 = 25;
  static double sm30 = 30;
  static double sm35 = 35;
  static double sm40 = 40;
  //Extras
  static double desktopHeadingTopMargin = 0;
}
