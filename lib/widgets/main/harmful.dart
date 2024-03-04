import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';

List _harmfulList=[
  'assets/images/harmfulBanner2.png',
  'assets/images/harmfulBanner2.png',
  'assets/images/harmfulBanner2.png',
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
              Text('${locale[curLN]?["harmfullInfos"]}',style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
              const Spacer(),
              TextButton(
                onPressed: () {
                  
                },
                child: Text('${locale[curLN]?["seeAll"]}',style: const TextStyle(
                  color: green,
                  fontSize: 14,
                ),),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView(
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 25,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(_harmfulList.length, (index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/mainPage/harmfulInfo');
                  },
                  child: Container(
                    width: 263,
                    height: 135,
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(right: 12),
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