import 'package:flutter/material.dart';

import 'langDictionary.dart';

class NameField extends StatelessWidget {
  final TextEditingController name;
  const NameField({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          ),
          child: TextField(
            controller: name,
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
      ],
    );
  }
}
