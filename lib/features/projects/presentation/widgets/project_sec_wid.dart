import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/responsive/responsive.dart';
import 'package:gowtham_portfolio/features/projects/data/projectmodel.dart';
import 'package:gowtham_portfolio/features/projects/presentation/widgets/project_card_wid.dart';

class ProjectsSectionWidget extends StatelessWidget {
  const ProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      ProjectModel(
        title: "John Brich Society",
        description:
            "A content platform and e-commerce application integrating HTML content rendering, YouTube videos, PayTrace payments, In-App Purchases and webhook-based synchronization.",
        images: [
          "assets/jbs_5.jpeg",
          "assets/jbs_3.jpeg",
          "assets/jbs_6.jpeg",
          "assets/jbs_2.jpeg",
          "assets/jbs_1.jpeg",
          //"assets/jbs_4.jpeg",
        ],
        technologies: [
          "Flutter",
          "REST API",
          "PayTrace",
          "Webhooks",
          "YouTube",
          "IAP",
          "Getx",
        ],
      ),
      ProjectModel(
        title: "SMART SORT",
        description:
            "Waste pickup application with real-time tracking using SignalR and Geolocator.",
        images: [],
        technologies: [
          "Flutter",
          "SignalR",
          "REST API",
          "Geolocator",
          "Provider",
        ],
      ),
      ProjectModel(
        title: "Nithra Matrimony",
        description:
            "Matrimony platform with profile matching, search filters, interests and preference-based recommendations.",
        images: [],
        technologies: ["Flutter", "Firebase", "REST API", "BLoC"],
      ),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 100,
        vertical: Responsive.isMobile(context) ? 60 : 100,
      ),
      color: const Color(0xFF0B1120),
      child: Column(
        children: [
          const Text(
            "PROJECTS",
            style: TextStyle(
              color: Color(0xFF38BDF8),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Featured Work",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Some of the applications I've worked on professionally.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),

          const SizedBox(height: 70),

          ...projects.map(
            (project) => Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: ProjectCardWidget(project: project),
            ),
          ),
        ],
      ),
    );
  }
}
