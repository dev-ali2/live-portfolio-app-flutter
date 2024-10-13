

import 'package:flutter/material.dart';
import 'package:portfolio_site/provider/scroll_provider.dart';
import 'package:portfolio_site/utils/section_keys.dart';

import 'package:provider/provider.dart';

class NavbarButton extends StatefulWidget {
  final String optionName;
  final int index;
  NavbarButton({super.key, required this.optionName, required this.index});

  @override
  State<NavbarButton> createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton> {
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

        // final RenderBox renderBox =
        //     widgetKey!.currentContext!.findRenderObject() as RenderBox;
        // final offset = renderBox.localToGlobal(Offset.zero).dy;
        // log('new widget offset $offset');
        // scrollProvider.scrollTo(offset);
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
            child: Text(
              widget.optionName,
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        )),
      ),
    );
  }
}
