import 'package:apte/widgets/colors.dart';
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
          Column(
            children: [
              Text('Sargydyňyz tiz wagtda eliňizde',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
                  style: TextStyle(
                    fontSize: 12,
                    color: textGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}