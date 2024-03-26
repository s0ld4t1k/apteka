// ignore_for_file: file_names

import 'package:apte/controller/my_controller.dart';
import 'package:apte/pages/kard/kard.dart';
import 'package:apte/widgets/bag&Card/newCard.dart';
import 'package:apte/widgets/bag&Card/showCardType.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxInt selectedCardBank = (-1).obs;

class AddCard extends StatefulWidget {
  final MyController mc;
  const AddCard({super.key, required this.mc});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Wrap(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    '${locale[curLN]?['bankKartynyz']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(height: 23),
              SizedBox(
                height: 170,
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: List.generate(
                          cards.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCardBank.value = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 12),
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: selectedCardBank.value == index
                                        ? green
                                        : const Color.fromRGBO(
                                            237, 237, 237, 1),
                                  )),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 45,
                                      height: 45,
                                      child: Image.asset(
                                          cardImages[cards[index][1]])),
                                  const SizedBox(
                                    width: 27,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cardsType[cards[index][1]],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          cards[index][0],
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  131, 131, 131, 1)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: selectedCardBank.value == index
                                              ? green
                                              : const Color.fromRGBO(
                                                  216, 216, 216, 1),
                                          width: selectedCardBank.value == index
                                              ? 4
                                              : 2,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 108,
                height: 18,
                child: TextButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0))),
                  onPressed: () => Get.to(() => NewCard()),
                  child: Text(
                    '+ ${locale[curLN]?['addNewCard']}',
                    style: const TextStyle(
                      color: orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '${locale[curLN]?['useThisCard']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  )),
              const SizedBox(
                height: 37,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
