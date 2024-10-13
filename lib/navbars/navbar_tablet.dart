import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:portfolio_site/animations/custom_fader.dart';
import 'package:portfolio_site/components/navbar_button.dart';
import 'package:portfolio_site/components/navbar_logo.dart';
import 'package:portfolio_site/model/navbar_options.dart';

class NavbarTablet extends StatelessWidget {
  final bool show;
  final options = NavbarOptions();
  NavbarTablet({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: CustomFaderAnim(
        delay: Duration(seconds: 1),
        duration: Duration(milliseconds: 1000),
        offset: Offset(0, -50),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: show ? size.height * 0.04 + 40 : 0,
            width: show ? size.width : 0,
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),

            // decoration: BoxDecoration(border: Border.all()),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(0.3),
                  child: !show
                      ? SizedBox.shrink()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NavbarLogo(
                              isMobile: false,
                            ),
                            SizedBox(
                              width: size.width * 0.1,
                            ),
                            ...options.options
                                .asMap()
                                .entries
                                .map((e) => NavbarButton(
                                      optionName: e.value,
                                      index: e.key,
                                    ))
                          ],
                        ),
                ),
              ),
            )),
      ),
    );
  }
}
