import 'package:apte/data/model/cart/controller.dart';
import 'package:apte/pages/bag/addAdres.dart';
import 'package:apte/pages/bag/sargytEtmek.dart';
import 'package:apte/pages/profile/habarlasmak.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/dio.dart';

TextEditingController nameTer = TextEditingController();
TextEditingController telTer = TextEditingController();
// TextEditingController comTer = TextEditingController();
RxBool nameErrTer = false.obs, telErrTer = false.obs, adresErrTer = false.obs;

class Terminal extends StatefulWidget {
  const Terminal({super.key});

  @override
  State<Terminal> createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  TextEditingController comTer = TextEditingController();
  @override
  // void initState() {
  //   TextEditingController comTer = TextEditingController();
  //   super.initState();
  // }

  @override
  void dispose() {
    comTer.dispose();
    super.dispose();
  }

  final CartController cc = Get.find();

  @override
  Widget build(BuildContext context) {
    nameTer.text = user.name ?? '';
    telTer.text = user.phone ?? '';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text('${locale[curLN]?['dolyAdynyz']}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 251, 251, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: const Color.fromRGBO(237, 237, 237, 1)),
                    ),
                    child: TextField(
                      onChanged: (value) => nameErrTer.value = false,
                      controller: nameTer,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        hintText: '${locale[curLN]?['dolyAdynyz']}',
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          fontSize: 16,
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Obx(() => nameErrTer.value ? const ErrMsg() : Container()),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('${locale[curLN]?['tel']}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 251, 251, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: const Color.fromRGBO(237, 237, 237, 1)),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          '+993 ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (value) => telErrTer.value = false,
                            controller: telTer,
                            maxLength: 8,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              counterText: '',
                              contentPadding: EdgeInsets.all(0),
                              border: OutlineInputBorder(
                                  gapPadding: 0, borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => telErrTer.value ? const ErrMsg() : Container()),
                  const SizedBox(height: 15),
                  Text('${locale[curLN]?['adres']}'),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        showDragHandle: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return const AddAdres();
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: Obx(
                        () => Row(
                          children: [
                            Expanded(
                              child: selectedAdres.value == -1
                                  ? Text(
                                      '${locale[curLN]?['chooseAdres']}',
                                      style: const TextStyle(
                                        color: Color.fromRGBO(193, 193, 193, 1),
                                        fontSize: 16,
                                      ),
                                    )
                                  : Text(selectedAdresStr.value),
                            ),
                            const SizedBox(width: 5),
                            const Icon(CupertinoIcons.chevron_down, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(() => adresErrTer.value ? const ErrMsg() : Container()),
                  const SizedBox(height: 15),
                  Text('${locale[curLN]?['bellik']}'),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    height: 139,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 251, 251, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: const Color.fromRGBO(237, 237, 237, 1)),
                    ),
                    child: TextField(
                      controller: comTer,
                      textAlignVertical: TextAlignVertical.top,
                      expands: true,
                      maxLines: null,
                      minLines: null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        hintText:
                            '${locale[curLN]?['bellik']} (${locale[curLN]?['optional']})',
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          fontSize: 16,
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${locale[curLN]?['res']}',
                      style: const TextStyle(
                        color: Color.fromRGBO(107, 107, 107, 1),
                      ),
                    ),
                    Text(
                      '$jem TMT',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )),
                ElevatedButton(
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(196, 46)),
                        elevation: MaterialStateProperty.all(1),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () async {
                      if (nameTer.text == '' ||
                          telTer.text == '' ||
                          selectedAdres.value < 0) {
                        if (nameTer.text == '') nameErrTer.value = true;
                        if (telTer.text == '') telErrTer.value = true;
                        if (selectedAdres.value < 0) {
                          adresErrTer.value = true;
                        }
                      } else {
                        int re = await toOrder(nameTer.text, telTer.text,
                            selectedAdresStr.value, 2);
                        if (re == 200) {
                          // ignore: use_build_context_synchronously
                          Dioo().successOrder(context, cc.cleanCart,
                              cc.cartProducts.detail?.loc, cc.quantity);
                        }
                      }
                    },
                    child: Text(
                      '${locale[curLN]?['toDeliv']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
