
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ExpensiveWidget extends StatefulWidget {
  const ExpensiveWidget({Key? key}) : super(key: key);

  @override
  State<ExpensiveWidget> createState() => _ExpensiveWidgetState();
}

class _ExpensiveWidgetState extends State<ExpensiveWidget> with SingleTickerProviderStateMixin {
  List<Widget> children = [];
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    controller.addListener(() {
      initWidgets();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.repeat();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  initWidgets() {
    children = List.generate(40, (index) => Positioned(
      top: 700 * controller.value + 2 * index,
      left: 15 * index.toDouble(),
      child: const FlutterLogo(
        size: 45,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 1000,
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: children,
          );
        },
      ),
    );
  }
}
