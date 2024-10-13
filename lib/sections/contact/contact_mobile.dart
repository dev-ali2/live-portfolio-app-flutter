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

class ContactMobile extends StatelessWidget {
  const ContactMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double defaultPadding = size.width * 0.02;
    final double defaultPaddingUp = size.height * 0.03;
    final double defaultMarginDown = size.height * 0.03;
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
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Contact',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppTypography.headings,
                                      fontSize:
                                          AppTypography.tabletHeadingSize *
                                              0.7),
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
              ],
            ),
            Consumer<AnimationProvider>(
              builder: (context, value, child) {
                if (value.showHeadingContact) {
                  return CustomFaderAnim(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: defaultMarginDown, top: defaultMarginDown),
                      child: Text(
                        'Let\'s build something together :)',
                        style: TextStyle(
                            fontFamily: AppTypography.normalFont,
                            fontSize: AppTypography.normalFontSize * 0.7),
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<AnimationProvider>(
                      builder: (context, value, child) {
                        if (value.showDetailsContact) {
                          return CustomFaderAnim(
                            delay: Duration(milliseconds: 500),
                            duration: Duration(milliseconds: 500),
                            offset: Offset(-50, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                ContactContainer(
                                  isMobile: true,
                                  leadingIcon: Icons.mail,
                                  text: 'Mail',
                                  isTab: false,
                                  trailingIcon: Icons.arrow_forward_ios_rounded,
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                ContactContainer(
                                  isMobile: true,
                                  isTab: false,
                                  leadingIcon: SimpleIcons.whatsapp,
                                  text: 'Whatsapp',
                                  trailingIcon: Icons.arrow_forward_ios_rounded,
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                              ],
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    Container(
                      width: size.width * 0.85,
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: Consumer<AnimationProvider>(
                        builder: (context, value, child) {
                          if (value.showDetailsContact) {
                            return CustomFaderAnim(
                              offset: Offset(50, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Text('Or find me here 😃',
                                            style: TextStyle(
                                                fontSize: AppTypography
                                                        .tabletHeadingSize *
                                                    0.7,
                                                fontFamily:
                                                    AppTypography.poppins,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.horizontal,
                                        children: [
                                          ...SocialLinks.socialLinksShorts
                                              .asMap()
                                              .entries
                                              .map((e) =>
                                                  ContactSocialContainer(
                                                      isMobile: true,
                                                      isTab: false,
                                                      text: e.value,
                                                      index: e.key,
                                                      leadingIcon: SocialLinks
                                                          .socialIcons[e.key])),
                                        ],
                                      )
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
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
