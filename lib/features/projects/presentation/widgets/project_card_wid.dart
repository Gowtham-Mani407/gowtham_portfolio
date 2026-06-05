import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/features/projects/data/projectmodel.dart';
import 'package:gowtham_portfolio/features/projects/presentation/widgets/PhoneScreenshotCard.dart';

class ProjectCardWidget extends StatefulWidget {
  final ProjectModel project;

  const ProjectCardWidget({super.key, required this.project});

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isHovered ? const Color(0xFF38BDF8) : Colors.white10,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF38BDF8).withOpacity(.20),
                    blurRadius: 30,
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            if (widget.project.images.isNotEmpty)
              if (widget.project.images.isNotEmpty)
                Wrap(
                  spacing: 25,
                  runSpacing: 25,
                  alignment: WrapAlignment.center,
                  children: widget.project.images.map((image) {
                    return PhoneScreenshotCard(imagePath: image);
                  }).toList(),
                ),

            const SizedBox(height: 30),

            Text(
              widget.project.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.project.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                height: 1.8,
              ),
            ),

            const SizedBox(height: 25),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: widget.project.technologies
                  .map(
                    (tech) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF38BDF8).withOpacity(.15),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        tech,
                        style: const TextStyle(
                          color: Color(0xFF38BDF8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
