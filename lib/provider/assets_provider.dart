// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_site/model/assets.dart';

class AssetProvider with ChangeNotifier {
  Future<bool> loadAssets() async {
    await mainAssets();

    otherAssets();

    return true;
  }

  static Future<void> mainAssets() async {
    final ByteData aboutPageImage =
        await rootBundle.load(CustomAssets.aboutPageImage);
    final ByteData homePageImage =
        await rootBundle.load(CustomAssets.homePageImage);
  }

  static Future<void> otherAssets() async {
    final ByteData techSectionImage =
        await rootBundle.load(CustomAssets.techSectionImage);
    //Project banners
    final ByteData azaadiVpn =
        await rootBundle.load('assets/images/portfolio/azaadivpn.png');
    final ByteData convoConnect =
        await rootBundle.load('assets/images/portfolio/convoconnect2.png');
    final ByteData portfoliosite =
        await rootBundle.load('assets/images/portfolio/portfoliosite.png');
    final ByteData fitflick =
        await rootBundle.load('assets/images/portfolio/fitflick.png');
    final ByteData ecommerece =
        await rootBundle.load('assets/images/portfolio/ecommerce.png');
    final ByteData musicplayer =
        await rootBundle.load('assets/images/portfolio/musicplayer.png');

    //Project SVGs
    final ByteData m1 =
        await rootBundle.load('assets/svgs/flutter-svgrepo-com.svg');
    final ByteData m2 =
        await rootBundle.load('assets/svgs/dart-svgrepo-com.svg');
    final ByteData w1 =
        await rootBundle.load('assets/svgs/html-124-svgrepo-com.svg');
    final ByteData w2 =
        await rootBundle.load('assets/svgs/css3-02-svgrepo-com.svg');
    final ByteData w3 =
        await rootBundle.load('assets/svgs/bootstrap-svgrepo-com.svg');
    final ByteData w4 =
        await rootBundle.load('assets/svgs/javascript-16-svgrepo-com.svg');
    final ByteData w5 =
        await rootBundle.load('assets/svgs/wordpress-svgrepo-com.svg');
    final ByteData s1 =
        await rootBundle.load('assets/svgs/api-svgrepo-com.svg');
    final ByteData s2 = await rootBundle.load('assets/svgs/node.svg');
    final ByteData d1 =
        await rootBundle.load('assets/svgs/firebase-svgrepo-com.svg');
    final ByteData d2 =
        await rootBundle.load('assets/svgs/mongodb-svgrepo-com.svg');
    final ByteData d3 =
        await rootBundle.load('assets/svgs/database-svgrepo-com.svg');
    final ByteData v1 =
        await rootBundle.load('assets/svgs/github-svgrepo-com.svg');
    final ByteData v2 =
        await rootBundle.load('assets/svgs/notion-svgrepo-com.svg');
    final ByteData p1 =
        await rootBundle.load('assets/svgs/docker-svgrepo-com.svg');
    final ByteData u1 =
        await rootBundle.load('assets/svgs/figma-svgrepo-com.svg');
    final ByteData o1 =
        await rootBundle.load('assets/svgs/python-16-svgrepo-com.svg');
  }
}
