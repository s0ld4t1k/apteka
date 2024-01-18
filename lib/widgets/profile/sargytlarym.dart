import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Sargytlarym extends StatelessWidget {
  const Sargytlarym({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/profile/sargytlarym.svg'),
              SizedBox(width: 20,),
              Text('Sargytlarym'),
              Spacer(),
              Icon(Icons.chevron_right_rounded,color: Color.fromRGBO(173, 173, 173, 1),)
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Color.fromRGBO(237, 237, 237, 1),
        ),
      ],
    );
  }
}