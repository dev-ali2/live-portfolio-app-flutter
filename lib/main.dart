import 'package:flutter/material.dart';
import 'package:portfolio_site/entery/splash_screen.dart';
import 'package:portfolio_site/provider/animation_provider.dart';
import 'package:portfolio_site/provider/assets_provider.dart';
import 'package:portfolio_site/provider/scroll_provider.dart';
import 'package:portfolio_site/provider/theme_provider.dart';
import 'package:portfolio_site/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
        ChangeNotifierProvider(create: (_) => AnimationProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AssetProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Ali Raza',
              theme: MyThemeData.myLightTheme,
              darkTheme: MyThemeData.myDarkTheme,
              themeMode: value.themeMode,
              home: const SplashScreen());
        },
      ),
    );
  }
}
