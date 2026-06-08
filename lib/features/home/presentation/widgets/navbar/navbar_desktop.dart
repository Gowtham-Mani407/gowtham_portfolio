import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/utils/scrollhelper.dart';
import 'package:gowtham_portfolio/features/home/presentation/screens/home.dart';
import 'package:gowtham_portfolio/features/home/presentation/widgets/navitemwid.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 75,
          color: Colors.white.withOpacity(.08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "GM",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Row(
                children: [
                  NavItemWidget(
                    title: "About",
                    onTap: () => ScrollHelper.scrollTo(aboutKey),
                  ),
                  NavItemWidget(
                    title: "Skills",
                    onTap: () => ScrollHelper.scrollTo(skillsKey),
                  ),
                  NavItemWidget(
                    title: "Projects",
                    onTap: () => ScrollHelper.scrollTo(projectsKey),
                  ),
                  NavItemWidget(
                    title: "Contact",
                    onTap: () => ScrollHelper.scrollTo(contactKey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
