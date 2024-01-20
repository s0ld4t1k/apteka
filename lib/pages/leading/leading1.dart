import 'package:flutter/material.dart';

class Leading1 extends StatelessWidget {
  const Leading1({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/startBanner1.png'),
          SizedBox(height: 84,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('Diňe bir gezek basmak bilen sagdyn geljegiň rahatlygyndan lezzet alyň',style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}