// ignore_for_file: file_names, deprecated_member_use

import 'package:apte/data/api/register.dart';
import 'package:apte/data/model/user/controller.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/new_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../data/dio.dart';
import '../../widgets/colors.dart';

class ProfileProductsPage extends StatelessWidget {
  final String text;
  const ProfileProductsPage({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (uc) {
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
            title: Text(text),
          ),
          body: (uc.whishlists.detail?.loc ?? []).isEmpty
              ? Column(
                  children: [
                    Image.asset('assets/images/like.png'),
                    const SizedBox(
                      height: 59,
                    ),
                    Text(
                      '${locale[curLN]?['noneLikesText1']}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      '${locale[curLN]?['noneLikesText2']}',
                      style: const TextStyle(
                        color: Color.fromRGBO(131, 135, 140, 1),
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              : SingleChildScrollView(
                  controller: contrl,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  child: Column(
                    children: [
                      const SizedBox(height: 17),
                      GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisExtent: 220,
                          mainAxisSpacing: 18,
                          crossAxisSpacing: 21,
                        ),
                        children: List.generate(
                          uc.whishlists.detail?.loc?.length ?? 0,
                          (index) {
                            RxBool isAdd = false.obs;
                            getCart(
                                uc.whishlists.detail?.loc?[index].id, isAdd);
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => ProductPage(
                                    url: uc.whishlists.detail?.loc?[index]
                                            .absoluteUrl ??
                                        '',
                                  ),
                                );
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                width: 200,
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: const Offset(0, 1),
                                      color: Colors.black.withOpacity(0.05),
                                    )
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(16),
                                            child: Image.network(
                                              uc.whishlists.detail?.loc?[index]
                                                      .image?.imgUrl ??
                                                  '',
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/err.png',
                                                scale: 3,
                                              ),
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Image.asset(
                                                  'assets/images/err.png',
                                                  scale: 3,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          Dioo.getTitle(uc.whishlists.detail
                                              ?.loc?[index].title),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Text(
                                          '${uc.whishlists.detail?.loc?[index].price?.price} TMT',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: green,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                      ],
                                    ),
                                    Positioned(
                                      right: 7,
                                      top: 20,
                                      child: GestureDetector(
                                        onTap: () async {
                                          String url =
                                              '${baseUrl}user/whishlists/';
                                          await Dioo().dio.post(url, data: {
                                            'id': uc.whishlists.detail
                                                ?.loc?[index].id
                                          });
                                          uc.whishlists.detail?.loc
                                              ?.removeAt(index);
                                          uc.update();
                                        },
                                        child: SvgPicture.asset(
                                            'assets/icons/redHeart.svg'),
                                      ),
                                    ),
                                    Positioned(
                                      right: 1,
                                      bottom: 10,
                                      child: InkWell(
                                        onTap: () {
                                          if (Dioo().checkToken()) {
                                            addCart(
                                                uc.whishlists.detail
                                                    ?.loc?[index].id,
                                                isAdd,
                                                uc.whishlists.detail
                                                    ?.loc?[index].price?.price);
                                          }
                                        },
                                        child: Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                            child: Obx(
                                              () => Icon(
                                                isAdd.value
                                                    ? Icons.done
                                                    : Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
