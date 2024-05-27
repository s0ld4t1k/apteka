import 'dart:developer';

import 'package:apte/data/api/register.dart';
import 'package:apte/data/model/user/controller.dart';
import 'package:apte/pages/profile/changePW.dart';
import 'package:apte/pages/registration/otp.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/otp_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User extends StatelessWidget {
  const User({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: UserController(),
        builder: (uc) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                    padding: const EdgeInsets.all(0),
                    constraints: const BoxConstraints(
                      maxHeight: 24,
                      maxWidth: 24,
                      minHeight: 24,
                      minWidth: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.chevron_left_rounded)),
                title: Text('${locale[curLN]?['infos']}'),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${locale[curLN]?['dolyAdynyz']}'),
                    const SizedBox(height: 10),
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(237, 237, 237, 1),
                        ),
                      ),
                      child: TextField(
                        readOnly: true,
                        controller: uc.nam,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('${locale[curLN]?['tel']}'),
                    const SizedBox(height: 10),
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        readOnly: true,
                        keyboardType: TextInputType.phone,
                        maxLength: 12,
                        controller: uc.tel,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('${locale[curLN]?['password']}'),
                    const SizedBox(height: 10),
                    Container(
                      height: 52,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    orange.withOpacity(0.1)),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(118, 20)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(0)),
                                alignment: Alignment.centerLeft),
                            onPressed: () async {
                              await sendSMS(user);
                              if (user.sid != null) {
                                Get.to(() => OTP(
                                      userr: user,
                                      ontap: () {
                                        log(s.value);
                                        Get.to(() => const ChangePW());
                                      },
                                    ));
                              }
                            },
                            child: Text(
                              '${locale[curLN]?['toChangePassword']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
