import 'package:flutter/material.dart';
import 'package:portfolio_site/model/social_links.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButtonTablet extends StatefulWidget {
  final bool isMobile;
  final IconData icon;
  final int index;
  const SocialButtonTablet(
      {required this.icon, required this.index, required this.isMobile});

  @override
  State<SocialButtonTablet> createState() => _SocialButtonTabletState();
}

class _SocialButtonTabletState extends State<SocialButtonTablet> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(SocialLinks.socialLinks[widget.index]));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
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
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: widget.isMobile ? size.width * 0.09 : size.width * 0.07,
            width: widget.isMobile ? size.width * 0.09 : size.width * 0.07,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                border: !isHovering
                    ? Border.all(color: Theme.of(context).colorScheme.primary)
                    : null,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                      color: isHovering
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      blurRadius: isHovering ? 20 : 0,
                      spreadRadius: isHovering ? 2 : 0)
                ]),
            child: Icon(
              widget.icon,
              color: Theme.of(context).colorScheme.surface,
              size: widget.isMobile ? 16 : null,
            )),
      ),
    );
  }
}
