import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/features/skills/presentation/widgets/skill_cadata.dart';

class SkillCard extends StatefulWidget {
  final SkillCategoryData data;

  const SkillCard({required this.data});

  @override
  State<SkillCard> createState() => SkillCardState();
}

class SkillCardState extends State<SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = widget.data.accent;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? accent.withOpacity(0.4)
                : Colors.white.withOpacity(0.06),
            width: 1,
          ),
          gradient: _hovered
              ? RadialGradient(
                          center: Alignment.topLeft,
                          radius: 1.2,
                          colors: [
                            accent.withOpacity(0.07),
                            Colors.transparent,
                          ],
                        ).createShader(const Rect.fromLTWH(0, 0, 400, 300)) !=
                        null
                    ? null // RadialGradient used below via BoxDecoration
                    : null
              : null,
        ),
        // We simulate the radial glow using a Stack
        child: Stack(
          children: [
            // Glow overlay
            if (_hovered)
              Positioned.fill(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: _hovered ? 1 : 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: RadialGradient(
                        center: Alignment.topLeft,
                        radius: 1.5,
                        colors: [accent.withOpacity(0.08), Colors.transparent],
                      ),
                    ),
                  ),
                ),
              ),

            // Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Icon box
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: accent.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(widget.data.icon, color: accent, size: 18),
                    ),

                    const SizedBox(width: 10),

                    // Category title
                    Expanded(
                      child: Text(
                        widget.data.title.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Syne',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: accent,
                        ),
                      ),
                    ),

                    // Count badge
                    Text(
                      widget.data.skills.length.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontFamily: 'Syne',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.18),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Chips
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.data.skills
                      .map((s) => _SkillChip(label: s, hovered: _hovered))
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  final bool hovered;

  const _SkillChip({required this.label, required this.hovered});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: hovered
              ? Colors.white.withOpacity(0.12)
              : Colors.white.withOpacity(0.07),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: hovered ? const Color(0xFFCBD5E1) : const Color(0xFF94A3B8),
        ),
      ),
    );
  }
}
