import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;

  // bool isFav = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(_controller);

    // _controller.addListener(() {
    //   // print(_controller.value);
    //   // print(_colorAnimation.value);
    // });

    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     setState(() => isFav = true);
    //   }

    //   if (status == AnimationStatus.dismissed) {
    //     setState(() => isFav = false);
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: 30,
          ),
          onPressed: () {
            _controller.isCompleted ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}
