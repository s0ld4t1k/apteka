import 'package:apte/data/api/register.dart';
import 'package:apte/data/user_model.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/colors.dart';
import '../../widgets/langDictionary.dart';

class OTP extends StatelessWidget {
  final UserModel userr;
  final dynamic ontap;
  const OTP({super.key, required this.userr, required this.ontap});

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
                  locale[curLN]!['otp']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  locale[curLN]!['inputOtp']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(160, 160, 160, 1),
                  ),
                ),
                const SizedBox(height: 40),
                Pinput(
                  length: 6,
                  onChanged: (value) => otp.value = value,
                  // onCompleted: (value) => ontap,
                  onCompleted: (value) {
                    print(value);
                    ontap();
                  },
                ),
                const SizedBox(height: 30),
                Obx(() {
                  return ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(
                          const Size(double.infinity, 50)),
                    ),
                    onPressed: otp.value.length == 6 ? ontap : null,
                    child: Text(locale[curLN]!['continue']!),
                  );
                })
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locale[curLN]!['noCode']!),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () => sendSMS(user),
              child: Text(
                locale[curLN]!['resend']!,
                style: const TextStyle(color: orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}
