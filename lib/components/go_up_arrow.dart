import 'package:flutter/material.dart';
import 'package:portfolio_site/utils/section_keys.dart';

class GoUpArrow extends StatefulWidget {
  final bool show;
  GoUpArrow({required this.show});

  @override
  State<GoUpArrow> createState() => _GoUpArrowState();
}

class _GoUpArrowState extends State<GoUpArrow> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Scrollable.ensureVisible(SectionKeys.homeKey.currentContext!,
            duration: Duration(seconds: 1));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: widget.show ? size.width * size.height * 0.00005 : 0,
            width: widget.show ? size.width * size.height * 0.00005 : 0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).colorScheme.surface,
                    blurRadius: 7,
                    spreadRadius: 5)
              ],
              borderRadius: widget.show
                  ? BorderRadius.circular(10)
                  : BorderRadius.circular(100),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: widget.show
                ? Icon(
                    Icons.keyboard_arrow_up_sharp,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: size.width * size.height * 0.00004,
                  )
                : null),
      ),
    );
  }
}
