import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 200;
  double height = 200;
  Color? color = Colors.indigo[300];
  double borderRadius = 16;

  void changeAnimatedContainerShape() {
    final random = Random();
    setState(() {
      this.width = random.nextInt(300) + 50;
      this.height = random.nextInt(300) + 50;
      this.color = Color.fromRGBO(
          random.nextInt(255), // red
          random.nextInt(255), // green
          random.nextInt(255), // blue
          1);
      this.borderRadius = random.nextInt(100).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.elasticInOut,
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
              color: this.color,
              borderRadius: BorderRadius.circular(this.borderRadius)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeAnimatedContainerShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
