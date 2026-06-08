import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/responsive/responsive_builder.dart';
import 'package:gowtham_portfolio/features/about/presentation/widgets/aboutsectionMobile.dart';
import 'package:gowtham_portfolio/features/about/presentation/widgets/aboutsectiondesktop.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobile: AboutSectionMobile(),
      desktop: AboutSectionDesktop(),
    );
  }
}