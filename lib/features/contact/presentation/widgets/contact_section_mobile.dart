import 'package:flutter/material.dart';
import 'package:gowtham_portfolio/features/contact/presentation/widgets/common_infosection.dart';
import 'package:gowtham_portfolio/features/contact/presentation/widgets/contact_form.dart';
import 'package:gowtham_portfolio/features/contact/presentation/widgets/contact_header.dart';

class ContactSectionMobile extends StatefulWidget {
  const ContactSectionMobile({super.key});

  @override
  State<ContactSectionMobile> createState() =>
      _ContactSectionMobileState();
}

class _ContactSectionMobileState
    extends State<ContactSectionMobile> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobilenumcontroller = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),
      color: const Color(0xFF111827),
      child: Column(
        children: [
          const ContactHeader(),

          const SizedBox(height: 40),

          const ContactInfoSection(),

          const SizedBox(height: 30),

          ContactForm(
            nameController: nameController,
            emailController: emailController,
            mobileController: mobilenumcontroller,
            subjectController: subjectController,
            messageController: messageController,
          ),
        ],
      ),
    );
  }
}