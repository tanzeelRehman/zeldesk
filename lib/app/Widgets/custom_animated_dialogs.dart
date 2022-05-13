import 'package:flutter/cupertino.dart';

class CustomAnimatedDialogs {
  static slideFromRight(_child, BuildContext context) {
    return showGeneralDialog(
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (animation, secondaryAnimation, child) {
        return _child;
      },
      barrierDismissible: true,
      context: context,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
            child: _child,
            position: Tween<Offset>(
                    begin: const Offset(1, 0), end: const Offset(0, 0))
                .animate(animation));
      },
    );
  }
}
