import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:portfolio_site/animations/custom_fader.dart';
import 'package:portfolio_site/components/project_card.dart';
import 'package:portfolio_site/model/projects.dart';
import 'package:portfolio_site/model/social_links.dart';
import 'package:portfolio_site/provider/animation_provider.dart';

import 'package:portfolio_site/utils/section_keys.dart';
import 'package:portfolio_site/utils/typography.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectsDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double defaultPadding = size.width * 0.02;
    final double defaultPaddingUp = size.height * 0.03;

    final animationProvider =
        Provider.of<AnimationProvider>(context, listen: false);
    return VisibilityDetector(
      key: SectionKeys.projectsKey,
      onVisibilityChanged: (info) {
        animationProvider.getProjectsVisibility(info.visibleFraction);
      },
      child: Container(
          width: size.width,
          constraints: BoxConstraints(
              minHeight:
                  !animationProvider.showHeadingProjects ? size.height : 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<AnimationProvider>(
                builder: (context, value, child) {
                  if (value.showHeadingProjects) {
                    return CustomFaderAnim(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: defaultPaddingUp,
                          bottom: defaultPadding * 3,
                        ),
                        decoration: BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Recent Work',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: AppTypography.headings,
                                        fontSize:
                                            AppTypography.desktopHeadingSize),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: defaultPadding * 2),
                    width: size.width * 0.8,
                    child: Consumer<AnimationProvider>(
                      builder: (context, value, child) {
                        if (value.showDetailsProjects) {
                          return CustomFaderAnim(
                            delay: Duration(milliseconds: 200),
                            offset: Offset(0, 0),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              runSpacing: (size.height * size.width * 0.00002),
                              direction: Axis.horizontal,
                              children: [
                                ...MyProjects.projects
                                    .asMap()
                                    .entries
                                    .map((e) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.01,
                                              vertical: 13),
                                          child: ProjectCard(
                                              isPhone: false,
                                              isTab: false,
                                              index: e.key,
                                              projectBanner: e.value['banner'],
                                              type: e.value['type']),
                                        )),
                              ],
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                  Consumer<AnimationProvider>(
                    builder: (context, value, child) {
                      if (value.showDetailsProjects) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.05,
                              bottom: size.height * 0.05),
                          child: TextButton(
                              onPressed: () {
                                launchUrl(
                                    Uri.parse(SocialLinks.socialLinks[0]));
                              },
                              child: Text(
                                'See more',
                                style: TextStyle(
                                    fontFamily: AppTypography.poppins,
                                    fontSize: AppTypography.normalFontSize * 1,
                                    fontWeight: FontWeight.bold),
                              )),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  )
                ],
              )
            ],
          )),
    );
  }
}
