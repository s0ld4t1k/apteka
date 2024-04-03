import 'package:apte/pages/kard/kard.dart';
import 'package:apte/widgets/bag&Card/newCard.dart';
// import 'package:apte/widgets/langDictionary.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

class MyController extends GetxController {
  @override
  void onInit() {
    cards.value = (Hive.box('box').get('cards') != null)
        ? Hive.box('box').get('cards')
        : [];
    super.onInit();
  }

  void setCardTypeValue(o) {
    selectedCardType = o;
    update();
  }

  void setCardListeValue(o) {
    selectedCardType = o[1];
    belgisi.text = o[0];
    cvc.text = o[2];
    eyesi.text = o[3];
    year.text = o[5];
    selectedMonth = o[4];
  }

  void setCardsValue(o) {
    o[1] = selectedCardType;
    o[0] = belgisi.text;
    o[2] = cvc.text;
    o[3] = eyesi.text;
    o[5] = year.text;
    o[4] = selectedMonth;
    Hive.box('box').put('cards', cards);
    update();
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
    Hive.box('box').put('cards', cards);
    update();
  }

  void reset() {
    selectedCardType = -1;
    belgisi.text = '';
    cvc.text = '';
    eyesi.text = '';
    year.text = '';
    selectedMonth = 0;
    update();
  }
}
