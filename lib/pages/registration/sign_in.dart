import 'package:apte/data/api/register.dart';
import 'package:apte/data/user_model.dart';
import 'package:apte/pages/registration/otp.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/name_field.dart';
import 'package:apte/widgets/password_field.dart';
import 'package:apte/widgets/tel_num_field.dart';
import 'package:apte/widgets/validate_pass_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String sid = '';

UserModel user = UserModel();
TextEditingController siName = TextEditingController();
TextEditingController siTel = TextEditingController();
TextEditingController siPass = TextEditingController();
TextEditingController siPass2 = TextEditingController();
RxString otp = ''.obs;

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                  locale[curLN]!['inputForAccount']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 40),
                NameField(name: siName),
                const SizedBox(height: 20),
                TelNumField(tel: siTel),
                const SizedBox(height: 20),
                ValidatePasswordField(
                    title: locale[curLN]!['password']!, pass: siPass),
                const SizedBox(height: 20),
                PasswordField(
                  title: locale[curLN]!['confirmPassword']!,
                  pass: siPass2,
                  text: false,
                ),
                const SizedBox(height: 30),
                Obx(() {
                  return ElevatedButton(
                    onPressed: passerr.value
                        ? null
                        : () async {
                            if (siPass.text == siPass2.text) {
                              user = UserModel(
                                name: siName.text,
                                phone: siTel.text,
                                password: siPass.text,
                              );
                              await sendSMS(user);
                              if (user.sid != null) {
                                Get.to(
                                  () => OTP(
                                      userr: user,
                                      ontap: () {
                                        register(user, int.parse(otp.value));
                                      }),
                                );
                              }
                            } else {
                              Get.snackbar(
                                locale[curLN]!['passwordError2']!,
                                locale[curLN]!['passwordError']!,
                              );
                            }
                          },
                    child: Text(locale[curLN]!['ulgamaGir']!),
                  );
                })
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locale[curLN]!['haveAccount?']!),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                locale[curLN]!['logAccount']!,
                style: const TextStyle(color: orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}
