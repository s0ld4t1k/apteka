import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
List _harmfulList=[
  'assets/images/harmfulBanner1.png',
  'assets/images/harmfulBanner1.png',
  'assets/images/harmfulBanner1.png',
];
class MainHarmful extends StatelessWidget {
  const MainHarmful({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25,right: 15,top: 10),
          child: Row(
            children: [
              Text('Peýdaly maglumatlar',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
              Spacer(),
              TextButton(
                onPressed: () {
                  
                },
                child: Text('Ählisini gör',style: TextStyle(
                  color: green,
                  fontSize: 12,
                ),),
              ),
            ],
          ),
        ),
        Container(
          height: 125,
          child: ListView(
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 25,),
              Row(
                children: List.generate(_harmfulList.length, (index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/mainPage/harmfulInfo');
                  },
                  child: Container(
                    width: 243,
                    height: 121,
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(_harmfulList[index],fit: BoxFit.fill,),
                  ),
                )),
              )
            ]
          ),
        )
      ],
    );
  }
}