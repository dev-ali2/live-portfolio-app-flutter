import 'package:flutter/material.dart';
import 'package:portfolio_site/entery/main_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:portfolio_site/provider/assets_provider.dart';
import 'package:portfolio_site/utils/typography.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
    c.stop();
    c.dispose();
  }

  late Animation<double> fadeAnim;
  late AnimationController c;
  @override
  void initState() {
    super.initState();
    c = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    fadeAnim = Tween<double>(begin: 0, end: 1).animate(c);
    c.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future:
              Provider.of<AssetProvider>(context, listen: false).loadAssets(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Future.delayed(Duration(milliseconds: 1000)).then((value) {
                c.reverse().then((value) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => MainPage()),
                      (route) => false);
                });
              });
            }
            return FadeTransition(
              opacity: fadeAnim,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Greetings!',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppTypography.poppins,
                        fontSize: 25),
                  ),
                ),
                // LoadingAnimationWidget.dotsTriangle(
                //     color: Theme.of(context).colorScheme.primary, size: 50),
              ),
            );
          },
        ));
  }
}
