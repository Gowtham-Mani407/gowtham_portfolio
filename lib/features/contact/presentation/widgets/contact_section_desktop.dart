import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/features/contact/presentation/widgets/common_infosection.dart';
import 'package:gowtham_portfolio/features/contact/presentation/widgets/contact_form.dart';
import 'package:gowtham_portfolio/features/contact/presentation/widgets/contact_header.dart';

class ContactSectionDesktop extends StatefulWidget {
  const ContactSectionDesktop({super.key});

  @override
  State<ContactSectionDesktop> createState() => _ContactSectionDesktopState();
}

class _ContactSectionDesktopState extends State<ContactSectionDesktop> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobilenumcontroller = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      color: const Color(0xFF111827),
      child: Column(
        children: [
          const ContactHeader(),

          const SizedBox(height: 60),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: ContactInfoSection()),

              const SizedBox(width: 60),

              Expanded(
                flex: 2,
                child: ContactForm(
                  nameController: nameController,
                  emailController: emailController,
                  mobileController: mobilenumcontroller,
                  subjectController: subjectController,
                  messageController: messageController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
