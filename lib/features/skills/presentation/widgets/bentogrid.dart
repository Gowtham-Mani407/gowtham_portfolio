import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/features/skills/presentation/widgets/skill_cadata.dart';
import 'package:gowtham_portfolio/features/skills/presentation/widgets/skillcard.dart';

class BentoGrid extends StatelessWidget {
  final List<SkillCategoryData> categories;

  BentoGrid({required this.categories});

  @override
  Widget build(BuildContext context) {
    final row1 = categories.where((c) => !c.wide).toList();
    final row2 = categories.where((c) => c.wide).toList();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 860),
      child: Column(
        children: [
          // Row 1 — three equal cards
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: row1.asMap().entries.map((e) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: e.key == 0 ? 0 : 8,
                      right: e.key == row1.length - 1 ? 0 : 8,
                    ),
                    child: SkillCard(data: e.value),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 16),

          // Row 2 — wide cards (full width each)
          ...row2.map(
            (data) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SkillCard(data: data),
            ),
          ),
        ],
      ),
    );
  }
}
