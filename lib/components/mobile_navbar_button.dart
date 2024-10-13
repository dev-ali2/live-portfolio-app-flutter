import 'package:flutter/material.dart';
import 'package:portfolio_site/provider/scroll_provider.dart';
import 'package:portfolio_site/utils/section_keys.dart';

import 'package:provider/provider.dart';

class MobileNavBarButton extends StatefulWidget {
  final String optionName;
  final int index;
  MobileNavBarButton(
      {super.key, required this.optionName, required this.index});

  @override
  State<MobileNavBarButton> createState() => _MobileNavBarButtonState();
}

class _MobileNavBarButtonState extends State<MobileNavBarButton> {
  bool isHovering = false;
  GlobalKey? widgetKey;

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        switch (widget.index) {
          case 0:
            widgetKey = SectionKeys.homeKey;
            break;
          case 1:
            widgetKey = SectionKeys.aboutKey;

            break;
          case 2:
            widgetKey = SectionKeys.techKey;

            break;
          case 3:
            widgetKey = SectionKeys.projectsKey;

            break;
          case 4:
            widgetKey = SectionKeys.contactKey;

            break;
        }

        scrollProvider.scrollToWidget(widget.index, widgetKey!);
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Center(
            child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isHovering = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHovering = false;
            });
          },
          cursor: SystemMouseCursors.click,
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            style: TextStyle(
                // fontSize: isHovering ? 16 : null,
                fontWeight: FontWeight.bold,
                color: isHovering
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface),
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height *
                  MediaQuery.of(context).size.width *
                  0.000025),
              child: Text(
                widget.optionName,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
