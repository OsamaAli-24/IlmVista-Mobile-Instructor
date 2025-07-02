
import 'package:flutter/material.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Contact Us',
      ),
    );
  }
}
