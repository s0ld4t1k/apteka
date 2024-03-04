// ignore_for_file: file_names

import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
var curEltme=0;

class EltmeCon extends StatelessWidget {
  final String text1,text2;
  final int index;
  const EltmeCon({super.key, required this.text1, required this.text2, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      decoration: BoxDecoration(
        color: index==curEltme
        ?green.withOpacity(0.1):null,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: index==curEltme
          ?green:const Color.fromRGBO(242, 242, 242, 1),
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1,style: const TextStyle(
                  color: Color.fromRGBO(107, 107, 107, 1),
                ),),
                Text(text2,style: const TextStyle(
                  color: green,
                  fontSize: 12,
                ),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: index==curEltme?4:1,
                    color: index==curEltme
                    ?green:const Color.fromRGBO(242, 242, 242, 1),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}