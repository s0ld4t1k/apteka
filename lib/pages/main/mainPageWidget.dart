// ignore_for_file: file_names, deprecated_member_use, curly_braces_in_flow_control_structures

import 'package:apte/data/model/banners/controller.dart';
import 'package:apte/data/model/products/controller.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/searchPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/controller/langController.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/category.dart';
import 'package:apte/widgets/main/harmful.dart';
import 'package:apte/widgets/main/new_products.dart';
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

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LangCont>(
        init: LangCont(),
        builder: (lc) {
          return Scaffold(
            backgroundColor: bc,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              titleSpacing: 25,
              title: Row(
                children: [
                  const SizedBox(width: 1),
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/mainPage/search'),
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
                                  const SizedBox(width: 15),
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
                            const SizedBox(width: 14),
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
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (await canLaunchUrl(
                          Uri(scheme: 'tel', path: '+99362410579')))
                        await launchUrl(
                            Uri(scheme: 'tel', path: '+99362410579'));
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                      minimumSize:
                          MaterialStateProperty.all(const Size(45, 44)),
                    ),
                    child: SvgPicture.asset('assets/icons/call.svg'),
                  ),
                ],
              ),
            ),
            body: GetBuilder<ProductsController>(
                init: ProductsController(),
                builder: (ps) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: contrl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
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
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/err.png',
                                      scale: 3,
                                    ),
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Image.asset(
                                        'assets/images/err.png',
                                        scale: 3,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              options: CarouselOptions(
                                viewportFraction: 0.8,
                                height: 150,
                                autoPlay: true,
                                enableInfiniteScroll: false,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        const MainCategory(),
                        NewProducts(
                          type: 2,
                          text: locale[curLN]?['mostsold'] ?? '',
                          prs: ps.mostsoldProducts,
                          url: ps.url2,
                          ontap: ps.getMostsoldProducts,
                        ),
                        const SizedBox(height: 15),
                        NewProducts(
                          type: 1,
                          text: locale[curLN]?['newPro'] ?? '',
                          prs: ps.newProducts,
                          url: ps.url1,
                          ontap: ps.getNewProducts,
                        ),
                        const SizedBox(height: 15),
                        const MainHarmful(),
                        const SizedBox(height: 15),
                        NewProducts(
                          type: 3,
                          text: locale[curLN]?['recommended'] ?? '',
                          prs: ps.recommendedProducts,
                          url: ps.url3,
                          ontap: ps.getRecommended,
                        ),
                        const SizedBox(height: 15),
                        const SizedBox(height: 34 - 15),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
