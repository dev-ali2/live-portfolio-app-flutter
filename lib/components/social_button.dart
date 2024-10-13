import 'package:flutter/material.dart';
import 'package:portfolio_site/model/social_links.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatefulWidget {
  final IconData icon;
  final int index;
  const SocialButton({required this.icon, required this.index});

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
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
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: size.width * 0.04,
            width: size.width * 0.04,
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
            )),
      ),
    );
  }
}
