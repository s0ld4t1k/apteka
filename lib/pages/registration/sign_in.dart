import 'package:apte/data/api/register.dart';
import 'package:apte/data/user_model.dart';
import 'package:apte/pages/registration/otp.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/name_field.dart';
import 'package:apte/widgets/password_field.dart';
import 'package:apte/widgets/tel_num_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String sid = '';
UserModel user = UserModel();
TextEditingController SIname = TextEditingController();
TextEditingController SItel = TextEditingController();
TextEditingController SIpass = TextEditingController();
TextEditingController SIpass2 = TextEditingController();

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
                const Text(
                  'Hasap açmak üçin maglumatlaryňyzy giriziň!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 40),
                NameField(name: SIname),
                const SizedBox(height: 20),
                TelNumField(tel: SItel),
                const SizedBox(height: 20),
                PasswordField(title: 'Açarsözi', pass: SIpass),
                const SizedBox(height: 20),
                PasswordField(title: 'Açarsözi tassyklamak', pass: SIpass2),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50))),
                  onPressed: () {
                    if (SIpass.text == SIpass2.text) {
                      user = UserModel(
                        name: SIname.text,
                        phone: SItel.text,
                        password: SIpass.text,
                      );
                      sendSMS(user);
                      Get.to(() => OTP(userr: user));
                    } else {
                      Get.snackbar(
                        'Acarsozde yalnysh',
                        'Acarsozi dogry tassykla',
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
            const Text('Hasabyňyz barmy?'),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () => Get.back(),
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
