import 'package:get/state_manager.dart';

class LangController extends GetxController{
  RxString curLang='tm'.obs;
  void changeLang(value){
    curLang=value;
  }
}