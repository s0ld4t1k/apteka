// ignore_for_file: file_names

import 'package:apte/data/api/register.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/otp_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChangePW extends StatefulWidget {
  const ChangePW({super.key});

  @override
  State<ChangePW> createState() => _ChangePWState();
}

class _ChangePWState extends State<ChangePW> {
  final TextEditingController _pw = TextEditingController();
  final TextEditingController _conPW = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            title: Text('${locale[curLN]?['changePassword']}'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 231,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${locale[curLN]?['newPassword']}'),
                      const SizedBox(height: 10),
                      PWField(con: _pw),
                      const SizedBox(height: 20),
                      Text('${locale[curLN]?['confirmPassword']}'),
                      const SizedBox(height: 10),
                      PWField(con: _conPW),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50))),
                  onPressed: () async {
                    if (_pw.text == _conPW.text) {
                      user.password = _pw.text;
                      resetPassword(user, int.parse(s.value));
                      Get.back();
                      Get.back();
                    }
                  },
                  child: Text(
                    '${locale[curLN]?['save']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class PWField extends StatefulWidget {
  TextEditingController con = TextEditingController();
  var eye = true;
  PWField({super.key, required this.con});
  @override
  State<PWField> createState() => _PWFieldState();
}

class _PWFieldState extends State<PWField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.only(left: 25, right: 15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(251, 251, 251, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: widget.con,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              obscureText: widget.eye,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                  // hintText: '********',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(193, 193, 193, 1),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          IconButton(
            splashRadius: 15,
            onPressed: () {
              setState(() {
                widget.eye = !widget.eye;
              });
            },
            icon: widget.eye
                ? SvgPicture.asset('assets/icons/eye-slash.svg')
                : SvgPicture.asset('assets/icons/eye.svg'),
          )
        ],
      ),
    );
  }
}
