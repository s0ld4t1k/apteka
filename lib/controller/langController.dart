// ignore_for_file: file_names

import 'package:apte/pages/profile/profile.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:get/state_manager.dart';

class LangCont extends GetxController{
  void change(s){
    curLN=s;
    hasap.add(1);
    hasap.removeLast();
    update();
  }
}