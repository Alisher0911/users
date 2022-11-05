import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget child;
  final AnimationController controller;
  final bool visible;
  final bool firstRun;

  const CustomAppBar({
    super.key, 
    required this.child,
    required this.controller,
    required this.visible,
    required this.firstRun
  });

  
  
  @override
  Size get preferredSize => const Size.fromHeight(45);
  
  @override
  Widget build(BuildContext context) {
    visible ? controller.reverse() : controller.forward();

    return firstRun
      ? Container()
      : SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1)).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
      ),
      child: child,
    );
  }
}