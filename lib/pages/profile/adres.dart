import 'package:apte/data/model/address/controller.dart';
import 'package:apte/widgets/bag&Card/newAdresManual.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

List adresType = [];

class Adres extends StatelessWidget {
  const Adres({super.key});

  @override
  Widget build(BuildContext context) {
    adresType = [
      [
        '${locale[curLN]?['home']}',
        'assets/icons/oy.svg',
      ],
      [
        '${locale[curLN]?['work']}',
        'assets/icons/is.svg',
      ],
      [
        '${locale[curLN]?['other']}',
        'assets/icons/gps.svg',
      ],
    ];
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (ac) {
          return Scaffold(
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
            body: ac.isload
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: (ac.addresses.detail?.loc ?? []).isEmpty
                        ? Column(
                            children: [
                              Image.asset('assets/images/locat.png'),
                              const SizedBox(height: 10),
                              Text(
                                '${locale[curLN]?['noneAdresText1']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 17),
                              Text(
                                '${locale[curLN]?['noneAdresText2']}',
                                style: const TextStyle(
                                  color: Color.fromRGBO(131, 135, 140, 1),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 33),
                              OutlinedButton(
                                style: ButtonStyle(
                                    minimumSize: WidgetStateProperty.all(
                                        const Size(double.infinity, 50)),
                                    side: WidgetStateProperty.all(
                                        const BorderSide(color: orange)),
                                    shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                              color: orange,
                                            )))),
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/bag/salgym'),
                                child: Text(
                                  '${locale[curLN]?['addAdres']}',
                                  style: const TextStyle(
                                    color: orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: List.generate(
                                ac.addresses.detail?.loc?.length ?? 0,
                                (index) => Stack(
                                      children: [
                                        Container(
                                          // height:111,
                                          margin:
                                              const EdgeInsets.only(bottom: 15),
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: const Color.fromRGBO(
                                                    237, 237, 237, 1)),
                                            color: const Color.fromRGBO(
                                                252, 252, 252, 1),
                                          ),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                      width: 48,
                                                      height: 48,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(48),
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(
                                                          child: SvgPicture.asset(adresType[(ac
                                                                      .addresses
                                                                      .detail
                                                                      ?.loc?[
                                                                          index]
                                                                      .place ??
                                                                  1) -
                                                              1][1]))),
                                                ],
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    adresType[(ac
                                                                .addresses
                                                                .detail
                                                                ?.loc?[index]
                                                                .place ??
                                                            1) -
                                                        1][0],
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 18),
                                                  Text(
                                                    ac
                                                            .addresses
                                                            .detail
                                                            ?.loc?[index]
                                                            .address ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          108, 108, 108, 1),
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 16,
                                          right: 60,
                                          child: GestureDetector(
                                            onTap: () {
                                              selectedAdresType = (ac
                                                          .addresses
                                                          .detail
                                                          ?.loc?[index]
                                                          .place ??
                                                      1) -
                                                  1;
                                              adr.text = ac.addresses.detail
                                                      ?.loc?[index].address ??
                                                  '';
                                              Get.to(() => NewAdresManual(
                                                    update: true,
                                                    id: ac.addresses.detail
                                                            ?.loc?[index].id ??
                                                        0,
                                                    index: index,
                                                  ));
                                            },
                                            child: SizedBox(
                                                width: 22,
                                                height: 22,
                                                child: SvgPicture.asset(
                                                    'assets/icons/edit.svg')),
                                          ),
                                        ),
                                        Positioned(
                                          top: 16,
                                          right: 16,
                                          child: GestureDetector(
                                              onTap: () async {
                                                int re = await ac.delete(ac
                                                    .addresses
                                                    .detail
                                                    ?.loc?[index]
                                                    .id);
                                                if (re == 200) {
                                                  ac.addresses.detail?.loc
                                                      ?.removeAt(index);
                                                }
                                                ac.update();
                                              },
                                              child: SizedBox(
                                                  width: 22,
                                                  height: 22,
                                                  child: SvgPicture.asset(
                                                      'assets/icons/delete.svg'))),
                                        ),
                                      ],
                                    )),
                          ),
                  ),
            floatingActionButton: (ac.addresses.detail?.loc ?? []).isNotEmpty
                ? FloatingActionButton(
                    backgroundColor: orange,
                    onPressed: () =>
                        Navigator.pushNamed(context, '/bag/salgym'),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                : null,
          );
        });
  }
}
