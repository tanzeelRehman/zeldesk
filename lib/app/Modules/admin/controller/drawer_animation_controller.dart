import 'package:flutter/material.dart';

class DrawerAnimationController {
  DrawerAnimationController._();
  static late final AnimationController drawerAnimationController;
  static AnimationController getController() {
    return drawerAnimationController;
  }
}
