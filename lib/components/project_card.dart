import 'package:flutter/material.dart';
import 'package:portfolio_site/components/project_info.dart';
import 'package:portfolio_site/components/project_info_tablet.dart';
import 'package:portfolio_site/utils/typography.dart';

class ProjectCard extends StatefulWidget {
  final String projectBanner;
  final String type;
  final int index;
  final bool isTab;
  final bool isPhone;

  ProjectCard(
      {required this.isPhone,
      required this.isTab,
      required this.index,
      required this.projectBanner,
      required this.type});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: Material(
        animationDuration: Duration(milliseconds: 500),
        elevation: !isHovering ? 5 : 10,
        shadowColor: isHovering ? Theme.of(context).colorScheme.primary : null,
        borderRadius: BorderRadius.circular(10),
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            width: ((size.width * size.height) * 0.00001) + 250 * 1.2,
            height: ((size.width * size.height) * 0.00001) + 187 * 1.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    width: ((size.width * size.height) * 0.00001) + 250 * 1.2,
                    height: ((size.width * size.height) * 0.00001) + 187 * 1.1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.projectBanner,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.9)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Text(
                          widget.type,
                          style: TextStyle(
                              fontFamily: AppTypography.poppins,
                              color: Theme.of(context).colorScheme.primary,
                              fontSize:
                                  AppTypography.projectTypeSizeDesktop * 0.85),
                        ),
                      ))
                ]),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton.icon(
                        style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(5),
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        onPressed: () {
                          if (widget.isTab && !widget.isPhone) {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    ProjectInfoTablet(index: widget.index));
                          }
                          if (!widget.isTab && widget.isPhone) {
                            showDialog(
                                context: context,
                                builder: (context) => ProjectInfoTablet(
                                      index: widget.index,
                                    ));
                          }
                          if (!widget.isTab && !widget.isPhone) {
                            showDialog(
                                context: context,
                                builder: (context) => ProjectInfo(
                                      index: widget.index,
                                    ));
                          }
                        },
                        icon: Icon(
                          Icons.info,
                        ),
                        label: Text(
                          'View Info',
                          style:
                              TextStyle(fontFamily: AppTypography.normalFont),
                        )),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
