import 'package:flutter/material.dart';

class Leading2 extends StatelessWidget {
  const Leading2({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/startBanner2.png'),
          SizedBox(height: 84,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('Dürli dermanlar, saglygyňyz üçin ýeňip bolmajak bahalar',style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}
