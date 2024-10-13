import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:portfolio_site/animations/custom_fader.dart';

import 'package:portfolio_site/model/assets.dart';

import 'package:portfolio_site/model/social_links.dart';
import 'package:portfolio_site/provider/animation_provider.dart';

import 'package:portfolio_site/utils/section_keys.dart';
import 'package:portfolio_site/utils/typography.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double defaultPadding = size.width * 0.02;
    final double defaultPaddingUp = size.height * 0.03;
    final double defaultMarginDown = size.height * 0.03;
    final animationProvider =
        Provider.of<AnimationProvider>(context, listen: false);

    return VisibilityDetector(
      key: SectionKeys.aboutKey,
      onVisibilityChanged: (info) {
        animationProvider.getAboutVisibility(info.visibleFraction);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: defaultMarginDown),
        width: size.width,
        constraints: BoxConstraints(minHeight: size.height * 0.9),
        child: Wrap(
          children: [
            Center(
              child:
                  Consumer<AnimationProvider>(builder: (context, value, child) {
                if (value.showHeadingAbout) {
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
                              'About Me',
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
              }),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
                  child: Center(
                      child: Stack(children: [
                    Consumer<AnimationProvider>(
                      builder: (context, value, child) {
                        if (value.showDetailsAbout) {
                          return CustomFaderAnim(
                            delay: Duration(milliseconds: 500),
                            duration: Duration(milliseconds: 500),
                            offset: Offset(0, 50),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                  elevation: 15,
                                  borderRadius: BorderRadius.circular(300),
                                  child: Container(
                                    height: ((size.width) + 90) * 0.41,
                                    width: ((size.width) + 90) * 0.41,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.3),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(200),
                                      child: Image.asset(
                                          CustomAssets.aboutPageImage),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                )
                              ],
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CustomFaderAnim(
                        duration: Duration(milliseconds: 500),
                        offset: Offset(0, 0),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 20,
                              sigmaY: 20,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ali Raza',
                                    style: TextStyle(
                                        fontFamily: AppTypography.poppins,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.05),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ])),
                ),
                Container(
                  width: size.width * 0.9,
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Center(
                      child: Container(child: Consumer<AnimationProvider>(
                    builder: (context, value, child) {
                      if (value.showDetailsAbout) {
                        return CustomFaderAnim(
                          offset: Offset(-100, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText(
                                  AppTypography.myAbout,
                                  style: TextStyle(
                                      fontFamily: AppTypography.normalFont,
                                      fontSize:
                                          AppTypography.normalFontSize * 0.7),
                                ),
                                Divider(),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: defaultPaddingUp),
                                  child: Center(
                                    child: TextButton.icon(
                                        onPressed: () {
                                          launchUrl(Uri.parse(
                                              SocialLinks.resumeLink));
                                        },
                                        icon: Icon(
                                          Icons.list_alt_outlined,
                                          size: AppTypography.normalFontSize,
                                        ),
                                        label: Text(
                                          'My Resume',
                                          style: TextStyle(
                                              fontFamily:
                                                  AppTypography.normalFont,
                                              fontSize:
                                                  AppTypography.normalFontSize *
                                                      0.8,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                // SizedBox(
                                //     width: size.width,
                                //     child: Column(
                                //       mainAxisSize: MainAxisSize.min,
                                //       children: [
                                //         Divider(),
                                //         SizedBox(
                                //           height: size.height * 0.01,
                                //         ),
                                //         Wrap(
                                //           direction: Axis.horizontal,
                                //           alignment: WrapAlignment.start,
                                //           children: [
                                //             ...SocialLinks.socialIcons
                                //                 .asMap()
                                //                 .entries
                                //                 .map((e) => SocialButtonTablet(
                                //                     isMobile: true,
                                //                     icon: e.value,
                                //                     index: e.key))
                                //           ],
                                //         ),
                                //       ],
                                //     ))
                              ]),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
