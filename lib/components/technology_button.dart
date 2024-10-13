import 'package:flutter/material.dart';

import 'package:portfolio_site/utils/typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TechnologyButton extends StatefulWidget {
  final bool isMobile;
  final String text;
  final String icon;
  final int index;

  TechnologyButton(
      {required this.text,
      required this.index,
      required this.icon,
      required this.isMobile});

  @override
  State<TechnologyButton> createState() => _TechnologyButtonState();
}

class _TechnologyButtonState extends State<TechnologyButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 10,
      color: Theme.of(context).colorScheme.primary,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: MouseRegion(
        onEnter: (event) {
          if (mounted) {
            setState(() {
              isHovering = true;
            });
          }
        },
        onExit: (event) {
          if (mounted) {
            setState(() {
              isHovering = false;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: !isHovering
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!widget.isMobile)
                SvgPicture.asset(
                  widget.icon,
                  height: size.width * 0.021,
                  width: size.width * 0.021,
                  color: Theme.of(context).colorScheme.surface,
                ),
              SizedBox(
                width: size.width * 0.005,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontFamily: AppTypography.poppins),
              )
            ],
          ),
        ),
      ),
    );
  }
}
