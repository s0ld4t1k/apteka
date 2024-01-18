import 'package:apte/pages/leading/lang.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
var _selectebLang=0;
class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: EdgeInsets.all(0),
          constraints: BoxConstraints(
            maxHeight: 24,
            maxWidth: 24,
            minHeight: 24,
            minWidth: 24,
          ),
          onPressed: ()=>Navigator.pop(context), 
          icon: Icon(Icons.chevron_left_rounded)
        ),
        title: Text('Dil üýtgetmek'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: List.generate(langList.length, (index) => GestureDetector(
            onTap: () {
              setState(() {
                _selectebLang=index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 7),
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
                  SizedBox(width: 22,),
                  Expanded(
                    child: Text(langList[index][1],style: TextStyle(
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
      ),
    );
  }
}