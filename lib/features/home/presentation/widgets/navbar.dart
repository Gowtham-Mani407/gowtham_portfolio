import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/responsive/responsive_builder.dart';
import 'package:gowtham_portfolio/features/home/presentation/widgets/navbar/navbar_desktop.dart';
import 'package:gowtham_portfolio/features/home/presentation/widgets/navbar/navbar_mobile.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobile: NavbarMobile(),
      desktop: NavbarDesktop(),
    );
  }
}