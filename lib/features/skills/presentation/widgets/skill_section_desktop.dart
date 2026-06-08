import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/features/skills/presentation/widgets/bentogrid.dart';
import 'package:gowtham_portfolio/features/skills/presentation/widgets/skill_cadata.dart';

class SkillSectionDesktop extends StatelessWidget {
  const SkillSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0C1220),
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      child: Column(
        children: [
          // ── Label ──
          const Text(
            'MY SKILLS',
            style: TextStyle(
              fontFamily: 'Syne',
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 4,
              color: Color(0xFF38BDF8),
            ),
          ),

          const SizedBox(height: 14),

          // ── Headline ──
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'Syne',
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: Color(0xFFF0F6FF),
                height: 1.15,
              ),
              children: [
                TextSpan(text: 'Technologies & Tools I\n'),
                TextSpan(
                  text: 'Work With',
                  style: TextStyle(color: Color(0xFF38BDF8)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 56),

          // ── Bento Grid ──
          BentoGrid(categories: skillCategories),
        ],
      ),
    );
  }
}
