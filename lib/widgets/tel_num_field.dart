import 'package:flutter/material.dart';

import 'langDictionary.dart';

class TelNumField extends StatelessWidget {
  final TextEditingController tel;
  const TelNumField({super.key, required this.tel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${locale[curLN]?['tel']}'),
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
              const Text('+993 '),
              Expanded(
                child: TextField(
                  controller: tel,
                  scrollPadding: const EdgeInsets.all(0),
                  style: const TextStyle(fontSize: 14),
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  decoration: const InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
