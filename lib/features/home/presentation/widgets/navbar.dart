import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/utils/scrollhelper.dart';
import 'package:gowtham_portfolio/core/widgets/customtext.dart';
import 'package:gowtham_portfolio/features/home/presentation/screens/home.dart';
import 'package:gowtham_portfolio/features/home/presentation/widgets/navitemwid.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 75,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.08),
                borderRadius: BorderRadius.circular(0),
                border: Border.all(color: Colors.white.withOpacity(.15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: const CommonText(
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
        ),
      ),
    );
  }
}
