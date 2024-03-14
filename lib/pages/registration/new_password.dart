import 'package:apte/pages/registration/sign_in.dart';
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
                const Text(
                  'Täze açarsözi dörediň!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Açarsözi azyndan 8 simwoldan ybarat bolmalydyr.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(160, 160, 160, 1),
                  ),
                ),
                PasswordField(title: 'Täze açarsözi', pass: NPpass),
                const SizedBox(height: 20),
                PasswordField(title: 'Açarsözi tassyklaň', pass: NPpass2),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(double.infinity, 50))),
                  onPressed: () {},
                  child: const Text('Täzele'),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hasabyňyz ýokmy?'),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () => Get.to(() => const SignIn()),
              child: const Text(
                'Hasap açyň',
                style: TextStyle(color: orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}
