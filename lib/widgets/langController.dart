import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class LangCont extends GetxController{
  RxString curlang='tm'.obs;
  void change(){
    curlang='ru'.obs;
    update();
  }
}