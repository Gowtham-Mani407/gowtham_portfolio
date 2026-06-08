import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/core/responsive/responsive.dart';
import 'package:gowtham_portfolio/features/contact/presentation/widgets/contact_info_tile.dart';

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        const Text(
          "Get In Touch",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          "I'm always interested in discussing Mobile Application development, freelance projects and full-time opportunities.",
          textAlign: Responsive.isMobile(context)
              ? TextAlign.center
              : null,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 40),

        const ContactInfoTile(
          icon: Icons.email_outlined,
          title: "Email",
          value: "mgowtham795@gmail.com",
        ),

        const SizedBox(height: 20),

        const ContactInfoTile(
          icon: Icons.phone_outlined,
          title: "Phone",
          value: "+91 9360747090",
        ),

        const SizedBox(height: 20),

        const ContactInfoTile(
          icon: Icons.location_on_outlined,
          title: "Location",
          value: "Tamil Nadu, India",
        ),
      ],
    );
  }
}
