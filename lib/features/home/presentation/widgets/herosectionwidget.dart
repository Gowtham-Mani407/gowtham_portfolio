import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/responsive/responsive_builder.dart';
import 'package:gowtham_portfolio/features/home/presentation/widgets/hero/hero_desktop.dart';
import 'package:gowtham_portfolio/features/home/presentation/widgets/hero/hero_mobile.dart';


class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobile: HeroMobile(),
      desktop: HeroDesktop(),
    );
  }
}