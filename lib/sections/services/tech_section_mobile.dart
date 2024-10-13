import 'package:flutter/material.dart';

import 'package:portfolio_site/animations/custom_fader.dart';
import 'package:portfolio_site/components/skill_row.dart';

import 'package:portfolio_site/model/skills_info.dart';
import 'package:portfolio_site/provider/animation_provider.dart';

import 'package:portfolio_site/utils/section_keys.dart';
import 'package:portfolio_site/utils/typography.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TechSectionMobile extends StatelessWidget {
  const TechSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double defaultPadding = size.width * 0.02;
    final double defaultPaddingUp = size.height * 0.03;
    final double defaultMarginDown = size.height * 0.03;
    final animationProvider =
        Provider.of<AnimationProvider>(context, listen: false);
    return VisibilityDetector(
      key: SectionKeys.techKey,
      onVisibilityChanged: (info) {
        animationProvider.getTechVisibility(info.visibleFraction);
      },
      child: Container(
        constraints: BoxConstraints(minHeight: size.height),
        margin: EdgeInsets.only(bottom: defaultMarginDown),
        width: size.width,
        color: Theme.of(context).canvasColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<AnimationProvider>(
                builder: (context, value, child) {
                  if (value.showHeadingTech) {
                    return CustomFaderAnim(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: defaultPaddingUp,
                          bottom: defaultPadding,
                        ),
                        decoration: BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Tech Stack',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTypography.headings,
                                    fontSize:
                                        AppTypography.tabletHeadingSize * 0.7),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              Container(
                width: size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Consumer<AnimationProvider>(
                  builder: (context, value, child) {
                    if (value.showDetailsTech) {
                      return CustomFaderAnim(
                        offset: const Offset(-50, 0),
                        duration: const Duration(milliseconds: 300),
                        delay: const Duration(milliseconds: 500),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SkillRow(
                                isMobile: true,
                                defaultPadding: defaultPadding,
                                skillIonList: SkillsInfo.webSkillsIcons,
                                skillList: SkillsInfo.webSkillsNames,
                                category: 'Web Development'),
                            SkillRow(
                                isMobile: true,
                                defaultPadding: defaultPadding,
                                skillIonList: SkillsInfo.mobileSkillsIcons,
                                skillList: SkillsInfo.mobileSkillsNames,
                                category: 'Mobile Development'),
                            SkillRow(
                                isMobile: true,
                                defaultPadding: defaultPadding,
                                skillIonList: SkillsInfo.serverSkillsIcons,
                                skillList: SkillsInfo.serverSkillsNames,
                                category: 'Server Side'),
                            SkillRow(
                                isMobile: true,
                                defaultPadding: defaultPadding,
                                skillIonList: SkillsInfo.databaseSkillsIcons,
                                skillList: SkillsInfo.databaseSkillsNames,
                                category: 'Databases'),
                            SkillRow(
                                isMobile: true,
                                defaultPadding: defaultPadding,
                                skillIonList: SkillsInfo.platformSkillsIcons,
                                skillList: SkillsInfo.platformSkillsName,
                                category: 'Platform as Service (PaaS)'),
                            SkillRow(
                                isMobile: true,
                                defaultPadding: defaultPadding,
                                skillIonList: SkillsInfo.versionSkillsIcons,
                                skillList: SkillsInfo.versionSkillsNames,
                                category: 'Version Control and Management'),
                            SkillRow(
                                isMobile: true,
                                defaultPadding: defaultPadding,
                                skillIonList: SkillsInfo.uiSkillsIcons,
                                skillList: SkillsInfo.uiSkillsNames,
                                category: 'UI/UX'),
                            SkillRow(
                                isMobile: true,
                                defaultPadding: defaultPadding,
                                skillIonList: SkillsInfo.otherSkillsIcons,
                                skillList: SkillsInfo.otherSkillsNames,
                                category: 'Extras'),
                          ],
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
