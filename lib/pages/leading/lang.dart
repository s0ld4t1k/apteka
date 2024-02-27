import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
var _selectebLang=0;
List langList=[
  ['tm','Türkmen dili',],
  ['ru','Русский',],
  ['en','English',],
];
class Lang extends StatefulWidget {
  const Lang({super.key});

  @override
  State<Lang> createState() => _LangState();
}

class _LangState extends State<Lang> {
  final LangCont lc=Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Programmanyň dilini saýlaň.',style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),),
          const SizedBox(height: 12,),
          const Text('Programmanyň dilini islendik wagt sazlamalarda üýtgedip bilersiňiz.',style: TextStyle(
            fontSize: 13,
            color: textGrey2,
          ),),
          const SizedBox(height: 45-14,),
          Column(
            children: List.generate(langList.length, (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectebLang=index;
                });
                if(_selectebLang==0)lc.change('tm');
                if(_selectebLang==1)lc.change('ru');
                if(_selectebLang==2)lc.change('en');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(vertical: 7),
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: (_selectebLang==index)?green:conGrey)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      child: Image.asset('assets/images/${langList[index][0]}.png'),
                    ),
                    const SizedBox(width: 22,),
                    Expanded(
                      child: Text(langList[index][1],style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                    (_selectebLang==index)?SvgPicture.asset('assets/icons/done.svg')
                    :Container(),
                  ],
                ),
              ),
            ),),
          ),
        ],
      ),
    );
  }
}