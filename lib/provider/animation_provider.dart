import 'package:flutter/material.dart';

class AnimationProvider with ChangeNotifier {
  Duration minDuration = Duration(milliseconds: 500);
  Duration maxDuration = Duration(seconds: 3600);
  bool showHeadingAbout = false;
  bool showDetailsAbout = false;
  bool showDetailsTech = false;
  bool showHeadingTech = false;
  bool showDetailsProjects = false;
  bool showHeadingProjects = false;
  bool showDetailsContact = false;
  bool showHeadingContact = false;

  getAboutVisibility(double visibility) {
    if (visibility >= 0.15) {
      showHeadingAbout = true;
    }
    if (visibility >= 0.4) {
      showDetailsAbout = true;
    }
    notifyListeners();
  }

  getTechVisibility(double visibility) {
    if (visibility >= 0.15) {
      showHeadingTech = true;
    }
    if (visibility >= 0.4) {
      showDetailsTech = true;
    }
    notifyListeners();
  }

  getProjectsVisibility(double visibility) {
    if (visibility >= 0.15) {
      showHeadingProjects = true;
    }
    if (visibility >= 0.2) {
      showDetailsProjects = true;
    }
    notifyListeners();
  }

  getContactVisibility(double visibility) {
    if (visibility >= 0.05) {
      showHeadingContact = true;
    }
    if (visibility >= 0.4) {
      showDetailsContact = true;
    }
    notifyListeners();
  }
}
