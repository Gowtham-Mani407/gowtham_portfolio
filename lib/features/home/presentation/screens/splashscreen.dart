import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/features/home/presentation/screens/home.dart';
import 'package:lottie/lottie.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.92,
      end: 1.08,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildGlowCircle({
    required double size,
    required Color color,
    required double opacity,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(opacity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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

          /// Top Left Glow
          Positioned(
            top: -120,
            left: -120,
            child: buildGlowCircle(
              size: 320,
              color: const Color(0xFF38BDF8),
              opacity: .12,
            ),
          ),

          /// Bottom Right Glow
          Positioned(
            bottom: -180,
            right: -120,
            child: buildGlowCircle(
              size: 420,
              color: const Color(0xFF06B6D4),
              opacity: .10,
            ),
          ),

          /// Center Content
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Glowing Icon
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF38BDF8,
                          ).withOpacity(.5),
                          blurRadius: 100,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.05),
                        border: Border.all(
                          color: Colors.white24,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.flutter_dash,
                        color: Colors.white,
                        size: 90,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// Main Text
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: [
                          Color(0xFF38BDF8),
                          Color(0xFF8B5CF6),
                        ],
                      ).createShader(bounds);
                    },
                    child: const Text(
                      "DESIGN • DEVELOP • DEPLOY",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Building Exceptional Digital Experiences",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 35),

                  /// Lottie Loader
                  SizedBox(
                    width: 150,
                    child: Lottie.asset(
                      'assets/loadgif.json',
                      repeat: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}