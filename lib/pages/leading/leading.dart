import 'package:apte/pages/leading/lang.dart';
import 'package:apte/pages/leading/leading1.dart';
import 'package:apte/pages/leading/leading2.dart';
import 'package:apte/pages/leading/leading3.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
var _index=0;
List leadingList=[
  const Leading1(),
  const Leading2(),
  const Leading3(),
  const Lang(),
];
class Leading extends StatefulWidget {
  const Leading({super.key});

  @override
  State<Leading> createState() => _LeadingState();
}

class _LeadingState extends State<Leading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            leadingList[_index],
            SizedBox(
              height: 50+34+25,
              child: GestureDetector(
                onTap: ()async{
                  setState(() {});
                  if(_index<3) {
                    _index++;
                  } else{
                    Get.offAll(()=>const MainPage());
                    await const FlutterSecureStorage().write(key: 'lang', value: curLN);
                  }
                },
                child: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: orange,
                    ),
                    child: const Icon(Icons.arrow_forward_rounded,color: Colors.white,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}