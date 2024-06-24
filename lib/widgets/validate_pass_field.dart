import 'package:apte/pages/registration/registration.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';

import 'langDictionary.dart';

RxBool passerr = false.obs;

class ValidatePasswordField extends StatelessWidget {
  final String title;
  final TextEditingController pass;
  const ValidatePasswordField(
      {super.key, required this.title, required this.pass});

  @override
  Widget build(BuildContext context) {
    RxBool obsec = true.obs;
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(250, 250, 250, 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    onChanged: (value) {
                      if (!value.contains(RegExp(r'[A-Z]')) ||
                          !value.contains(RegExp(r'[0-9]')) ||
                          !value.contains(RegExp(r'[a-z]')) ||
                          value.length < 8) {
                        passerr.value = true;
                      } else {
                        passerr.value = false;
                      }
                      user.password = pass.text;
                    },
                    onSubmitted: (value) => logg(),
                    obscureText: obsec.value,
                    controller: pass,
                    scrollPadding: const EdgeInsets.all(0),
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(
                    maxHeight: 30,
                    maxWidth: 30,
                    minHeight: 30,
                    minWidth: 30,
                  ),
                  onPressed: () => obsec.value = !obsec.value,
                  icon: SvgPicture.asset(
                    obsec.value
                        ? 'assets/icons/eye-slash.svg'
                        : 'assets/icons/eye.svg',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            locale[curLN]?['passText'] ?? '',
            style: TextStyle(color: passerr.value ? Colors.red : Colors.grey),
          )
        ],
      );
    });
  }
}
