import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/responsive/responsive_builder.dart';
import 'package:gowtham_portfolio/features/skills/presentation/widgets/skill_section_desktop.dart';
import 'package:gowtham_portfolio/features/skills/presentation/widgets/skill_section_mobile.dart';

class SkillsSectionWidget extends StatelessWidget {
  const SkillsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobile: SkillsSectionMobile(),
      desktop: SkillSectionDesktop(),
    );
  }
}
