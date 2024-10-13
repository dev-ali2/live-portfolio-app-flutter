import 'package:flutter/material.dart';
import 'package:portfolio_site/model/social_links.dart';
import 'package:portfolio_site/utils/typography.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactContainer extends StatefulWidget {
  final bool isTab;
  final bool isMobile;
  final String text;
  final IconData leadingIcon;
  final IconData trailingIcon;
  const ContactContainer(
      {super.key,
      required this.leadingIcon,
      required this.text,
      required this.trailingIcon,
      required this.isTab,
      required this.isMobile});

  @override
  State<ContactContainer> createState() => _ContactContainerState();
}

class _ContactContainerState extends State<ContactContainer> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        if (widget.text.contains('Mail')) {
          launchUrl(SocialLinks.email);
        }
        if (widget.text.contains('Whatsapp')) {
          launchUrl(Uri.parse(SocialLinks.whatsappLink));
        }
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
          width: widget.isTab
              ? size.width * 0.5
              : widget.isMobile
                  ? size.width * 0.8
                  : size.width * 0.35,
          height: size.height * 0.05 + 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: isHovering
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    blurRadius: isHovering ? 10 : 0,
                    spreadRadius: isHovering ? 10 : 0)
              ],
              color: Theme.of(context).colorScheme.surface),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.leadingIcon,
                      color: Theme.of(context).colorScheme.primary,
                      size: widget.isTab
                          ? 35
                          : widget.isMobile
                              ? 27
                              : size.width * 0.03,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.text,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: AppTypography.normalFont,
                          fontSize: widget.isMobile
                              ? AppTypography.normalFontSizeTablet
                              : AppTypography.normalFontSizeTablet * 1.1),
                    ),
                  ],
                ),
                Icon(
                  widget.trailingIcon,
                  color: Theme.of(context).colorScheme.primary,
                  size: widget.isTab
                      ? 20
                      : widget.isMobile
                          ? 19
                          : size.width * 0.02,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
