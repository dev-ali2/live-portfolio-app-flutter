import 'package:flutter/material.dart';
import 'package:portfolio_site/provider/theme_provider.dart';

import 'package:portfolio_site/utils/spacing.dart';
import 'package:portfolio_site/utils/typography.dart';
import 'package:provider/provider.dart';

class NavbarLogo extends StatefulWidget {
  final bool isMobile;
  NavbarLogo({required this.isMobile});

  @override
  State<NavbarLogo> createState() => _NavbarLogoState();
}

class _NavbarLogoState extends State<NavbarLogo> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final size = Spacing(context).getSize();
    return GestureDetector(
      onTap: () => themeProvider.setTheme(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Row(children: [
            Text(
              '< ',
              style: TextStyle(
                  fontSize: !widget.isMobile
                      ? AppTypography.logoArrowsSize
                      : AppTypography.logoArrowsSize * 0.6),
            ),
            Text(
              'Ali Raza',
              style: TextStyle(
                  fontFamily: 'Agustina',
                  fontSize: !widget.isMobile
                      ? AppTypography.logoSize
                      : AppTypography.logoSize * 0.6,
                  color: Theme.of(context).colorScheme.primary),
            ),
            Text(
              ' />',
              style: TextStyle(
                  fontSize: !widget.isMobile
                      ? AppTypography.logoArrowsSize
                      : AppTypography.logoArrowsSize * 0.6),
            )
          ]),
        ),
      ),
    );
  }
}
