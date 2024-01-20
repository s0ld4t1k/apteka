import 'package:flutter/material.dart';

class Leading3 extends StatelessWidget {
  const Leading3({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/startBanner3.png'),
          SizedBox(height: 84,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('Tiz wagtda eltip bermek hyzmaty saglygyňyzy ýyldyrym çaltlygynda üpjün edýär',style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}
