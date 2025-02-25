// ignore_for_file: file_names

import 'package:apte/controller/my_controller.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/cart/controller.dart';

TextEditingController nameBank = TextEditingController();
TextEditingController telBank = TextEditingController();
RxBool nameErrBank = false.obs,
    telErrBank = false.obs,
    adresErrBank = false.obs,
    cardErrBank = false.obs;

class BankKarty extends StatefulWidget {
  const BankKarty({super.key});

  @override
  State<BankKarty> createState() => _BankKartyState();
}

class _BankKartyState extends State<BankKarty> {
  TextEditingController comBank = TextEditingController();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () => Dioo().comingSoon());
    super.initState();
  }

  @override
  void dispose() {
    comBank.dispose();
    super.dispose();
  }

  final CartController cc = Get.find();

  @override
  Widget build(BuildContext context) {
    nameBank.text = user.name ?? '';
    telBank.text = user.phone ?? '';
    return GetBuilder<MyController>(
        init: MyController(),
        builder: (mc) {
          return Container();
          // Scaffold(
          //   body: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 25),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               const SizedBox(
          //                 height: 5,
          //               ),
          //               Text('${locale[curLN]?['dolyAdynyz']}'),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               Container(
          //                 padding: const EdgeInsets.symmetric(horizontal: 20),
          //                 height: 50,
          //                 decoration: BoxDecoration(
          //                   color: const Color.fromRGBO(251, 251, 251, 1),
          //                   borderRadius: BorderRadius.circular(8),
          //                   border: Border.all(
          //                       color: const Color.fromRGBO(237, 237, 237, 1)),
          //                 ),
          //                 child: TextField(
          //                   controller: nameBank,
          //                   onChanged: (value) => nameErrBank.value = false,
          //                   decoration: InputDecoration(
          //                     contentPadding: const EdgeInsets.all(0),
          //                     hintText: '${locale[curLN]?['dolyAdynyz']}',
          //                     hintStyle: const TextStyle(
          //                       color: Color.fromRGBO(193, 193, 193, 1),
          //                       fontSize: 16,
          //                     ),
          //                     border: const OutlineInputBorder(
          //                         borderSide: BorderSide.none),
          //                   ),
          //                 ),
          //               ),
          //               Obx(() =>
          //                   nameErrBank.value ? const ErrMsg() : Container()),
          //               const SizedBox(
          //                 height: 15,
          //               ),
          //               Text('${locale[curLN]?['tel']}'),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               Container(
          //                 padding: const EdgeInsets.symmetric(horizontal: 20),
          //                 height: 50,
          //                 decoration: BoxDecoration(
          //                   color: const Color.fromRGBO(251, 251, 251, 1),
          //                   borderRadius: BorderRadius.circular(8),
          //                   border: Border.all(
          //                       color: const Color.fromRGBO(237, 237, 237, 1)),
          //                 ),
          //                 child: Row(
          //                   children: [
          //                     const Text(
          //                       '+993 ',
          //                       style: TextStyle(fontSize: 16),
          //                     ),
          //                     Expanded(
          //                       child: TextField(
          //                         controller: telBank,
          //                         onChanged: (value) =>
          //                             telErrBank.value = false,
          //                         decoration: const InputDecoration(
          //                           contentPadding: EdgeInsets.all(0),
          //                           border: OutlineInputBorder(
          //                               borderSide: BorderSide.none),
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Obx(() =>
          //                   telErrBank.value ? const ErrMsg() : Container()),
          //               const SizedBox(height: 15),
          //               Text('${locale[curLN]?['adres']}'),
          //               const SizedBox(height: 10),
          //               GestureDetector(
          //                 onTap: () {
          //                   showModalBottomSheet(
          //                     shape: const RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.vertical(
          //                           top: Radius.circular(20)),
          //                     ),
          //                     showDragHandle: true,
          //                     context: context,
          //                     builder: (context) {
          //                       return const AddAdres();
          //                     },
          //                   );
          //                 },
          //                 child: Container(
          //                   padding: const EdgeInsets.symmetric(horizontal: 20),
          //                   height: 50,
          //                   decoration: BoxDecoration(
          //                     color: const Color.fromRGBO(251, 251, 251, 1),
          //                     borderRadius: BorderRadius.circular(8),
          //                     border: Border.all(
          //                         color:
          //                             const Color.fromRGBO(237, 237, 237, 1)),
          //                   ),
          //                   child: Obx(
          //                     () => Row(
          //                       children: [
          //                         Expanded(
          //                           child: selectedAdres.value == -1
          //                               ? Text(
          //                                   '${locale[curLN]?['chooseAdres']}',
          //                                   style: const TextStyle(
          //                                     color: Color.fromRGBO(
          //                                         193, 193, 193, 1),
          //                                     fontSize: 16,
          //                                   ),
          //                                 )
          //                               : Text(selectedAdresStr.value),
          //                         ),
          //                         const SizedBox(width: 5),
          //                         const Icon(CupertinoIcons.chevron_down,
          //                             size: 16),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               Obx(() =>
          //                   adresErrBank.value ? const ErrMsg() : Container()),
          //               const SizedBox(height: 15),
          //               Text('${locale[curLN]?['bankKartynyz']}'),
          //               const SizedBox(height: 10),
          //               GestureDetector(
          //                 onTap: () {
          //                   showModalBottomSheet(
          //                     shape: const RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.vertical(
          //                           top: Radius.circular(20)),
          //                     ),
          //                     showDragHandle: true,
          //                     context: context,
          //                     builder: (context) {
          //                       return AddCard();
          //                     },
          //                   );
          //                 },
          //                 child: Container(
          //                   padding: const EdgeInsets.symmetric(horizontal: 20),
          //                   height: 50,
          //                   decoration: BoxDecoration(
          //                     color: const Color.fromRGBO(251, 251, 251, 1),
          //                     borderRadius: BorderRadius.circular(8),
          //                     border: Border.all(
          //                         color:
          //                             const Color.fromRGBO(237, 237, 237, 1)),
          //                   ),
          //                   child: Obx(
          //                     () => Row(
          //                       children: [
          //                         Expanded(
          //                           child: selectedCardBank.value == -1
          //                               ? Text(
          //                                   '${locale[curLN]?['chooseCard']}',
          //                                   style: const TextStyle(
          //                                     color: Color.fromRGBO(
          //                                         193, 193, 193, 1),
          //                                     fontSize: 16,
          //                                   ),
          //                                 )
          //                               : Text(cardsType[
          //                                   cards[selectedCardBank.value][1]]),
          //                         ),
          //                         const SizedBox(width: 5),
          //                         const Icon(CupertinoIcons.chevron_down,
          //                             size: 16),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               Obx(() =>
          //                   cardErrBank.value ? const ErrMsg() : Container()),
          //               const SizedBox(height: 15),
          //               Text(
          //                   '${locale[curLN]?['bellik']} (${locale[curLN]?['optional']})'),
          //               const SizedBox(height: 10),
          //               Container(
          //                 padding: const EdgeInsets.symmetric(
          //                     horizontal: 20, vertical: 15),
          //                 height: 139,
          //                 decoration: BoxDecoration(
          //                   color: const Color.fromRGBO(251, 251, 251, 1),
          //                   borderRadius: BorderRadius.circular(8),
          //                   border: Border.all(
          //                       color: const Color.fromRGBO(237, 237, 237, 1)),
          //                 ),
          //                 child: TextField(
          //                   controller: comBank,
          //                   textAlignVertical: TextAlignVertical.top,
          //                   expands: true,
          //                   maxLines: null,
          //                   minLines: null,
          //                   decoration: InputDecoration(
          //                     contentPadding: const EdgeInsets.all(0),
          //                     hintText: '${locale[curLN]?['bellik']}',
          //                     hintStyle: const TextStyle(
          //                       color: Color.fromRGBO(193, 193, 193, 1),
          //                       fontSize: 16,
          //                     ),
          //                     border: const OutlineInputBorder(
          //                         borderSide: BorderSide.none),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 30),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   bottomNavigationBar: BottomAppBar(
          //       child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Expanded(
          //               child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 '${locale[curLN]?['res']}',
          //                 style: const TextStyle(
          //                   color: Color.fromRGBO(107, 107, 107, 1),
          //                 ),
          //               ),
          //               Text(
          //                 '$jem TMT',
          //                 style: const TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               )
          //             ],
          //           )),
          //           ElevatedButton(
          //               style: ButtonStyle(
          //                   minimumSize:
          //                       MaterialStateProperty.all(const Size(196, 46)),
          //                   elevation: MaterialStateProperty.all(1),
          //                   shape: MaterialStateProperty.all(
          //                       RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(10),
          //                   ))),
          //               onPressed: () async {
          //                 if (nameBank.text == '' ||
          //                     telBank.text == '' ||
          //                     selectedAdres.value < 0 ||
          //                     selectedCardBank.value < 0) {
          //                   if (nameBank.text == '') {
          //                     nameErrBank.value = true;
          //                   }
          //                   if (telBank.text == '') {
          //                     telErrBank.value = true;
          //                   }
          //                   if (selectedAdres.value < 0) {
          //                     adresErrBank.value = true;
          //                   }
          //                   if (selectedCardBank.value < 0) {
          //                     cardErrBank.value = true;
          //                   }
          //                 } else {
          //                   int re = await toOrder(nameBank.text, telBank.text,
          //                       selectedAdresStr.value, 4);
          //                   if (re == 200) {
          //                     // ignore: use_build_context_synchronously
          //                     // Dioo().successOrder(context, cc.cleanCart,
          //                     //     cc.cartProducts.detail?.loc, cc.quantity);
          //                   }
          //                 }
          //               },
          //               child: Text(
          //                 '${locale[curLN]?['toDeliv']}',
          //                 style: const TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //               )),
          //         ],
          //       ),
          //     ],
          //   )),
          // );
        });
  }
}
