// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<double> animation;
//   late CurvedAnimation curvedAnimation;

//   @override
//   void initState() {
//     super.initState();

//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     );

//     curvedAnimation = CurvedAnimation(
//       parent: animationController,
//       curve: Curves.bounceIn,
//       reverseCurve: Curves.easeOut,
//     );

//     animation = Tween<double>(
//       begin: 0,
//       end: 2 * math.pi,
//     )
//         // .chain(CurveTween(curve: Curves.bounceIn))
//         .animate(curvedAnimation)
//       // ..addListener(() {})
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           animationController.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           animationController.forward();
//         }
//       });

//     animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ResoCoderImage(animation: animation);
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }
// }

// class RotatingTransition extends StatelessWidget {
//   const RotatingTransition({
//     super.key,
//     required this.child,
//     required this.angle,
//   });

//   final Widget child;
//   final Animation<double> angle;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: angle,
//       child: child,
//       builder: (context, child) {
//         return Transform.rotate(
//           angle: angle.value,
//           child: child,
//         );
//       },
//     );
//   }
// }

// class ResoCoderImage extends AnimatedWidget {
//   const ResoCoderImage({
//     super.key,
//     required this.animation,
//   }) : super(listenable: animation);

//   final Animation<double> animation;

//   @override
//   Widget build(BuildContext context) {
//     final animation = super.listenable as Animation<double>;
//     return Scaffold(
//         body: RotatingTransition(
//             child: Container(
//       alignment: Alignment.center,
//       padding: const EdgeInsets.all(30),
//       child: Image.asset(
//         "images/beach.png",
//         height: 120,
//       ),
//     )));
//   }
// }
