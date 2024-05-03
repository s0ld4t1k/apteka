import 'package:apte/pages/bag/addCard.dart';
import 'package:apte/widgets/bag&Card/newCard.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

import '../pages/kard/kard.dart';

class MyController extends GetxController {
  void setCardsValue(o) {
    o[1] = selectedCardType;
    o[0] = belgisi.text;
    o[2] = cvc.text;
    o[3] = eyesi.text;
    o[5] = year.text;
    o[4] = selectedMonth;
    Hive.box('box').put('cards', cards);
    // update();
  }

  void addCard() {
    cards.add([
      belgisi.text,
      selectedCardType,
      cvc.text,
      eyesi.text,
      selectedMonth,
      year.text,
    ]);
    selectedCardBank.value = cards.length - 1;
    Hive.box('box').put('cards', cards);
    // update();
  }

  void reset() {
    selectedCardType = -1;
    belgisi.text = '';
    cvc.text = '';
    eyesi.text = '';
    year.text = '';
    selectedMonth = 0;
    // update();
  }
}
