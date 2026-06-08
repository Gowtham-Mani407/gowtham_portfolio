import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/widgets/customtext.dart';

class SkillChip extends StatelessWidget {
  final String title;

  const SkillChip(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF38BDF8).withOpacity(.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFF38BDF8).withOpacity(.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle,
            size: 16,
            color: Color(0xFF38BDF8),
          ),
          const SizedBox(width: 8),
          CommonText(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}