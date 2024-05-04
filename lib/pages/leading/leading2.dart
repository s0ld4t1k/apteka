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
          // const SizedBox(height: 84,),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'Dürli dermanlar, saglygyňyz üçin ýeňip bolmajak bahalar!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
