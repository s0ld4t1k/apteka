import 'package:apte/data/api/register.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/registration/reset_password.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/password_field.dart';
import 'package:apte/widgets/tel_num_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController tel = TextEditingController();
TextEditingController pass = TextEditingController();

class Registration extends StatelessWidget {
  const Registration({super.key});

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
                  'Ulgama girmek üçin maglumatlaryňyzy giriziň!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 40),
                TelNumField(tel: tel),
                const SizedBox(height: 20),
                PasswordField(
                  title: 'Açarsözi',
                  pass: pass,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              orange.withOpacity(0.1))),
                      onPressed: () => Get.to(() => const ResetPassword()),
                      child: const Text(
                        'Açar sözi unutdym',
                        style: TextStyle(color: orange),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50))),
                  onPressed: () async {
                    user.phone = tel.text;
                    user.password = pass.text;
                    int sc = await logIN(user);
                    if (sc == 200) {
                      Get.offAll(() => const MainPage());
                    } else {
                      Get.snackbar(
                        'Log In Error',
                        'Incorrect password',
                        backgroundColor: red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: const Text('Ulgama gir'),
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
              child: const Text('Hasap açyň'),
            )
          ],
        ),
      ),
    );
  }
}
