import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({super.key});

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => setState(() => _margin = 50),
              child: const Text(
                "Animate Margin",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () => setState(() => _color = Colors.amber),
              style: const ButtonStyle(),
              child: const Text(
                "Animate Color",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () => setState(() => _width = 300),
              style: const ButtonStyle(),
              child: const Text(
                "Animate Width",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () => setState(() => _opacity = 0),
              style: const ButtonStyle(),
              child: const Text(
                "Animate Opacity",
                style: TextStyle(color: Colors.black),
              ),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: const Text(
                "Hide Me",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
