import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/model.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SargytPage extends StatelessWidget {
  final double totalPrice;
  final double delivery;
  final double total;
  final List<Products> products;
  final List quan;
  const SargytPage({
    super.key,
    required this.totalPrice,
    required this.delivery,
    required this.total,
    required this.products,
    required this.quan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.chevron_back),
        ),
        title: Text(locale[curLN]!['order']!),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  var quantity = 0;
                  for (var i = 0; i < quan.length; i++) {
                    if (quan[i]['product'] == products[index].id) {
                      quantity = quan[i]['quantity'];
                    }
                  }
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromRGBO(242, 242, 242, 1)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 74,
                          height: 76,
                          child: Image.network(
                            products[index].image?.imgUrl ?? '',
                            errorBuilder: (context, error, stackTrace) =>
                                const Text('err'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Dioo.getTitle(products[index].title),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // const SizedBox(height: 5,),
                            // Text(cartProductList[index]['desc'],style: const TextStyle(
                            //   fontSize: 10,
                            //   color: Color.fromRGBO(113, 114, 122, 1),
                            // ),maxLines: 2,overflow: TextOverflow.ellipsis,),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  '${products[index].price?.price} TMT',
                                  style: const TextStyle(
                                    color: green,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                if (products[index].price?.hasDiscount ?? false)
                                  Text(
                                    '${products[index].price?.oldPrice ?? 0} TMT',
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                    ),
                                  ),
                                const Spacer(),
                                Text(
                                  '$quantity sany',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromRGBO(129, 129, 129, 1),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: products.length),
            const Devider(),
            Text(
              '${locale[curLN]!['productCount']!} ${products.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    child: Text(
                  locale[curLN]!['resPrice']!,
                  style: const TextStyle(
                    color: Color.fromRGBO(131, 133, 137, 1),
                  ),
                )),
                Text(
                  '$totalPrice TMT',
                  style: const TextStyle(
                    color: Color.fromRGBO(131, 133, 137, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                    child: Text(
                  locale[curLN]!['deliveryHyzmat']!,
                  style: const TextStyle(
                    color: Color.fromRGBO(131, 133, 137, 1),
                  ),
                )),
                Text(
                  '$delivery TMT',
                  style:
                      const TextStyle(color: Color.fromRGBO(131, 133, 137, 1)),
                ),
              ],
            ),
            const Devider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    locale[curLN]!['res']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  '$total TMT',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            // const SizedBox(height: 26),
            // if (minutes > 0 && secunds > 0)
            //   OutlinedButton(
            //       style: ButtonStyle(
            //         side: MaterialStateProperty.all(
            //             const BorderSide(color: red)),
            //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10))),
            //         minimumSize: MaterialStateProperty.all(
            //             const Size(double.infinity, 50)),
            //       ),
            //       onPressed: () {
            //         minutes = 0;
            //         secunds = 0;
            //         Get.back();
            //       },
            //       child: Text(
            //         '${locale[curLN]!['cancel']!} $minutes:$secunds',
            //         style: const TextStyle(
            //             fontSize: 14,
            //             fontWeight: FontWeight.w500,
            //             color: red),
            //       )),
            const SizedBox(height: 23),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(green),
              minimumSize:
                  MaterialStateProperty.all(const Size(double.infinity, 50))),
          onPressed: () {
            selectedTab = 0;
            Get.offAll(() => const MainPage());
          },
          child: Text(
            locale[curLN]!['continueShop']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
