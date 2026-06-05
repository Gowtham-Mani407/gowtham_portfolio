import 'package:flutter/material.dart';

class SkillCategoryData {
  final String title;
  final IconData icon;
  final Color accent;
  final List<String> skills;
  final bool wide;

  const SkillCategoryData({
    required this.title,
    required this.icon,
    required this.accent,
    required this.skills,
    this.wide = false,
  });
}

const List<SkillCategoryData> skillCategories = [
  SkillCategoryData(
    title: 'Frontend Dev',
    icon: Icons.code_rounded,
    accent: Color(0xFF38BDF8),
    skills: ['Flutter', 'Dart'],
  ),
  SkillCategoryData(
    title: 'State Management',
    icon: Icons.layers_rounded,
    accent: Color(0xFF818CF8),
    skills: ['BLoC', 'Provider', 'GetX'],
  ),
  SkillCategoryData(
    title: 'Database',
    icon: Icons.storage_rounded,
    accent: Color(0xFFFBBF24),
    skills: ['SQLite', 'Hive'],
  ),
  SkillCategoryData(
    title: 'Backend Integration',
    icon: Icons.dns_rounded,
    accent: Color(0xFF34D399),
    skills: ['REST API', 'Firebase', 'SignalR', 'Webhooks', 'PayTrace', 'In-App Purchase'],
    wide: true,
  ),
  SkillCategoryData(
    title: 'Tools & Platforms',
    icon: Icons.build_rounded,
    accent: Color(0xFFF472B6),
    skills: ['GitHub', 'GitLab', 'Codemagic', 'VS Code', 'Android Studio', 'Xcode', 'Agile'],
    wide: true,
  ),
];