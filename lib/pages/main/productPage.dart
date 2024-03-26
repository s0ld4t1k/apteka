// ignore_for_file: file_names, deprecated_member_use
import 'package:apte/data/api/register.dart';
import 'package:apte/data/model/product/controller.dart';
import 'package:apte/pages/bag/bag.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/gorkezmeInfoRow.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/horizontalProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/dio.dart';

RxBool _liked = false.obs;
RxInt _curIndex = 0.obs;
List infoList = [];
RxInt countProd = 1.obs;
RxBool isClickProd = false.obs;

class ProductPage extends StatelessWidget {
  final String url;
  const ProductPage({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    countProd = 1.obs;
    isClickProd = false.obs;
    productUrl(url);
    _curIndex(0);
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (pc) {
          gorkezmeList = [
            [
              '${locale[curLN]?["aboutproduct"]}',
              Dioo.getTitle(pc.product.detail?.loc?[0].description)
            ],
            [
              '${locale[curLN]?["duzum"]}',
              Dioo.getTitle(pc.product.detail?.loc?[0].composition)
            ],
            [
              '${locale[curLN]?["saklanyshy"]}',
              Dioo.getTitle(pc.product.detail?.loc?[0].indication)
            ],
            [
              '${locale[curLN]?["ulanylyshy"]}',
              Dioo.getTitle(pc.product.detail?.loc?[0].howToTakeTk)
            ],
            [
              '${locale[curLN]?["manLimit"]}',
              Dioo.getTitle(pc.product.detail?.loc?[0].contraindications)
            ],
          ];
          infoList = [
            [
              '${locale[curLN]?["onduriji"]}:',
              pc.product.detail?.loc?[0].brandFk?.title ?? '',
            ],
            [
              '${locale[curLN]?["gornushi"]}:',
              pc.product.detail?.loc?[0].releaseForm ?? '',
            ],
            [
              '${locale[curLN]?["ulanyshDate"]}:',
              '${pc.product.detail?.loc?[0].productionDate}/${pc.product.detail?.loc?[0].expirationDate}'
            ],
            [
              '${locale[curLN]?["daneSany"]}:',
              '${pc.product.detail?.loc?[0].volume} ${pc.product.detail?.loc?[0].volumeType}'
            ],
          ];
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              titleSpacing: 25,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.chevron_left_rounded),
                  ),
                  Expanded(
                    child:
                        Center(child: Text('${locale[curLN]?["productInfo"]}')),
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: GestureDetector(
                        onTap: () {
                          Share.shareUri(
                              Uri(path: pc.product.detail?.loc?[0].mainImage));
                        },
                        child: SvgPicture.asset('assets/icons/share.svg')),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: GestureDetector(
                      onTap: () {
                        _liked(!_liked.value);
                        pc.update();
                      },
                      child: (_liked.value)
                          ? SvgPicture.asset('assets/icons/redHeart.svg')
                          : SvgPicture.asset(
                              'assets/icons/heart.svg',
                              color: Colors.black.withOpacity(0.75),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 220,
                                child: Stack(
                                  children: [
                                    PageView(
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (value) {
                                        _curIndex(value);
                                        pc.update();
                                      },
                                      children: List.generate(
                                        pc.product.detail?.loc?[0].images!
                                                .length ??
                                            0,
                                        (index) => Stack(
                                          children: [
                                            Positioned(
                                              top: 32,
                                              right: 0,
                                              left: 0,
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.dialog(
                                                        AlertDialog(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          surfaceTintColor:
                                                              Colors
                                                                  .transparent,
                                                          content:
                                                              Image.network(pc
                                                                      .product
                                                                      .detail!
                                                                      .loc![0]
                                                                      .images![
                                                                          index]
                                                                      .imgUrl ??
                                                                  ''),
                                                        ),
                                                      );
                                                    },
                                                    child: SizedBox(
                                                      width: 172,
                                                      height: 110,
                                                      child: Image.network(pc
                                                              .product
                                                              .detail!
                                                              .loc![0]
                                                              .images![index]
                                                              .imgUrl ??
                                                          ''),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 23,
                                        left: 0,
                                        right: 0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                              pc.product.detail?.loc?[0].images!
                                                      .length ??
                                                  0,
                                              (index) => Container(
                                                    width: 6,
                                                    height: 6,
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 2),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      color: _curIndex.value ==
                                                              index
                                                          ? green
                                                          : const Color
                                                              .fromRGBO(
                                                              234, 234, 234, 1),
                                                    ),
                                                  )),
                                        ))
                                  ],
                                ),
                              ),
                              Text(
                                Dioo.getTitle(pc.product.detail?.loc![0].title),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                '${pc.product.detail?.loc?[0].price?.price ?? 0} TMT',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: green,
                                ),
                              ),
                              const Devider(),
                              ListView.separated(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(0),
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 15,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          infoList[index][0],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  133, 133, 133, 1)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          infoList[index][1],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                itemCount: infoList.length,
                              ),
                              const Devider(),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${locale[curLN]?["gorkezme"]}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: List.generate(gorkezmeList.length,
                                    (index) => InfoRow(index: index)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        Container(
                            width: double.infinity,
                            // height: 254,
                            color: const Color.fromRGBO(253, 253, 253, 1),
                            child: const HorizontalProducts(
                              text: 'Meňzeş harytlar',
                            )),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ]),
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 15, bottom: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${locale[curLN]?["price"]}',
                                style: const TextStyle(
                                  color: textGrey,
                                ),
                              ),
                              Text(
                                '${pc.product.detail?.loc?[0].price?.price ?? 0} TMT',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () {
                              return isClickProd.value
                                  ? Row(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () async {
                                              try {
                                                countProd.value--;
                                                if (countProd.value <= 0) {
                                                  isClickProd.value = false;
                                                  countProd.value = 1;
                                                }
                                                await Dioo().dio.post(
                                                  '${baseUrl}cart/',
                                                  data: {
                                                    'product': pc.product.detail
                                                        ?.loc?[0].id,
                                                    'quantity': 1,
                                                    'action': 'remove'
                                                  },
                                                );
                                              } catch (e) {}
                                            },
                                            child: const Icon(Icons.remove)),
                                        Expanded(
                                            child: Center(
                                                child: Text(
                                                    '${countProd.value}'))),
                                        ElevatedButton(
                                            onPressed: () async {
                                              try {
                                                countProd.value++;
                                                await Dioo().dio.post(
                                                  '${baseUrl}cart/',
                                                  data: {
                                                    'product': pc.product.detail
                                                        ?.loc?[0].id,
                                                    'quantity': 1,
                                                    'action': 'add'
                                                  },
                                                );
                                              } catch (e) {}
                                            },
                                            child: const Icon(Icons.add)),
                                      ],
                                    )
                                  : ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(double.infinity, 47)),
                                      ),
                                      onPressed: () async {
                                        try {
                                          await Dioo().dio.post(
                                            '${baseUrl}cart/',
                                            data: {
                                              'product':
                                                  pc.product.detail?.loc?[0].id,
                                              'quantity': 1,
                                              'action': 'add'
                                            },
                                          );
                                          isClickProd.value = true;
                                          addToCart();
                                        } catch (e) {}
                                      },
                                      child: Text(
                                        '${locale[curLN]?["addCart"]}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class Devider extends StatelessWidget {
  const Devider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      height: 1,
      width: double.infinity,
      color: const Color.fromRGBO(237, 237, 237, 1),
    );
  }
}
