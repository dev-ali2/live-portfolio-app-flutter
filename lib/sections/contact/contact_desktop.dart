import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:portfolio_site/animations/custom_fader.dart';
import 'package:portfolio_site/components/contact_container.dart';
import 'package:portfolio_site/components/contact_social_container.dart';
import 'package:portfolio_site/model/social_links.dart';
import 'package:portfolio_site/provider/animation_provider.dart';
import 'package:portfolio_site/utils/section_keys.dart';
import 'package:portfolio_site/utils/typography.dart';
import 'package:provider/provider.dart';

import 'package:simple_icons/simple_icons.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double defaultPadding = size.width * 0.02;
    final double defaultPaddingUp = size.height * 0.03;

    final animationProvider =
        Provider.of<AnimationProvider>(context, listen: false);
    return VisibilityDetector(
      key: SectionKeys.contactKey,
      onVisibilityChanged: (info) {
        animationProvider.getContactVisibility(info.visibleFraction);
      },
      child: Container(
        color: Theme.of(context).canvasColor,
        width: size.width,
        constraints: BoxConstraints(
            minHeight: !animationProvider.showHeadingContact ? size.height : 0),
        child: Column(
          children: [
            Column(
              children: [
                Consumer<AnimationProvider>(
                  builder: (context, value, child) {
                    if (value.showHeadingContact) {
                      return CustomFaderAnim(
                        duration: Duration(milliseconds: 500),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: defaultPaddingUp,
                            bottom: defaultPadding,
                          ),
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
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
                                      'Contact',
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
              ],
            ),
            Consumer<AnimationProvider>(
              builder: (context, value, child) {
                if (value.showHeadingContact) {
                  return CustomFaderAnim(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      margin: EdgeInsets.only(bottom: defaultPadding * 3),
                      child: Text(
                        'Let\'s build something together :)',
                        style: TextStyle(
                            fontFamily: AppTypography.normalFont,
                            fontSize: AppTypography.normalFontSize * 0.9),
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
            Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                spacing: size.width * 0.03,
                children: [
                  Consumer<AnimationProvider>(
                    builder: (context, value, child) {
                      if (value.showDetailsContact) {
                        return CustomFaderAnim(
                          delay: Duration(milliseconds: 500),
                          duration: Duration(milliseconds: 500),
                          offset: Offset(-50, 0),
                          child: Container(
                            width: size.width * 0.45,
                            height: size.height * 0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ContactContainer(
                                  isMobile: false,
                                  leadingIcon: Icons.mail,
                                  isTab: false,
                                  text: 'Connect via Mail',
                                  trailingIcon: Icons.arrow_forward_ios_rounded,
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                ContactContainer(
                                  isMobile: false,
                                  isTab: false,
                                  leadingIcon: SimpleIcons.whatsapp,
                                  text: 'Connect via Whatsapp',
                                  trailingIcon: Icons.arrow_forward_ios_rounded,
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                  Container(
                    width: size.width * 0.45,
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: Consumer<AnimationProvider>(
                      builder: (context, value, child) {
                        if (value.showDetailsContact) {
                          return CustomFaderAnim(
                            offset: Offset(50, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      colors: [
                                        Theme.of(context).colorScheme.primary,
                                        Theme.of(context).colorScheme.secondary,
                                        Theme.of(context).colorScheme.tertiary
                                      ]),
                                  borderRadius: BorderRadius.circular(30)),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(30),
                                      child: Center(
                                          child: Text('Or find me here 😃',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary,
                                                  fontSize: AppTypography
                                                          .normalFontSize *
                                                      1.1,
                                                  fontFamily:
                                                      AppTypography.poppins,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                    ...SocialLinks.socialLinksShorts
                                        .asMap()
                                        .entries
                                        .map((e) => ContactSocialContainer(
                                            isTab: false,
                                            isMobile: false,
                                            text: e.value,
                                            index: e.key,
                                            leadingIcon: SocialLinks
                                                .socialIcons[e.key])),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
