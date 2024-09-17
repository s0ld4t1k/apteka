import 'package:apte/data/dio.dart';
import 'package:apte/data/model/cart/controller.dart';
import 'package:apte/pages/bag/addAdres.dart';
import 'package:apte/pages/bag/sargytEtmek.dart';
import 'package:apte/pages/profile/habarlasmak.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController name = TextEditingController();
TextEditingController tel = TextEditingController();
RxBool nameErr = false.obs, telErr = false.obs, addressErr = false.obs;

class Nagt extends StatefulWidget {
  const Nagt({super.key});

  @override
  State<Nagt> createState() => _NagtState();
}

class _NagtState extends State<Nagt> {
  TextEditingController com = TextEditingController();
  @override
  void dispose() {
    com.dispose();
    super.dispose();
  }

  final CartController cc = Get.find();

  @override
  Widget build(BuildContext context) {
    name.text = user.name ?? '';
    tel.text = user.phone ?? '';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text('${locale[curLN]?['dolyAdynyz']}'),
                  const SizedBox(height: 10),
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
                      onChanged: (value) => nameErr.value = false,
                      controller: name,
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
                  Obx(() => nameErr.value ? const ErrMsg() : Container()),
                  const SizedBox(height: 15),
                  Text('${locale[curLN]?['tel']}'),
                  const SizedBox(height: 10),
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
                        const Text('+993 ', style: TextStyle(fontSize: 16)),
                        Expanded(
                          child: TextField(
                            onChanged: (value) => telErr.value = false,
                            controller: tel,
                            maxLength: 8,
                            style: const TextStyle(fontSize: 16),
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
                  Obx(() => telErr.value ? const ErrMsg() : Container()),
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
                  Obx(() => addressErr.value ? const ErrMsg() : Container()),
                  const SizedBox(height: 15),
                  Text(
                      '${locale[curLN]?['bellik']} (${locale[curLN]?['optional']})'),
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
                      controller: com,
                      textAlignVertical: TextAlignVertical.top,
                      expands: true,
                      maxLines: null,
                      minLines: null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        hintText: '${locale[curLN]?['bellikText']}',
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
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(const Size(196, 46)),
                    elevation: WidgetStateProperty.all(1),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (name.text == '' ||
                        tel.text == '' ||
                        selectedAdres.value < 0) {
                      if (name.text == '') nameErr.value = true;
                      if (tel.text == '') telErr.value = true;
                      if (selectedAdres.value < 0) addressErr.value = true;
                    } else {
                      int re = await toOrder(
                          name.text, tel.text, selectedAdresStr.value, 1);
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
