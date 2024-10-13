import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:portfolio_site/animations/custom_fader.dart';
import 'package:portfolio_site/components/social_button.dart';
import 'package:portfolio_site/model/assets.dart';

import 'package:portfolio_site/model/social_links.dart';
import 'package:portfolio_site/provider/animation_provider.dart';

import 'package:portfolio_site/utils/section_keys.dart';
import 'package:portfolio_site/utils/typography.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

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
        constraints: BoxConstraints(
            minHeight: !animationProvider.showHeadingAbout ? size.height : 0),
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
                                  'About Me',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                return SizedBox(
                  height: size.height * 0.5,
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                    child: Stack(children: [
                  Consumer<AnimationProvider>(
                    builder: (context, value, child) {
                      if (value.showDetailsAbout) {
                        return CustomFaderAnim(
                          delay: const Duration(milliseconds: 500),
                          duration: const Duration(milliseconds: 500),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                elevation: 15,
                                borderRadius: BorderRadius.circular(200),
                                child: Container(
                                  height: ((size.width) + 100) * 0.28,
                                  width: ((size.width) + 100) * 0.28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.3),
                                    // border: Border.all(
                                    //     color:
                                    //         Theme.of(context).colorScheme.primary)
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
                      return SizedBox(
                        height: size.height * 0.5,
                      );
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
                                // color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Ali Raza',
                                  style: TextStyle(
                                      fontFamily: AppTypography.poppins,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.031),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ])),
                Container(
                  width: size.width * 0.58,
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
                                      fontSize: AppTypography.normalFontSize),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: defaultPaddingUp),
                                  child: TextButton.icon(
                                      onPressed: () {
                                        launchUrl(
                                            Uri.parse(SocialLinks.resumeLink));
                                      },
                                      icon: Icon(Icons.list_alt_outlined),
                                      label: Text(
                                        'My Resume',
                                        style: TextStyle(
                                            fontFamily:
                                                AppTypography.normalFont,
                                            fontSize:
                                                AppTypography.normalFontSize,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                      width: size.width * 0.4,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Divider(),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Wrap(
                                            direction: Axis.horizontal,
                                            alignment: WrapAlignment.end,
                                            children: [
                                              ...SocialLinks.socialIcons
                                                  .asMap()
                                                  .entries
                                                  .map((e) => SocialButton(
                                                      icon: e.value,
                                                      index: e.key))
                                            ],
                                          ),
                                        ],
                                      )),
                                )
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
