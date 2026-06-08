import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/responsive/responsive.dart';
import 'package:gowtham_portfolio/core/widgets/customtext.dart';

class StatCard extends StatelessWidget {
  final String value;
  final String title;

  const StatCard({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width : isMobile ? double.infinity : 220,
      padding: EdgeInsets.all(
        isMobile ? 16 : 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonText(
            value,
            style: TextStyle(
              color: const Color(0xFF38BDF8),
              fontSize: isMobile ? 28 : 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          CommonText(
            title,
            textalign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }
}