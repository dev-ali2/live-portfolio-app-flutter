import 'package:flutter/material.dart';
import 'package:portfolio_site/model/social_links.dart';
import 'package:portfolio_site/utils/typography.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSocialContainer extends StatefulWidget {
  final bool isMobile;
  final bool isTab;
  final String text;
  final IconData leadingIcon;
  final int index;
  const ContactSocialContainer(
      {super.key,
      required this.text,
      required this.leadingIcon,
      required this.index,
      required this.isTab,
      required this.isMobile});

  @override
  State<ContactSocialContainer> createState() => _ContactSocialContainerState();
}

class _ContactSocialContainerState extends State<ContactSocialContainer> {
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
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.01),
          height: size.height * 0.01 + 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: isHovering
                  ? widget.isMobile
                      ? Border.all(
                          color: Theme.of(context).colorScheme.onSurface)
                      : Border.all(
                          color: Theme.of(context).colorScheme.onPrimary)
                  : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: widget.isTab ? size.width * 0.02 : size.width * 0.01,
              ),
              Icon(
                widget.leadingIcon,
                color: widget.isMobile
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(context).colorScheme.onPrimary,
                size: widget.isTab
                    ? 30
                    : widget.isMobile
                        ? 25
                        : size.width * 0.03,
              ),
              if (!widget.isMobile)
                SizedBox(
                  width: widget.isTab
                      ? size.width * 0.02
                      : widget.isMobile
                          ? size.width * 0.05
                          : size.width * 0.01,
                ),
              if (!widget.isMobile)
                Text(
                  widget.text,
                  style: TextStyle(
                      color: widget.isMobile
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.onPrimary,
                      fontFamily: AppTypography.normalFont,
                      fontSize: widget.isMobile
                          ? AppTypography.normalFontSize * 0.9
                          : AppTypography.normalFontSize * 1.1),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
