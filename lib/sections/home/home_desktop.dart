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

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final Size size = Dimensions().screenSize(context);
    return VisibilityDetector(
      key: Key('a'),
      onVisibilityChanged: (info) {
        scrollProvider.showArrowValue(info.visibleFraction);
      },
      child: Wrap(children: [
        Container(
          key: SectionKeys.homeKey,
          height: Dimensions.height,
          width: double.infinity,
          color: Theme.of(context).canvasColor,
          child: Container(
            margin: EdgeInsets.only(top: Dimensions.height! * 0.05 + 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.45,
                  padding: EdgeInsets.only(left: Spacing.sm40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFaderAnim(
                        delay: Duration(milliseconds: 500),
                        duration: Duration(milliseconds: 500),
                        offset: Offset(0, 0),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 35,
                          width: 250,
                          margin: EdgeInsets.only(bottom: Spacing.sm30),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    blurRadius: 15,
                                    spreadRadius: 1)
                              ],
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            'Full Stack Flutter Developer',
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontFamily: AppTypography.poppins,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                      CustomFaderAnim(
                        delay: Duration(milliseconds: 500),
                        duration: Duration(milliseconds: 500),
                        offset: Offset(0, 0),
                        child: Container(
                          margin: EdgeInsets.only(bottom: Spacing.sm30),
                          child: SelectableText(
                            'Ali Raza',
                            style: TextStyle(
                                fontFamily: AppTypography.poppins,
                                fontWeight: FontWeight.bold,
                                // color: Theme.of(context).colorScheme.primary,
                                fontSize: AppTypography.nameSizeDesktop),
                          ),
                        ),
                      ),
                      CustomFaderAnim(
                        delay: Duration(milliseconds: 500),
                        duration: Duration(milliseconds: 500),
                        offset: Offset(-10, 0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Theme.of(context).colorScheme.primary,
                              size: 35,
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
                                        fontFamily: AppTypography.normalFont,
                                        fontSize: 18),
                                  ),
                                  TyperAnimatedText('Tech Enthusiast',
                                      speed: const Duration(milliseconds: 70),
                                      textStyle: TextStyle(
                                          fontFamily: AppTypography.normalFont,
                                          fontSize: 18)),
                                  TyperAnimatedText('Debugger',
                                      speed: const Duration(milliseconds: 100),
                                      textStyle: TextStyle(
                                          fontFamily: AppTypography.normalFont,
                                          fontSize: 18)),
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
                            margin: EdgeInsets.only(
                                top: size.height * 0.09,
                                left: size.width * 0.02),
                            child: Text(
                              'Lets Chat!',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontFamily: AppTypography.poppins,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      AppTypography.nameSizeDesktop * 0.25),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.52,
                  height: Dimensions.height,
                  // decoration: BoxDecoration(border: Border.all()),
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
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: SizedBox(
                              height: size.height * 0.8,
                              child: CustomFaderAnim(
                                delay: Duration(milliseconds: 200),
                                duration: Duration(milliseconds: 1000),
                                offset: Offset(0, 100),
                                child: Image.asset(
                                  CustomAssets.homePageImage,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
