import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/theme/apptextstyle.dart';
import 'package:gowtham_portfolio/core/widgets/customtext.dart';
import 'package:gowtham_portfolio/features/about/presentation/widgets/statecard.dart';

class AboutSectionDesktop extends StatelessWidget {
  const AboutSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      color: const Color(0xFF0B1120),
      child: Column(
        children: [
          CommonText(
            "ABOUT ME",
            style: TextStyle(
              color: Colors.blue.shade300,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
    
          const SizedBox(height: 16),
    
          const CommonText(
            "Building Reliable Digital Experiences",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
    
          const SizedBox(height: 60),
    
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Left Image
              Expanded(
                child: Container(
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset("assets/my_pic.jpeg", fit: BoxFit.cover),
    
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
    
              const SizedBox(width: 60),
    
              /// Right Content
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommonText(
                      "Flutter Developer 🚀",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
    
                    const SizedBox(height: 20),
    
                    CommonText(
                      "I'm Gowtham Mani, a Flutter Developer passionate about creating high-quality mobile and web applications. I enjoy building scalable solutions using Clean Architecture, MVC, BLoC, REST APIs, and Firebase while focusing on performance and user experience.",
                      style: AppTextStyles.body.copyWith(color: Colors.white70),
                    ),
    
                    const SizedBox(height: 30),
    
                    const _HighlightTile(
                      icon: Icons.check_circle,
                      title: "Clean Architecture",
                    ),
    
                    const _HighlightTile(
                      icon: Icons.check_circle,
                      title: "BLoC State Management",
                    ),
    
                    const _HighlightTile(
                      icon: Icons.check_circle,
                      title: "REST API Integration",
                    ),
    
                    const _HighlightTile(
                      icon: Icons.check_circle,
                      title: "Flutter Web Development",
                    ),
    
                    const _HighlightTile(
                      icon: Icons.check_circle,
                      title: "Firebase Services",
                    ),
                  ],
                ),
              ),
            ],
          ),
    
          const SizedBox(height: 80),
    
          /// Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              StatCard(value: "3.5+", title: "Years Experience"),
    
              StatCard(value: "3+", title: "Production Apps"),
    
              StatCard(value: "3", title: "Companies"),
    
              StatCard(value: "100%", title: "Passion"),
            ],
          ),
        ],
      ),
    );
  }
}

class _HighlightTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _HighlightTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF38BDF8)),
          const SizedBox(width: 12),
          CommonText(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
