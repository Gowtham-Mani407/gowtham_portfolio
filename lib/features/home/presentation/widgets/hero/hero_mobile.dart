import 'dart:html' as html;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/utils/scrollhelper.dart';
import 'package:gowtham_portfolio/features/home/data/porfolioservice.dart';
import 'package:gowtham_portfolio/features/home/presentation/screens/home.dart';


class HeroMobile extends StatelessWidget {
  const HeroMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 750,
      ),
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

          /// Background Image
          Positioned.fill(
            child: Opacity(
              opacity: .08,
              child: Image.asset(
                'assets/my_pichalf.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Glow Effects
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(.15),
              ),
            ),
          ),

          Positioned(
            bottom: -120,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan.withOpacity(.08),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                /// PROFILE IMAGE
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFF38BDF8,
                            ).withOpacity(.4),
                            blurRadius: 80,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
            
                    Pulse(
                      infinite: false,
                      duration: const Duration(
                        seconds: 2,
                      ),
                      child: Container(
                        width: 220,
                        height: 220,
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
            
                const SizedBox(height: 35),
            
                const Text(
                  "Hello, I'm 👋",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
            
                const SizedBox(height: 12),
            
                FadeInDown(
                  child: const Text(
                    "Gowtham Mani",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            
                const SizedBox(height: 10),
            
                FadeInDown(
                  child: const Text(
                    "Flutter Developer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF38BDF8),
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
                const Text(
                  "I build scalable mobile and web applications using Flutter, Clean Architecture, MVC and BLoC. Passionate about creating clean UI, maintainable code and exceptional user experiences.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.8,
                  ),
                ),
            
                const SizedBox(height: 35),
            
                /// BUTTONS
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF38BDF8),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () async {
                      final url =
                          await PortfolioService().getResumeUrl();
            
                      html.window.open(url, '_blank');
                    },
                    icon: const Icon(
                      Icons.visibility_outlined,
                    ),
                    label: const Text(
                      "View Resume",
                    ),
                  ),
                ),
            
                const SizedBox(height: 15),
            
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0EA5E9),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () async {
                      final url = await PortfolioService()
                          .getResumedowloadUrl();
            
                      html.window.open(url, '_self');
                    },
                    icon: const Icon(
                      Icons.download_rounded,
                    ),
                    label: const Text(
                      "Download Resume",
                    ),
                  ),
                ),
            
                const SizedBox(height: 15),
            
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white30,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      ScrollHelper.scrollTo(contactKey);
                    },
                    icon: const Icon(
                      Icons.mail_outline,
                    ),
                    label: const Text(
                      "Contact Me",
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