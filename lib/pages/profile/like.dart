import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
// import 'package:apte/widgets/main/horizontalProducts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List like = [
  [
    'assets/images/multiVitamin.png',
    'Мультивитамины для детей 250ml',
    '12.00 TMT',
    false,
    'Фармакор продакшн ООО',
    1,
  ],
  [
    'assets/images/melotanin.png',
    'Мультивитамины для детей 250ml',
    '12.00 TMT',
    false,
    'Фармакор продакшн ООО',
    1,
  ],
  [
    'assets/images/prostamol.png',
    'Простамол Уно капсулы 320 мг 30 шт',
    '12.00 TMT',
    false,
    'Фармакор продакшн ООО',
    1,
  ],
  [
    'assets/images/gel.png',
    'Мультивитамины для детей 250ml',
    '12.00 TMT',
    false,
    'Фармакор продакшн ООО',
    1,
  ],
  [
    'assets/images/spray.png',
    'Мультивитамины для детей 250ml',
    '12.00 TMT',
    false,
    'Фармакор продакшн ООО',
    1,
  ],
  [
    'assets/images/lorangin.png',
    'Мультивитамины для детей 250ml',
    '12.00 TMT',
    false,
    'Фармакор продакшн ООО',
    1,
  ],
  [
    'assets/images/vitaminC.png',
    'ВитаМишки BIO+ пребиотик жеват пастилки №60',
    '12.00 TMT',
    false,
    'Фармакор продакшн ООО',
    1,
  ],
];

class Like extends StatefulWidget {
  const Like({super.key});

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bc,
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
        title: Text('${locale[curLN]?['myLikes']}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: like.isEmpty
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
            : Column(
                children: [
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 162,
                      mainAxisExtent: 220,
                      mainAxisSpacing: 17,
                      crossAxisSpacing: 21,
                    ),
                    children: List.generate(
                        like.length,
                        (index) => GestureDetector(
                              onTap: () => Get.to(
                                  () => ProductPage(url: '/product/babenak/')),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                width: 162,
                                height: 220,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: const Offset(0, 1),
                                        color: Colors.black.withOpacity(0.05),
                                      )
                                    ]),
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
                                            child: Image.asset(like[index][0]),
                                          ),
                                        ),
                                        Text(
                                          like[index][1],
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
                                          like[index][2],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: green,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      right: 1,
                                      bottom: 10,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            like[index][3] = !like[index][3];
                                          });
                                        },
                                        child: Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: orange,
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          child: Icon(
                                            (like[index][3])
                                                ? Icons.done
                                                : Icons.add,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  )
                ],
              ),
      ),
    );
  }
}
