import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:portfolio_site/animations/custom_fader.dart';
import 'package:portfolio_site/components/mobile_navbar_button.dart';

import 'package:portfolio_site/components/navbar_logo.dart';
import 'package:portfolio_site/model/navbar_options.dart';

// ignore: must_be_immutable
class NavbarMobile extends StatefulWidget {
  final bool show;
  bool openMenu;

  NavbarMobile({super.key, required this.show, this.openMenu = false});

  @override
  State<NavbarMobile> createState() => _NavbarMobileState();
}

class _NavbarMobileState extends State<NavbarMobile> {
  final options = NavbarOptions();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: CustomFaderAnim(
        delay: const Duration(seconds: 1),
        duration: const Duration(milliseconds: 1000),
        offset: const Offset(0, -50),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: widget.show ? size.width : 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(0.3),
                  padding: widget.show
                      ? EdgeInsets.all(size.height * size.width * 0.000015)
                      : null,
                  child: !widget.show
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05,
                              vertical: size.height * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          widget.openMenu = !widget.openMenu;
                                        });
                                      },
                                      child: Icon(
                                        Icons.menu,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )),
                                  NavbarLogo(
                                    isMobile: true,
                                  ),
                                ],
                              ),
                              if (widget.openMenu)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ...options.options
                                        .asMap()
                                        .entries
                                        .map((e) => MobileNavBarButton(
                                              optionName: e.value,
                                              index: e.key,
                                            ))
                                  ],
                                )
                            ],
                          ),
                        ),
                ),
              ),
            )),
      ),
    );
  }
}
