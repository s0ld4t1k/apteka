// ignore_for_file: file_names

import 'package:apte/data/model/address/controller.dart';
import 'package:apte/pages/bag/bankKarty.dart';
import 'package:apte/pages/bag/nagt.dart';
import 'package:apte/pages/bag/terminal.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxInt selectedAdres = (-1).obs;
RxString selectedAdresStr = ''.obs;

class AddAdres extends StatefulWidget {
  const AddAdres({super.key});

  @override
  State<AddAdres> createState() => _AddAdresState();
}

class _AddAdresState extends State<AddAdres> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (ac) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Wrap(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${locale[curLN]?['adres']}',
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
                    Scrollbar(
                      thumbVisibility: true,
                      trackVisibility: true,
                      child: Container(
                        height:
                            (ac.addresses.detail?.loc ?? []).isEmpty ? 0 : 140,
                        padding: const EdgeInsets.only(right: 10),
                        child: ListView(
                          children: List.generate(
                              (ac.addresses.detail?.loc ?? []).length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAdres.value = index;
                                  selectedAdresStr.value = ac.addresses.detail
                                          ?.loc?[index].address ??
                                      '';
                                  addressErr.value = false;
                                  adresErrBank.value = false;
                                  adresErrTer.value = false;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                height: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: selectedAdres.value == index
                                          ? green
                                          : const Color.fromRGBO(
                                              237, 237, 237, 1),
                                    )),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      ac.addresses.detail?.loc?[index]
                                              .address ??
                                          '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: selectedAdres.value == index
                                                ? green
                                                : const Color.fromRGBO(
                                                    216, 216, 216, 1),
                                            width: selectedAdres.value == index
                                                ? 4
                                                : 2,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 108,
                      height: 18,
                      child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0))),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/bag/salgym'),
                        child: Text(
                          '+ ${locale[curLN]?['addNewAdres']}',
                          style: const TextStyle(
                            color: orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          '${locale[curLN]?['useThisAdres']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        )),
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
