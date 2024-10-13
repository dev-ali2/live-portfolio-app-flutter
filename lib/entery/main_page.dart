import 'package:flutter/material.dart';

import 'package:portfolio_site/components/go_up_arrow.dart';
import 'package:portfolio_site/navbars/navbar_desktop.dart';
import 'package:portfolio_site/navbars/navbar_mobile.dart';
import 'package:portfolio_site/provider/scroll_provider.dart';
import 'package:portfolio_site/responsive/responsive.dart';
import 'package:portfolio_site/sections/about/about_desktop.dart';
import 'package:portfolio_site/sections/about/about_mobile.dart';
import 'package:portfolio_site/sections/about/about_tablet.dart';
import 'package:portfolio_site/sections/contact/contact_desktop.dart';
import 'package:portfolio_site/sections/contact/contact_mobile.dart';
import 'package:portfolio_site/sections/contact/contact_tablet.dart';
import 'package:portfolio_site/sections/footer/footer_desktop.dart';
import 'package:portfolio_site/sections/footer/footer_mobile.dart';
import 'package:portfolio_site/sections/footer/footer_tablet.dart';
import 'package:portfolio_site/sections/home/home_desktop.dart';
import 'package:portfolio_site/sections/home/home_mobile.dart';
import 'package:portfolio_site/sections/home/home_tablet.dart';
import 'package:portfolio_site/sections/projects/projects_desktop.dart';
import 'package:portfolio_site/sections/projects/projects_mobile.dart';
import 'package:portfolio_site/sections/projects/projects_tablet.dart';
import 'package:portfolio_site/sections/services/tech_section_desktop.dart';
import 'package:portfolio_site/sections/services/tech_section_mobile.dart';
import 'package:portfolio_site/sections/services/tech_section_tablet.dart';
import 'package:portfolio_site/utils/dimensions.dart';

import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double lastScrollData = 0;
  final dimensions = Dimensions();
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    dimensions.init(context);

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final currentScrollData = notification.metrics.pixels;
              if (currentScrollData > lastScrollData) {
                scrollProvider.setNavBarVisibility(false);
              }
              if (currentScrollData < lastScrollData) {
                scrollProvider.setNavBarVisibility(true);
              }
              lastScrollData = currentScrollData;

              return true;
            },
            child: SingleChildScrollView(
                // controller: scrollProvider.controller,
                child: Column(
              children: [
                Responsive(
                  desktop: const HomeDesktop(),
                  tablet: const HomeTablet(),
                  mobile: HomeMobile(),
                ),
                Responsive(
                  desktop: const AboutDesktop(),
                  tablet: AboutTablet(),
                  mobile: AboutMobile(),
                ),
                Responsive(
                  desktop: const TechSectionDesktop(),
                  tablet: TechSectionTablet(),
                  mobile: TechSectionMobile(),
                ),
                Responsive(
                  desktop: ProjectsDesktop(),
                  tablet: ProjectsTablet(),
                  mobile: ProjectsMobile(),
                ),
                Responsive(
                  desktop: const ContactDesktop(),
                  tablet: ContactTablet(),
                  mobile: ContactMobile(),
                ),
                Responsive(
                  desktop: const FooterDesktop(),
                  tablet: FooterTablet(),
                  mobile: FooterMobile(),
                ),
              ],
            )),
          ),
          Consumer<ScrollProvider>(
              builder: (context, provider, child) => Responsive(
                    desktop: NavbarDesktop(
                      show: provider.showNavbar,
                    ),
                    tablet: NavbarMobile(show: provider.showNavbar),
                    mobile: NavbarMobile(show: provider.showNavbar),
                  )),
          Consumer<ScrollProvider>(
            builder: (context, value, child) => Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1,
                right: MediaQuery.of(context).size.width * 0.01,
                child: Responsive(
                  desktop: GoUpArrow(
                    show: value.showArrow,
                  ),
                  tablet: GoUpArrow(
                    show: false,
                  ),
                  mobile: GoUpArrow(show: false),
                )),
          )
        ],
      )),
    );
  }
}
