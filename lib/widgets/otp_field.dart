import 'package:flutter/material.dart';
import 'package:get/get.dart';

FocusNode fc0 = FocusNode();
FocusNode fc1 = FocusNode();
FocusNode fc2 = FocusNode();
FocusNode fc3 = FocusNode();
FocusNode fc4 = FocusNode();
FocusNode fc5 = FocusNode();
RxString s = ''.obs;

class OtpField extends StatelessWidget {
  const OtpField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(fc0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(30, 35, 44, 1)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: 50,
            alignment: Alignment.center,
            height: 45,
            child: TextField(
              focusNode: fc0,
              maxLength: 1,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                if (value != '') {
                  s.value += value;
                  FocusScope.of(context).requestFocus(fc1);
                }
              },
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(fc1),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(30, 35, 44, 1)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: 50,
            alignment: Alignment.center,
            height: 45,
            child: TextField(
              focusNode: fc1,
              maxLength: 1,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                if (value != '') {
                  s.value += value;
                  FocusScope.of(context).requestFocus(fc2);
                }
              },
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(fc2),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(30, 35, 44, 1)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: 50,
            alignment: Alignment.center,
            height: 45,
            child: TextField(
              focusNode: fc2,
              maxLength: 1,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                if (value != '') {
                  s.value += value;
                  FocusScope.of(context).requestFocus(fc3);
                }
              },
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(fc3),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(30, 35, 44, 1)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: 50,
            alignment: Alignment.center,
            height: 45,
            child: TextField(
              focusNode: fc3,
              maxLength: 1,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                if (value != '') {
                  s.value += value;
                  FocusScope.of(context).requestFocus(fc4);
                }
              },
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(fc4),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(30, 35, 44, 1)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: 50,
            alignment: Alignment.center,
            height: 45,
            child: TextField(
              focusNode: fc4,
              maxLength: 1,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                if (value != '') {
                  s.value += value;
                  FocusScope.of(context).requestFocus(fc5);
                }
              },
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(fc5),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(30, 35, 44, 1)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: 50,
            alignment: Alignment.center,
            height: 45,
            child: TextField(
              focusNode: fc5,
              maxLength: 1,
              textInputAction: TextInputAction.done,
              onChanged: (value) {
                s.value += value;
                FocusScope.of(context).requestFocus(FocusNode());
              },
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
