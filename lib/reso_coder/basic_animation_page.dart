import 'package:flutter/material.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    )
        // .chain(CurveTween(curve: Curves.bounceIn))
        .animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: animation.value,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          child: Image.asset(
            "images/beach.png",
            height: 120,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
