import 'package:apte/pages/registration/sign_in.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/colors.dart';
import '../../widgets/password_field.dart';

TextEditingController NPpass = TextEditingController();
TextEditingController NPpass2 = TextEditingController();

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 45),
                Text(
                  locale[curLN]!['newPasswordText1']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  locale[curLN]!['newPasswordText2']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(160, 160, 160, 1),
                  ),
                ),
                const SizedBox(height: 40),
                PasswordField(
                    title: locale[curLN]!['newPassword']!, pass: NPpass),
                const SizedBox(height: 20),
                PasswordField(
                    title: locale[curLN]!['confirmPassword']!, pass: NPpass2),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50))),
                  onPressed: () {},
                  child: Text(locale[curLN]!['new']!),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locale[curLN]!['noAccount']!),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () => Get.to(() => const SignIn()),
              child: Text(
                locale[curLN]!['createAccount']!,
                style: const TextStyle(color: orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}
