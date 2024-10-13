import 'package:flutter/material.dart';
import 'package:portfolio_site/components/available_on_button.dart';

import 'package:portfolio_site/model/projects.dart';
import 'package:portfolio_site/utils/typography.dart';

class ProjectInfoTablet extends StatefulWidget {
  final int index;
  ProjectInfoTablet({required this.index});
  @override
  State<ProjectInfoTablet> createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfoTablet>
    with SingleTickerProviderStateMixin {
  late Animation<double> scaleAnim;
  late AnimationController scaleAnimController;
  @override
  void initState() {
    super.initState();
    scaleAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    scaleAnim = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: scaleAnimController, curve: Curves.decelerate));
    Future.delayed(Duration(milliseconds: 200))
        .then((value) => scaleAnimController.forward());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ScaleTransition(
      scale: scaleAnim,
      child: Center(
        child: Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Stack(children: [
              SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 2),
                      child: Text(
                        MyProjects.projects[widget.index]['name'],
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: AppTypography.poppins,
                            fontWeight: FontWeight.bold,
                            fontSize: AppTypography.tabletHeadingSize * 1.4),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      MyProjects.projects[widget.index]['descriptionLine'],
                      style: TextStyle(
                          fontFamily: AppTypography.normalFont,
                          fontSize: AppTypography.normalFontSizeTablet * 0.9),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Features',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: AppTypography.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: AppTypography.tabletHeadingSize * 1.4),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: (MyProjects.projects[widget.index]['features']
                              as List)
                          .length,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                '${index + 1}. ${MyProjects.projects[widget.index]['features'][index]}',
                                style: TextStyle(
                                    fontSize:
                                        AppTypography.normalFontSizeTablet *
                                            0.9),
                              ),
                            ),
                          )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Tech Used',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: AppTypography.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: AppTypography.tabletHeadingSize * 1.4),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: (MyProjects.projects[widget.index]['techUsed']
                              as List)
                          .length,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                '* ${MyProjects.projects[widget.index]['techUsed'][index]}',
                                style: TextStyle(
                                    fontSize:
                                        AppTypography.normalFontSizeTablet *
                                            0.9),
                              ),
                            ),
                          )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Available on',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontFamily: AppTypography.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: AppTypography.tabletHeadingSize * 1.4),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, bottom: 10),
                      child: Wrap(
                        alignment: WrapAlignment.spaceAround,
                        direction: Axis.horizontal,
                        children: [
                          ...(MyProjects.projects[widget.index]['availableOn']
                                  as List)
                              .asMap()
                              .entries
                              .map((e) => AvailableOn(
                                  text: MyProjects.projects[widget.index]
                                      ['availableOn'][e.key]['platformName'],
                                  index: e.key,
                                  link: MyProjects.projects[widget.index]
                                      ['availableOn'][e.key]['link'],
                                  icon: MyProjects.projects[widget.index]
                                      ['availableOn'][e.key]['icon'],
                                  isMobile: true))
                        ],
                      ))
                ],
              )),
              Positioned(
                  top: 0,
                  right: 0,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.cancel,
                          size: 25,
                        ),
                      ),
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
