import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FadeInOnScroll extends StatefulWidget {
  final Widget child;
  final String id;

  const FadeInOnScroll({super.key, required this.child, required this.id});

  @override
  State<FadeInOnScroll> createState() => _FadeInOnScrollState();
}

class _FadeInOnScrollState extends State<FadeInOnScroll>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool hasAnimated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (info) {
        if (!hasAnimated && info.visibleFraction > 0.15) {
          hasAnimated = true;
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Opacity(
            opacity: _controller.value,
            child: Transform.translate(
              offset: Offset(0, 50 * (1 - _controller.value)),
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}
