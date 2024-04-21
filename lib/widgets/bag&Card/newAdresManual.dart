// ignore_for_file: file_names

import 'package:apte/data/model/address/controller.dart';
import 'package:apte/widgets/bag&Card/newAdres.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var selectedAdresType = 0;
TextEditingController adr = TextEditingController();

class NewAdresManual extends StatefulWidget {
  final int id, index;
  final bool update;
  const NewAdresManual(
      {super.key, this.update = false, this.id = 0, this.index = 0});

  @override
  State<NewAdresManual> createState() => _NewAdresManualState();
}

class _NewAdresManualState extends State<NewAdresManual> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (ac) {
          adresTypeList = [
            '${locale[curLN]?['home']}',
            '${locale[curLN]?['work']}',
            '${locale[curLN]?['other']}',
          ];
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
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.chevron_left_rounded)),
                title: Text('${locale[curLN]?['myAdres']}'),
              ),
              body: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 230,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${locale[curLN]?['adres']}'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 108,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(251, 251, 251, 1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            237, 237, 237, 1))),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: TextField(
                                  controller: adr,
                                  textAlignVertical: TextAlignVertical.top,
                                  expands: true,
                                  minLines: null,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Text('${locale[curLN]?['salgynynGornushi']}'),
                              const SizedBox(
                                height: 20,
                              ),
                              Wrap(
                                spacing: 11,
                                children: List.generate(adresTypeList.length,
                                    (index) {
                                  return OutlinedButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 25, vertical: 6)),
                                          side: MaterialStateProperty.all(
                                              BorderSide(
                                            color: selectedAdresType == index
                                                ? green
                                                : const Color.fromRGBO(
                                                    237, 237, 237, 1),
                                          )),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ))),
                                      onPressed: () {
                                        setState(() {
                                          selectedAdresType = index;
                                        });
                                      },
                                      child: Text(
                                        adresTypeList[index],
                                        style: TextStyle(
                                          color: selectedAdresType == index
                                              ? green
                                              : const Color.fromRGBO(
                                                  168, 168, 168, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ));
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 50))),
                      onPressed: () {
                        if (widget.update) {
                          ac.patch(widget.id, selectedAdresType + 1, adr.text,
                              widget.index);
                        } else {
                          ac.add(selectedAdresType + 1, adr.text);
                          Get.back();
                        }
                        Get.back();
                      },
                      child: Text(
                        '${locale[curLN]?['save']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
