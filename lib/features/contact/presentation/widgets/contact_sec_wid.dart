import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowtham_portfolio/core/widgets/customTextField.dart';
import 'package:gowtham_portfolio/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:gowtham_portfolio/features/contact/presentation/bloc/contact_event.dart';
import 'package:gowtham_portfolio/features/contact/presentation/bloc/contact_state.dart';
import 'package:gowtham_portfolio/features/contact/presentation/widgets/contact_info_tile.dart';

class ContactSectionWidget extends StatefulWidget {
  const ContactSectionWidget({super.key});

  @override
  State<ContactSectionWidget> createState() => _ContactSectionWidgetState();
}

class _ContactSectionWidgetState extends State<ContactSectionWidget> {
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
          const Text(
            "CONTACT",
            style: TextStyle(
              color: Color(0xFF38BDF8),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Let's Work Together",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 60),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Left
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Get In Touch",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text(
                      "I'm always interested in discussing Mobile Application development, freelance projects and full-time opportunities.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.8,
                      ),
                    ),

                    SizedBox(height: 40),

                    ContactInfoTile(
                      icon: Icons.email_outlined,
                      title: "Email",
                      value: "mgowtham795@gmail.com",
                    ),

                    SizedBox(height: 20),

                    ContactInfoTile(
                      icon: Icons.phone_outlined,
                      title: "Phone",
                      value: "+91 9360747090",
                    ),

                    SizedBox(height: 20),

                    ContactInfoTile(
                      icon: Icons.location_on_outlined,
                      title: "Location",
                      value: "Tamil Nadu, India",
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              /// Right Form
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.04),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: nameController,
                        hint: "Your Name",
                      ),

                      const SizedBox(height: 20),

                      CustomTextField(
                        controller: emailController,
                        hint: "Email Address",
                      ),

                      const SizedBox(height: 20),

                      CustomTextField(
                        controller: mobilenumcontroller,
                        hint: "Phone Number",
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10), // Optional
                        ],
                      ),

                      const SizedBox(height: 20),

                      CustomTextField(
                        controller: subjectController,
                        hint: "Subject",
                      ),

                      const SizedBox(height: 20),

                      CustomTextField(
                        controller: messageController,
                        hint: "Message",
                        maxLines: 6,
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: BlocConsumer<ContactBloc, ContactState>(
                          listener: (context, state) {
                            if (state is ContactSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Thank you! Your message has been submitted successfully.',
                                  ),
                                ),
                              );
                              clearForm();
                            }

                            if (state is ContactFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                            }
                          },
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state is ContactLoading
                                  ? null
                                  : () {
                                      final name = nameController.text.trim();
                                      final email = emailController.text.trim();

                                      if (name.isEmpty) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Please enter your name',
                                            ),
                                          ),
                                        );
                                        return;
                                      }

                                      if (!emailRegex.hasMatch(email)) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Please enter a valid email',
                                            ),
                                          ),
                                        );
                                        return;
                                      }
                                      context.read<ContactBloc>().add(
                                        SendContactMessage(
                                          name: nameController.text,
                                          email: emailController.text,
                                          mobilenum: mobilenumcontroller.text,
                                          subject: subjectController.text,
                                          message: messageController.text,
                                        ),
                                      );
                                    },
                              child: state is ContactLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text('Send Message'),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    mobilenumcontroller.clear();
    subjectController.clear();
    messageController.clear();
  }
}

final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
