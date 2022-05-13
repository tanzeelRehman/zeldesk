import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:zeldesk/app/Modules/admin/constants/custom_icon_button_data1.dart';
import 'package:zeldesk/app/Widgets/custom_icon_button1.dart';
import 'package:zeldesk/app/Widgets/custom_icon_button2.dart';
import 'package:zeldesk/app/Widgets/logo_widget.dart';

import 'package:zeldesk/core/constants/colors.dart';
import 'package:zeldesk/app/Modules/admin/controller/drawer_animation_controller.dart';

class CustomAnimatedDrawer extends StatefulWidget {
  @override
  State<CustomAnimatedDrawer> createState() => _CustomAnimatedDrawerState();
}

class _CustomAnimatedDrawerState extends State<CustomAnimatedDrawer>
    with SingleTickerProviderStateMixin {
  late Size _screen;
  @override
  void initState() {
    // TODO: implement initState
    DrawerAnimationController.drawerAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    DrawerAnimationController.drawerAnimationController.forward();
    DrawerAnimationController.drawerAnimationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screen = MediaQuery.of(context).size;

    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 15),
          height: _screen.height,
          curve: Curves.decelerate,
          width: (DrawerAnimationController.drawerAnimationController.value *
                  155) +
              45,
          decoration: const BoxDecoration(
            color: klightbg,
            boxShadow: [
              BoxShadow(color: klightwhite, blurRadius: 1, spreadRadius: 1)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    //TODO: HAD TO SET THIS
                    child: Row(
                      children: [
                        logoWidget(25, 25, 20),
                        const SizedBox(
                          width: 8,
                        ),
                        // if (DrawerAnimationController
                        //     .drawerAnimationController.isCompleted)
                        //   Column(
                        //     children: [
                        //       Text(
                        //         "ZENDESK",
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .subtitle1!
                        //             .copyWith(fontSize: 20),
                        //       ),
                        //     ],
                        //   )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: kdarkbg,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topLeft: Radius.circular(8)),
                    ),
                    child: Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.rotationZ(3.14 *
                          DrawerAnimationController
                              .drawerAnimationController.value),
                      child: IconButton(
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            if (DrawerAnimationController
                                .drawerAnimationController.isCompleted) {
                              DrawerAnimationController
                                  .drawerAnimationController
                                  .reverse();
                            } else {
                              DrawerAnimationController
                                  .drawerAnimationController
                                  .forward();
                              if (DrawerAnimationController
                                  .drawerAnimationController.isCompleted) {}
                            }
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.caretRight,
                            size: 20,
                          )),
                    ),
                  ),
                ],
              ),

              sectionHeading(
                drawerAnimationController:
                    DrawerAnimationController.drawerAnimationController,
                heading: "GENERAL",
              ),

              //* ALL THE BUTTONS ARE DEFINED IN CONSTANT FOLDER

              SizedBox(
                height: 120,
                child: ListView.builder(
                    itemCount: customIconButtonData1.length,
                    itemBuilder: (context, index) {
                      return CustomIconButton1(
                        controller:
                            DrawerAnimationController.drawerAnimationController,
                        icon: customIconButtonData1[index].icon,
                        text: customIconButtonData1[index].text,
                        ontap: customIconButtonData1[index].ontap,
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),

              sectionHeading(
                drawerAnimationController:
                    DrawerAnimationController.drawerAnimationController,
                heading: "ADMINSTRATION",
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   child: Column(
              //     children: const <Widget>[
              //       SizedBox(height: 20.0),
              //       ExpansionTile(
              //         title: Text(
              //           "Title",
              //           style: TextStyle(
              //               fontSize: 18.0, fontWeight: FontWeight.bold),
              //         ),
              //         children: <Widget>[
              //           ListTile(
              //             title: Text('data'),
              //           ),
              //           ListTile(
              //             title: Text('data'),
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: customIconButtonData2.length,
                    itemBuilder: (context, index) {
                      return CustomIconButton1(
                        controller:
                            DrawerAnimationController.drawerAnimationController,
                        icon: customIconButtonData2[index].icon,
                        text: customIconButtonData2[index].text,
                        ontap: customIconButtonData2[index].ontap,
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class sectionHeading extends StatelessWidget {
  const sectionHeading({
    Key? key,
    required AnimationController drawerAnimationController,
    required String heading,
  })  : _drawerAnimationController = drawerAnimationController,
        _heading = heading,
        super(key: key);

  final AnimationController _drawerAnimationController;
  final String _heading;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        height: 30 * _drawerAnimationController.value,
        child: Opacity(
          opacity: _drawerAnimationController.value,
          child: Text(
            _heading,
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
          ),
        ));
  }
}
