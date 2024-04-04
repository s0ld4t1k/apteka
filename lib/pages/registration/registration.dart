import 'package:apte/data/api/register.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/registration/reset_password.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/password_field.dart';
import 'package:apte/widgets/tel_num_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController tel = TextEditingController();
TextEditingController pass = TextEditingController();
void logg() async {
  int sc = await logIN(user);
  if (sc == 200) {
    Get.offAll(() => const MainPage());
  } else {
    Get.snackbar(
      locale[curLN]!['loginError']!,
      locale[curLN]!['incorrectPassword']!,
      backgroundColor: red,
      colorText: Colors.white,
    );
  }
}

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
                Text(
                  locale[curLN]!['login']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 40),
                TelNumField(tel: tel),
                const SizedBox(height: 20),
                PasswordField(
                  title: locale[curLN]!['password']!,
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
                      child: Text(
                        locale[curLN]!['forgetPassword']!,
                        style: const TextStyle(color: orange),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50))),
                  onPressed: () => logg(),
                  child: Text(locale[curLN]!['ulgamaGir']!),
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
              child: Text(locale[curLN]!['createAccount']!),
            )
          ],
        ),
      ),
    );
  }
}
