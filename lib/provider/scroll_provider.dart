import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ScrollProvider extends ChangeNotifier {
  bool showArrow = false;
  bool showNavbar = true;
  final _scrollController = ScrollController();
  ScrollController get controller => _scrollController;

  showArrowValue(double visibility) {
    if (visibility < 0.1) {
      // log('new3 got in showing');
      showArrow = true;
      log('new3 got in showing with value ${showArrow}');
      notifyListeners();
    }
    if (visibility >= 0.1) {
      // log('new3 got in not showing with value ${showArrow}');
      showArrow = false;
      notifyListeners();
    }
    notifyListeners();
  }

  ScrollProvider() {
    controller.addListener(_scrollListener);
  }
  void setNavBarVisibility(bool value) {
    showNavbar = value;
    notifyListeners();
  }

  void _scrollListener() {
    if (controller.position.userScrollDirection == ScrollDirection.reverse) {
      if (showNavbar) {
        showNavbar = false;
        notifyListeners();
      }
    } else if (controller.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!showNavbar) {
        showNavbar = true;
        notifyListeners();
      }
    }
  }

  scrollToWidget(int index, GlobalKey key) {
    final context = key.currentContext;

    Scrollable.ensureVisible(context!,
        duration: Duration(milliseconds: 2000), curve: Curves.ease);

    notifyListeners();
  }

  scrollTo(double offset) {
    // double offset = 300;
    controller.animateTo(offset,
        duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }
}
