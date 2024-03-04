// ignore_for_file: file_names

import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';

class StatusCon extends StatelessWidget {
  final String text,errText;
  const StatusCon({super.key, required this.text,this.errText='Goýbolsun edildi'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: (text=='Kabul edildi')?green.withOpacity(0.1):
        (text==errText)?red.withOpacity(0.1):yellow.withOpacity(0.1),
      ),
      child: Text(text,style: TextStyle(
        color: (text=='Kabul edildi')?green:
        (text==errText)?red:yellow,
      ),),
    );
  }
}