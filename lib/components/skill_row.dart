import 'package:flutter/cupertino.dart';
import 'package:portfolio_site/components/technology_button.dart';

import 'package:portfolio_site/utils/typography.dart';

class SkillRow extends StatelessWidget {
  final bool isMobile;
  final double defaultPadding;
  final List skillList;
  final List skillIonList;
  final String category;
  SkillRow(
      {required this.defaultPadding,
      required this.skillIonList,
      required this.skillList,
      required this.category,
      required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
              vertical: defaultPadding * 0.3,
            ),
            child: Text(
              category,
              style: TextStyle(
                  fontFamily: AppTypography.normalFont,
                  color: AppTypography.skillsOptionColor),
            )),
        Wrap(
          direction: Axis.horizontal,
          children: [
            ...skillList.asMap().entries.map((e) => TechnologyButton(
                  isMobile: isMobile,
                  text: e.value,
                  index: e.key,
                  icon: skillIonList[e.key],
                ))
          ],
        ),
      ],
    );
  }
}
