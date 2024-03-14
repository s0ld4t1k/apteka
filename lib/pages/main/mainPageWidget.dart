// ignore_for_file: file_names, deprecated_member_use, curly_braces_in_flow_control_structures

import 'package:apte/data/model/banners/controller.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/searchPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/controller/langController.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/category.dart';
import 'package:apte/widgets/main/harmful.dart';
import 'package:apte/widgets/main/horizontalProducts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

RxString barRes = ''.obs;
void scan() async {
  try {
    barRes.value = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", 'Cancel', true, ScanMode.BARCODE);
    if (barRes.value != '-1') Get.to(() => const SearchPage());
  } on PlatformException {
    debugPrint('hehehe scan error');
  }
}

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LangCont>(builder: (cont) {
      return Scaffold(
        backgroundColor: bc,
        appBar: AppBar(
          toolbarHeight: 70,
          titleSpacing: 25,
          title: Row(
            children: [
              const SizedBox(
                width: 1,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/mainPage/search');
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: searchConGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/search.svg',
                                color: textGrey3,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  '${locale[curLN]?["searchHint"]}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: textGrey3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 1,
                          color: textGrey3,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: scan,
                          child: SvgPicture.asset(
                            'assets/icons/scan.svg',
                            color: textGrey3,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await canLaunchUrl(
                      Uri(scheme: 'tel', path: '+99361400905')))
                    await launchUrl(Uri(scheme: 'tel', path: '+99361400905'));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                  minimumSize: MaterialStateProperty.all(const Size(45, 44)),
                ),
                child: SvgPicture.asset('assets/icons/call.svg'),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          controller: contrl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              GetBuilder<BannerController>(
                  init: BannerController(),
                  builder: (bc) {
                    return CarouselSlider(
                        items: List.generate(
                          bc.banners.detail?.loc?.length ?? 0,
                          (index) => Container(
                            width: 325,
                            margin: const EdgeInsets.only(right: 12),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network(
                              bc.banners.detail?.loc?[index].imgUrl ?? '',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          viewportFraction: 0.85,
                          height: 150,
                          autoPlay: true,
                          enableInfiniteScroll: false,
                        ));
                  }),
              const SizedBox(
                height: 15,
              ),
              const MainCategory(),
              const HorizontalProducts(
                text: 'Arzanladyşlar',
              ),
              const SizedBox(
                height: 15,
              ),
              const HorizontalProducts(
                text: 'Täzeler',
              ),
              const SizedBox(
                height: 15,
              ),
              const HorizontalProducts(
                text: 'Kosmetiki serişdeler',
              ),
              const SizedBox(
                height: 15,
              ),
              const MainHarmful(),
              const SizedBox(
                height: 15,
              ),
              const HorizontalProducts(
                text: 'Dermanlyk serişdeler',
              ),
              const SizedBox(
                height: 15,
              ),
              const HorizontalProducts(
                text: 'Lukmançylyk hajatly önümler',
              ),
              const SizedBox(
                height: 34 - 15,
              ),
            ],
          ),
        ),
      );
    });
  }
}
