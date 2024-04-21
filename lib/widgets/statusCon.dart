// ignore_for_file: file_names, must_be_immutable

import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';

List statuses = ['', '', '', '', '', ''];

class StatusCon extends StatelessWidget {
  final int text;
  String errText;
  StatusCon({super.key, required this.text, this.errText = ''});

  @override
  Widget build(BuildContext context) {
    statuses[1] = locale[curLN]?['waiting'];
    statuses[2] = locale[curLN]?['waiting'];
    statuses[3] = locale[curLN]?['waiting'];
    statuses[4] = locale[curLN]?['accepted'];
    statuses[5] = locale[curLN]?['declined'];
    errText = locale[curLN]?['waiting'] ?? '';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: (text == 4)
            ? green.withOpacity(0.1)
            : (text == 5)
                ? red.withOpacity(0.1)
                : yellow.withOpacity(0.1),
      ),
      child: Text(
        statuses[text],
        style: TextStyle(
          color: (text == 4)
              ? green
              : (text == 5)
                  ? red
                  : yellow,
        ),
      ),
    );
  }
}
