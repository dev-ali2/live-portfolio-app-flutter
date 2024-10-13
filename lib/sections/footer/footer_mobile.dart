import 'package:flutter/material.dart';
import 'package:portfolio_site/utils/typography.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Made with ',
            style: TextStyle(
                fontSize: AppTypography.normalFontSize * 0.7,
                fontFamily: AppTypography.normalFont),
          ),
          Text(
            '❤️',
            style: TextStyle(
                fontSize: AppTypography.normalFontSize * 0.7,
                fontFamily: AppTypography.normalFont),
          ),
          Text(
            ' in ',
            style: TextStyle(
                fontSize: AppTypography.normalFontSize * 0.7,
                fontFamily: AppTypography.normalFont),
          ),
          Text(
            'Flutter',
            style: TextStyle(
                fontSize: AppTypography.normalFontSize * 0.7,
                color: Theme.of(context).colorScheme.primary,
                fontFamily: AppTypography.normalFont),
          ),
        ],
      ),
    );
  }
}
