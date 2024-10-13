import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:portfolio_site/animations/custom_fader.dart';
import 'package:portfolio_site/model/assets.dart';
import 'package:portfolio_site/provider/scroll_provider.dart';
import 'package:portfolio_site/utils/dimensions.dart';
import 'package:portfolio_site/utils/section_keys.dart';
import 'package:portfolio_site/utils/spacing.dart';
import 'package:portfolio_site/utils/typography.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final Size size = Dimensions().screenSize(context);
    return VisibilityDetector(
      key: Key('a'),
      onVisibilityChanged: (info) {
        scrollProvider.showArrowValue(info.visibleFraction);
      },
      child: Container(
        constraints: BoxConstraints(minHeight: size.height * 1.2),
        key: SectionKeys.homeKey,
        height: Dimensions.height,
        width: double.infinity,
        color: Theme.of(context).canvasColor,
        child: Container(
          margin: EdgeInsets.only(top: Dimensions.height! * 0.05 + 45),
          child: AnimatedBackground(
            vsync: this,
            behaviour: RandomParticleBehaviour(
                options: ParticleOptions(
                    baseColor: Theme.of(context).colorScheme.primary,
                    maxOpacity: 0.7,
                    opacityChangeRate: 1,
                    particleCount: 40,
                    spawnMinSpeed: 15,
                    spawnMaxSpeed: 20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    constraints: BoxConstraints(maxHeight: size.height * 0.4),
                    padding: EdgeInsets.only(
                        left: Spacing.sm20, right: Spacing.sm20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomFaderAnim(
                            delay: Duration(milliseconds: 500),
                            duration: Duration(milliseconds: 500),
                            offset: Offset(0, 0),
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: size.height * 0.02,
                                  top: size.height * 0.03),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        blurRadius: 15,
                                        spreadRadius: 1)
                                  ],
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    size.height * size.width * 0.00002),
                                child: Text(
                                  'Full Stack Flutter Developer',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      fontFamily: AppTypography.poppins,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          CustomFaderAnim(
                            delay: Duration(milliseconds: 500),
                            duration: Duration(milliseconds: 500),
                            offset: Offset(0, 0),
                            child: Container(
                              child: SelectableText(
                                ' Ali Raza',
                                style: TextStyle(
                                    fontFamily: AppTypography.poppins,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        AppTypography.nameSizeTablet * 0.75),
                              ),
                            ),
                          ),
                          CustomFaderAnim(
                            delay: Duration(milliseconds: 500),
                            duration: Duration(milliseconds: 500),
                            offset: Offset(-10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 20,
                                ),
                                AnimatedTextKit(
                                    isRepeatingAnimation: true,
                                    repeatForever: true,
                                    pause: Duration(seconds: 2),
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        ' 1 Year of Flutter experience',
                                        speed: const Duration(milliseconds: 50),
                                        textStyle: TextStyle(
                                            fontFamily:
                                                AppTypography.normalFont,
                                            fontSize: 12),
                                      ),
                                      TyperAnimatedText('Tech Enthusiast',
                                          speed:
                                              const Duration(milliseconds: 70),
                                          textStyle: TextStyle(
                                              fontFamily:
                                                  AppTypography.normalFont,
                                              fontSize: 12)),
                                      TyperAnimatedText('Debugger',
                                          speed:
                                              const Duration(milliseconds: 100),
                                          textStyle: TextStyle(
                                              fontFamily:
                                                  AppTypography.normalFont,
                                              fontSize: 12)),
                                    ]),
                                Text(
                                  '|',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: AppTypography.poppins,
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            ),
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Scrollable.ensureVisible(
                                    SectionKeys.contactKey.currentContext!,
                                    duration: Duration(seconds: 3));
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(top: size.height * 0.025),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Text(
                                    'Lets Chat!',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontFamily: AppTypography.poppins,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            AppTypography.nameSizeDesktop *
                                                0.25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Stack(alignment: Alignment.center, children: [
                      CustomFaderAnim(
                        delay: Duration(milliseconds: 200),
                        duration: Duration(milliseconds: 1000),
                        offset: Offset(0, 100),
                        child: SizedBox(
                          child: Stack(children: [
                            Image.asset(
                              CustomAssets.homePageImage,
                            ),
                          ]),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: size.height * 0.02,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(1),
                                    blurRadius: 20,
                                    spreadRadius: 1)
                              ],
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
