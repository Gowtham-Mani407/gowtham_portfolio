import 'dart:html' as html;

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/animations/jumpingtext.dart';
import 'package:gowtham_portfolio/core/theme/apptextstyle.dart';
import 'package:gowtham_portfolio/core/utils/scrollhelper.dart';
import 'package:gowtham_portfolio/core/widgets/customtext.dart';
import 'package:gowtham_portfolio/features/home/data/porfolioservice.dart';
import 'package:gowtham_portfolio/features/home/presentation/screens/home.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      constraints: const BoxConstraints(minHeight: 800),
      child: Stack(
        children: [
          /// Background Gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0F172A),
                    Color(0xFF1E293B),
                    Color(0xFF334155),
                  ],
                ),
              ),
            ),
          ),

          /// Faded Full Background Photo
          Positioned.fill(
            child: Opacity(
              opacity: 0.08,
              child: Image.asset('assets/my_pichalf.jpeg', fit: BoxFit.cover),
            ),
          ),

          /// Decorative Glow
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(.15),
              ),
            ),
          ),

          Positioned(
            bottom: -150,
            right: -100,
            child: Container(
              width: 450,
              height: 450,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan.withOpacity(.08),
              ),
            ),
          ),

          /// Main Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
            child: Row(
              children: [
                /// LEFT SECTION
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      JumpingText(
                        "Hello, I'm 👋",
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 20),

                      FadeInDown(
                        child: CommonText(
                          "Gowtham Mani",
                          style: AppTextStyles.heading1.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      FadeInDown(
                        child: const Text(
                          "Mobile App Developer",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF38BDF8),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: screenWidth * .4,
                        child: CommonText(
                          "I build scalable mobile and web applications using Flutter, Clean Architecture, MVC and BLoC. Passionate about creating clean UI, maintainable code and exceptional user experiences.",
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white70,
                            height: 1.8,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      Row(
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF38BDF8),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              final url = await PortfolioService()
                                  .getResumeUrl();

                              // Open PDF in browser tab
                              html.window.open(url, '_blank');
                            },
                            icon: const Icon(Icons.visibility_outlined),
                            label: const Text("View Resume"),
                          ),

                          const SizedBox(width: 16),

                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0EA5E9),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              final url = await PortfolioService()
                                  .getResumedowloadUrl();

                              html.window.open(url, '_self');
                            },
                            icon: const Icon(Icons.download_rounded),
                            label: const Text("Download Resume"),
                          ),

                          const SizedBox(width: 16),

                          /// Contact Me
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white30),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              ScrollHelper.scrollTo(contactKey);
                            },
                            icon: const Icon(Icons.mail_outline),
                            label: const Text("Contact Me"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 50),

                /// RIGHT SECTION
                Expanded(
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        /// Blue Glow
                        Container(
                          width: 380,
                          height: 380,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF38BDF8).withOpacity(.45),
                                blurRadius: 120,
                                spreadRadius: 20,
                              ),
                            ],
                          ),
                        ),

                        /// Profile Image
                        Pulse(
                          infinite: false,
                          duration: const Duration(seconds: 2),
                          child: Container(
                            width: 350,
                            height: 350,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white24,
                                width: 3,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/my_pic_portfolio.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
