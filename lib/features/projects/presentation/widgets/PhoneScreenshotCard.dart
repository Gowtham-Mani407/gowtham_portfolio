import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/responsive/responsive.dart';

class PhoneScreenshotCard extends StatefulWidget {
  final String imagePath;

  const PhoneScreenshotCard({required this.imagePath});

  @override
  State<PhoneScreenshotCard> createState() => PhoneScreenshotCardState();
}

class PhoneScreenshotCardState extends State<PhoneScreenshotCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
      },
      onExit: (_) {
        setState(() => isHovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, isHovered ? -12 : 0, 0),
        width: Responsive.isMobile(context) ? 140 : 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            if (isHovered)
              BoxShadow(
                color: const Color(0xFF38BDF8).withOpacity(.25),
                blurRadius: 25,
              ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(widget.imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
