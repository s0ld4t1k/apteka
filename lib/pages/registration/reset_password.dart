import 'package:apte/pages/registration/registration.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/tel_num_field.dart';

TextEditingController RStel = TextEditingController();

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
                  'Açarsözi unutdyňyzmy?',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Alada etmäň! Hasabyňyz bilen baglanyşykly telefon belgini giriziň.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(160, 160, 160, 1),
                  ),
                ),
                const SizedBox(height: 40),
                TelNumField(tel: RStel),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(double.infinity, 50))),
                  onPressed: () {},
                  child: const Text('Dowam et'),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Açasözi bilýaňizmi?'),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () => Get.to(() => const Registration()),
              child: const Text(
                'Hasaba girmek',
                style: TextStyle(color: orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}
