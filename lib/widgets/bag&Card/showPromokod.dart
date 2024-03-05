// ignore_for_file: file_names

import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
RxString promokodText=''.obs;
var pro=TextEditingController();
RxString errorPromokod=''.obs;
class ShowPromokod extends StatelessWidget {
  const ShowPromokod({super.key});

  @override
  Widget build(BuildContext context) {
    pro.text=promokodText.value;
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).
        viewInsets.bottom),
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${locale[curLN]?["promokod"]}',style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),
            const SizedBox(height: 21,),
            SizedBox(
              height: 49,
              child: TextField(
                controller: pro,
                onChanged: (value) {
                  if(value!='' && value!='Hren')errorPromokod.value=locale[curLN]!['errorPromokod']!;
                  promokodText.value=value;
                  if(value=='' || value=='Hren')errorPromokod('');
                },
                expands: true,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  labelText: '${locale[curLN]?["promokod"]}', 
                  labelStyle: const TextStyle(
                    color: green,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: green
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: green
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Obx(
              () {
                return Text(errorPromokod.value,style: const TextStyle(
                  color: red,
                ),);
              }
            ),
            const SizedBox(height: 11,),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(double.infinity, 46)),
                backgroundColor: MaterialStateProperty.all(
                  green.withOpacity(0.7)
                ),
              ),
              onPressed: () {
                Get.back();
              }, 
              child: Text('${locale[curLN]?["input"]}',style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}