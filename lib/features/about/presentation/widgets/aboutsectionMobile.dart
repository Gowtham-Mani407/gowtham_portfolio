import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/theme/apptextstyle.dart';
import 'package:gowtham_portfolio/core/widgets/customtext.dart';
import 'package:gowtham_portfolio/features/about/presentation/widgets/skillchip.dart';
import 'package:gowtham_portfolio/features/about/presentation/widgets/statecard.dart';

class AboutSectionMobile extends StatelessWidget {
  const AboutSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),
      color: const Color(0xFF0B1120),
      child: Column(
        children: [
          CommonText(
            "ABOUT ME",
            style: TextStyle(
              color: Colors.blue.shade300,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 12),

          const CommonText(
            "Building Reliable\nDigital Experiences",
            textalign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 35),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 280,
              width: double.infinity,
              child: Image.asset(
                "assets/my_pic.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 30),

          const CommonText(
            "Flutter Developer 🚀",
            textalign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          CommonText(
            "I'm Gowtham Mani, a Flutter Developer passionate about creating high-quality mobile and web applications. I enjoy building scalable solutions using Clean Architecture, MVC, BLoC, REST APIs, and Firebase while focusing on performance and user experience.",
            textalign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              color: Colors.white70,
              height: 1.8,
            ),
          ),

          const SizedBox(height: 30),

          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              SkillChip("Clean Architecture"),
              SkillChip("BLoC"),
              SkillChip("REST APIs"),
              SkillChip("Flutter Web"),
              SkillChip("Firebase"),
            ],
          ),

          const SizedBox(height: 40),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: const [
              StatCard(
                value: "3.5+",
                title: "Years Experience",
              ),
              StatCard(
                value: "3+",
                title: "Production Apps",
              ),
              StatCard(
                value: "3",
                title: "Companies",
              ),
              StatCard(
                value: "100%",
                title: "Passion",
              ),
            ],
          ),
        ],
      ),
    );
  }
}