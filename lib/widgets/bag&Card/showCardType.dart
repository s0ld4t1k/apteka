// ignore_for_file: file_names

import 'package:apte/widgets/bag&Card/newCard.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List cardsType = [
  'Rysgal bank',
  'Halk bank',
  'Senagat bank',
  'Dayhan',
  'Türkmenbaşy bank',
];

class ShowCardType extends StatefulWidget {
  const ShowCardType({super.key});

  @override
  State<ShowCardType> createState() => _ShowCardTypeState();
}

class _ShowCardTypeState extends State<ShowCardType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      // height: 321,
      child: Wrap(
        children: [
          Row(
            children: [
              Text(
                '${locale[curLN]?['banks']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          const SizedBox(height: 33 - 18),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  selectedCardType = index;
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Row(
                    children: [
                      Text(
                        cardsType[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selectedCardType == index
                                ? green
                                : const Color.fromRGBO(216, 216, 216, 1),
                            width: selectedCardType == index ? 4 : 2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 1,
                color: const Color.fromRGBO(237, 237, 237, 1),
              );
            },
            itemCount: cardsType.length,
          ),
          const SizedBox(height: 325)
        ],
      ),
    );
  }
}
