// ignore_for_file: file_names

import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<int> _selectedFiltr = [-1, -1];
List volumeType = ['ml', 'l', 'mg', 'kg'];
List filtrList = [
  [
    '${locale[curLN]?["gowrum"]}',
    ['ml', 'l', 'g', 'kg'],
  ],
  [
    '${locale[curLN]?["sex"]}',
    ['Erkek', 'Aýal', 'Çaga', 'Bäbek'],
  ],
];

// ignore: must_be_immutable
class FiltrBottomSheet extends StatefulWidget {
  String url2;
  final dynamic ontap;
  final dynamic change;
  FiltrBottomSheet(
      {super.key,
      required this.ontap,
      required this.url2,
      required this.change});

  @override
  State<FiltrBottomSheet> createState() => _FiltrBottomSheetState();
}

class _FiltrBottomSheetState extends State<FiltrBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '${locale[curLN]?["filtr"]}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(
                        maxHeight: 24,
                        maxWidth: 24,
                        minHeight: 24,
                        minWidth: 24,
                      ),
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                const SizedBox(height: 28),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          filtrList[index][0],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 12,
                          runSpacing: 9,
                          children: List.generate(
                            filtrList[index][1].length,
                            (i) => SizedBox(
                              height: 34,
                              child: OutlinedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 1,
                                    )),
                                    side: MaterialStateProperty.all(BorderSide(
                                      color: _selectedFiltr[index] == i
                                          ? green
                                          : const Color.fromRGBO(
                                              237, 237, 237, 1),
                                    )),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(80, 34))),
                                onPressed: () {
                                  setState(() {
                                    if (_selectedFiltr[index] == i) {
                                      _selectedFiltr[index] = -1;
                                    } else {
                                      _selectedFiltr[index] = i;
                                    }
                                  });
                                },
                                child: Text(
                                  filtrList[index][1][i],
                                  style: TextStyle(
                                    color: _selectedFiltr[index] == i
                                        ? green
                                        : const Color.fromRGBO(71, 71, 71, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      width: double.infinity,
                      color: const Color.fromRGBO(237, 237, 237, 1),
                    );
                  },
                  itemCount: filtrList.length,
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 45)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_selectedFiltr[1] >= 0) {
                      widget.url2 += '&type=${_selectedFiltr[1] + 1}';
                    } else {
                      int i = widget.url2.indexOf('&type=');
                      if (i >= 0) {
                        widget.url2 = widget.url2.replaceRange(i, i + 7, '');
                      }
                    }
                    if (_selectedFiltr[0] >= 0) {
                      widget.url2 +=
                          '&volume_type=${volumeType[_selectedFiltr[0]]}';
                    } else {
                      String s = widget.url2.split('').reversed.join();
                      int j = s.indexOf('&');
                      int i = widget.url2.indexOf('&volume_type');
                      if (j <= i) j = widget.url2.length;
                      if (i >= 0 && j >= 0) {
                        widget.url2 = widget.url2.replaceRange(i, j, '');
                      }
                    }
                    widget.change(widget.url2);
                    widget.ontap(widget.url2);
                    Get.back();
                  },
                  child: Text(
                    '${locale[curLN]?["toFiltr"]}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
