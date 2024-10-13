import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_site/utils/typography.dart';

import 'package:url_launcher/url_launcher.dart';

class AvailableOn extends StatefulWidget {
  final bool isMobile;
  final String text;
  final IconData icon;
  final int index;
  final String link;

  const AvailableOn(
      {required this.text,
      required this.index,
      required this.icon,
      required this.isMobile,
      required this.link});

  @override
  State<AvailableOn> createState() => _AvailableOnState();
}

class _AvailableOnState extends State<AvailableOn> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (mounted) {
        setState(() {
          isHovering = !isHovering;
        });
      }
    });
  }

  bool isHovering = false;
  bool isMouseHovering = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(widget.link));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Card(
          elevation: 10,
          color: Theme.of(context).colorScheme.primary,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: mounted
              ? AnimatedContainer(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  duration: const Duration(milliseconds: 1000),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).colorScheme.primary,
                            blurRadius: isHovering ? 20 : 0,
                            offset: const Offset(0, 3),
                            spreadRadius: 0)
                      ],
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        widget.icon,
                      ),
                      Text(
                        widget.text,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontFamily: AppTypography.poppins),
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
