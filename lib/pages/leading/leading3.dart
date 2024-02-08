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
          const SizedBox(height: 84,),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text('Saglygyňyz üçin tiz wagtda eltip bermek hyzmaty!',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}
