// ignore_for_file: file_names

import 'package:apte/controller/my_controller.dart';
import 'package:apte/pages/kard/kard.dart';
import 'package:apte/widgets/bag&Card/showCardType.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

int selectedMonth = 0;
int selectedCardType = -1;
List month = [
  'Ýanwar',
  'Fewral',
  'Mart',
  'Aprel',
  'Maý',
  'Iýun',
  'Iýul',
  'Awgust',
  'Sentýabr',
  'Oktýabr',
  'Noýabr',
  'Dekabr'
];

TextEditingController belgisi = TextEditingController();
TextEditingController cvc = TextEditingController();
TextEditingController eyesi = TextEditingController();
TextEditingController year = TextEditingController();

class NewCard extends StatefulWidget {
  final int index;
  const NewCard({super.key, required this.index});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  void initState() {
    if (widget.index > -1) {
      List o = cards[widget.index];
      selectedCardType = o[1];
      belgisi.text = o[0];
      cvc.text = o[2];
      eyesi.text = o[3];
      year.text = o[5];
      selectedMonth = o[4];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      init: MyController(),
      builder: (mc) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                  padding: const EdgeInsets.all(0),
                  constraints: const BoxConstraints(
                    maxHeight: 24,
                    maxWidth: 24,
                    minHeight: 24,
                    minWidth: 24,
                  ),
                  onPressed: () {
                    Get.back();
                    mc.reset();
                  },
                  icon: const Icon(Icons.chevron_left_rounded)),
              title: Text('${locale[curLN]?['cardInfos']}'),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${locale[curLN]?['cardID']}'),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 251, 251, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromRGBO(237, 237, 237, 1),
                      ),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        String s = belgisi.text;
                        if (s.length < 16 + 3 &&
                            s.length > 4 &&
                            s[s.length - (1 + 1)] != ' ' &&
                            s[s.length - (2 + 1)] != ' ' &&
                            s[s.length - (3 + 1)] != ' ' &&
                            s[s.length - (4 + 1)] != ' ' &&
                            s[s.length - 1] != ' ') {
                          // s += ' ';
                          s = s.replaceRange(
                              s.length - 1, s.length, ' ${s[s.length - 1]}');
                        }
                        belgisi.text = s;
                      },
                      controller: belgisi,
                      maxLength: 16 + 3,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          counterText: '',
                          hintText: '0000 0000 0000 0000',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(193, 193, 193, 1),
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('${locale[curLN]?['dateLimit']}'),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(251, 251, 251, 1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromRGBO(237, 237, 237, 1)),
                          ),
                          child: DropdownMenu(
                            initialSelection:
                                selectedMonth >= 0 ? selectedMonth : 0,
                            expandedInsets:
                                const EdgeInsets.symmetric(vertical: 25),
                            inputDecorationTheme: const InputDecorationTheme(
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(193, 193, 193, 1),
                                ),
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                            hintText: locale[curLN]!['month'],
                            trailingIcon: const Icon(
                              CupertinoIcons.chevron_down,
                              size: 20,
                            ),
                            onSelected: (value) => selectedMonth = value!,
                            dropdownMenuEntries: List.generate(
                                month.length,
                                (index) => DropdownMenuEntry(
                                    value: index, label: month[index])),
                          ),
                        ),
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(251, 251, 251, 1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color.fromRGBO(237, 237, 237, 1),
                                ),
                              ),
                              child: TextField(
                                controller: year,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  hintText: '${locale[curLN]?['year']}',
                                  hintStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(193, 193, 193, 1),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('${locale[curLN]?['cvc']}'),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 251, 251, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromRGBO(237, 237, 237, 1)),
                    ),
                    child: TextField(
                      controller: cvc,
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          counterText: '',
                          hintText: '***',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(193, 193, 193, 1),
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('${locale[curLN]?['cardHolder']}'),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 251, 251, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromRGBO(237, 237, 237, 1)),
                    ),
                    child: TextField(
                      controller: eyesi,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          counterText: '',
                          hintText: '${locale[curLN]?['cardHolder']}',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(193, 193, 193, 1),
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('${locale[curLN]?['cardBankType']}'),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      showDragHandle: true,
                      useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const ShowCardType();
                      },
                    ),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(251, 251, 251, 1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromRGBO(237, 237, 237, 1)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                selectedCardType >= 0
                                    ? cardsType[selectedCardType]
                                    : '${locale[curLN]?['chooseBank']}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: selectedCardType >= 0
                                        ? Colors.black
                                        : const Color.fromRGBO(
                                            193, 193, 193, 1)),
                              ),
                            ),
                            const Icon(CupertinoIcons.chevron_down, size: 16),
                          ],
                        )),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(
                        const Size(double.infinity, 50),
                      ),
                    ),
                    onPressed: () {
                      if (belgisi.text != '' &&
                          cvc.text != '' &&
                          eyesi.text != '' &&
                          year.text != '' &&
                          selectedCardType >= 0 &&
                          selectedMonth >= 0) {
                        if (widget.index == -1) {
                          mc.addCard();
                        } else {
                          mc.setCardsValue(cards[widget.index]);
                        }
                        Get.back();
                      } else {
                        Get.snackbar(
                          'Maglumatlary dolduryň',
                          'Ähli meýdanlar hökmany',
                          backgroundColor: red,
                          colorText: Colors.white,
                          dismissDirection: DismissDirection.horizontal,
                        );
                      }
                      mc.reset();
                      mc.update();
                    },
                    child: Text(
                      '${locale[curLN]?['save']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
