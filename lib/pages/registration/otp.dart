import 'package:apte/data/api/register.dart';
import 'package:apte/data/user_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/colors.dart';

TextEditingController otp = TextEditingController();

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
                const Text(
                  'OTP kody',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Telefon belgiňize iberilen tassyklama kody giriziň.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(160, 160, 160, 1),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(250, 250, 250, 1),
                  ),
                  child: TextField(
                    controller: otp,
                    decoration: const InputDecoration(
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50))),
                  onPressed: () {
                    register(userr, int.tryParse(otp.text));
                  },
                  child: const Text('Dowam et'),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Kod gelmedimi?'),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Täzeden iber',
                style: TextStyle(color: orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}
