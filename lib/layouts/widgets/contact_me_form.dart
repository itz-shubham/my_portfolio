import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../src/colors.dart';
import '../../utils/get_screen_type.dart';
import '../../utils/show_alert.dart';
import 'my_textfield.dart';

class ContactMeForm extends StatefulWidget {
  const ContactMeForm({super.key, required this.screenType});

  final ScreenType screenType;

  @override
  State<ContactMeForm> createState() => _ContactMeFormState();
}

class _ContactMeFormState extends State<ContactMeForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _subjectTextController = TextEditingController();
  final _messageTextController = TextEditingController();

  bool sending = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        widget.screenType == ScreenType.desktop ? 48 : 32,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              "Contact Me",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            MyTextField(
              controller: _emailTextController,
              label: "Email",
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter an valid email";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            MyTextField(
              controller: _subjectTextController,
              label: "Subject",
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 10) {
                  return "Enter a valid subject";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            MyTextField(
              controller: _messageTextController,
              label: "Message",
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 20) {
                  return "Atleast enter a meaningful message";
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            sending
                ? const SizedBox.square(
                    dimension: 32,
                    child: CircularProgressIndicator(strokeWidth: 3),
                  )
                : ElevatedButton.icon(
                    onPressed: sendMessage,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                    ),
                    label: Image.asset(
                      'assets/images/send-message.png',
                      height: 16,
                    ),
                    icon: const Text("Send Message"),
                  ),
          ],
        ),
      ),
    );
  }

  sendMessage() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => sending = true);
      try {
        await FirebaseFirestore.instance.collection('messages').add({
          "email": _emailTextController.text,
          "subject": _subjectTextController.text,
          "message": _messageTextController.text,
          "date": FieldValue.serverTimestamp(),
        });
        showSuccessAlert("Message Sent Successfully!");
        _emailTextController.clear();
        _subjectTextController.clear();
        _messageTextController.clear();
      } catch (e) {
        showErrorAlert(e.toString());
      }
    }
    setState(() => sending = false);
  }
}
