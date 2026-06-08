import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gowtham_portfolio/core/responsive/responsive.dart';
import 'package:gowtham_portfolio/core/widgets/customTextField.dart';
import 'package:gowtham_portfolio/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:gowtham_portfolio/features/contact/presentation/bloc/contact_event.dart';
import 'package:gowtham_portfolio/features/contact/presentation/bloc/contact_state.dart';

class ContactForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;
  final TextEditingController subjectController;
  final TextEditingController messageController;

  const ContactForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.mobileController,
    required this.subjectController,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        Responsive.isMobile(context) ? 20 : 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.04),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white10,
        ),
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
            controller: mobileController,
            hint: "Phone Number",
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
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

                  nameController.clear();
                  emailController.clear();
                  mobileController.clear();
                  subjectController.clear();
                  messageController.clear();
                }

                if (state is ContactFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state is ContactLoading
                      ? null
                      : () {
                          final name =
                              nameController.text.trim();
                          final email =
                              emailController.text.trim();

                          if (name.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please enter your name',
                                ),
                              ),
                            );
                            return;
                          }

                          if (!emailRegex.hasMatch(email)) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
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
                                  name: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  mobilenum:
                                      mobileController.text.trim(),
                                  subject:
                                      subjectController.text.trim(),
                                  message:
                                      messageController.text.trim(),
                                ),
                              );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF38BDF8),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14),
                    ),
                  ),
                  child: state is ContactLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Send Message",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

 final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');