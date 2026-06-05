import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/widgets/fadeonscroll.dart';
import 'package:gowtham_portfolio/features/about/presentation/widgets/aboutsectionwid.dart';
import 'package:gowtham_portfolio/features/contact/presentation/widgets/contact_sec_wid.dart';
import 'package:gowtham_portfolio/features/home/presentation/widgets/herosectionwidget.dart';
import 'package:gowtham_portfolio/features/home/presentation/widgets/navbar.dart';
import 'package:gowtham_portfolio/features/projects/presentation/widgets/project_sec_wid.dart';
import 'package:gowtham_portfolio/features/skills/presentation/widgets/skill_section_wid.dart';

final aboutKey = GlobalKey();
final skillsKey = GlobalKey();
final projectsKey = GlobalKey();
final contactKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  bool showButton = false;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 300 && !showButton) {
        setState(() {
          showButton = true;
        });
      } else if (_scrollController.offset <= 300 && showButton) {
        setState(() {
          showButton = false;
        });
      }
    });

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Stack(
                children: [HeroSectionWidget(), NavbarWidget()],
              ),
            ),

            Container(
              key: aboutKey,
              color: const Color(0xFF0B1120),
              child: FadeInOnScroll(child: const AboutSectionWidget()),
            ),

            Container(
              key: skillsKey,
              color: const Color(0xFF0B1120),
              child: FadeInOnScroll(child: const SkillsSectionWidget()),
            ),

            Container(
              key: projectsKey,
              color: const Color(0xFF0B1120),
              child: FadeInOnScroll(child: const ProjectsSectionWidget()),
            ),

            Container(
              key: contactKey,
              color: const Color(0xFF0B1120),
              child: FadeInOnScroll(child: const ContactSectionWidget()),
            ),
          ],
        ),
      ),

      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: showButton ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: showButton ? 1 : 0,
          child: ScaleTransition(
            scale: _pulseAnimation,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: IconButton(
                onPressed: scrollToTop,
                icon: const Icon(
                  Icons.keyboard_double_arrow_up_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
