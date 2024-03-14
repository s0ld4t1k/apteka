import 'package:apte/data/api/register.dart';
import 'package:apte/data/user_model.dart';
import 'package:apte/widgets/otp_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/colors.dart';
import '../../widgets/langDictionary.dart';

class OTP extends StatelessWidget {
  final UserModel userr;
  const OTP({super.key, required this.userr});

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
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  locale[curLN]!['inputOtp']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(160, 160, 160, 1),
                  ),
                ),
                const SizedBox(height: 40),
                const OtpField(),
                const SizedBox(height: 30),
                Obx(() {
                  return ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50))),
                    onPressed: s.value.length == 6
                        ? () {
                            // print('object ${int.tryParse(s.value)}');
                            register(userr, int.tryParse(s.value));
                          }
                        : null,
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
              onPressed: () {},
              child: Text(
                locale[curLN]!['resend']!,
                style: TextStyle(color: orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}
