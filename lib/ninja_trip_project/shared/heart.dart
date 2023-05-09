import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double?> _sizeAnimation;
  late Animation _curve;

  // bool isFav = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.slowMiddle,
    );

    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(_curve as Animation<double>);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30),
          weight: 50,
        ),
      ],
    ).animate(_curve as Animation<double>);

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
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            _controller.isCompleted ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}
