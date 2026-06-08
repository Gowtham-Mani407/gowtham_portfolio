import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/features/skills/presentation/widgets/skill_cadata.dart';

class SkillsSectionMobile extends StatelessWidget {
  const SkillsSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0C1220),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(
        children: [
          const Text(
            'MY SKILLS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 4,
              color: Color(0xFF38BDF8),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Technologies & Tools I\nWork With',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 40),

          ...skillCategories.map(
            (skill) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: MobileSkillCard(data: skill),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileSkillCard extends StatelessWidget {
  final SkillCategoryData data;

  const MobileSkillCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: data.accent.withOpacity(.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(data.icon, color: data.accent, size: 20),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  data.title,
                  style: TextStyle(
                    color: data.accent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: data.skills
                .map((skill) => SkillChipMobile(label: skill))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class SkillChipMobile extends StatelessWidget {
  final String label;

  const SkillChipMobile({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Color(0xFFCBD5E1), fontSize: 13),
      ),
    );
  }
}
