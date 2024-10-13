import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  Responsive(
      {required this.desktop, required this.tablet, required this.mobile});

  @override
  Widget build(BuildContext context) {
    bool isDesktop(context) => MediaQuery.of(context).size.width >= 1000;
    bool isTab(context) => (MediaQuery.of(context).size.width >= 500 &&
        MediaQuery.of(context).size.width < 1000);
    // bool isMobile(context) => (MediaQuery.of(context).size.width < 500);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isDesktop(context)) {
          // return Text('Desktop');
          return desktop;
        } else if (isTab(context)) {
          //  return Text('Tab');
          return tablet;
        } else
          return mobile;
      },
    );
  }
}
