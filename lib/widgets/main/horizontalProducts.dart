// ignore_for_file: file_names

import 'package:apte/pages/bag/bag.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalProducts extends StatefulWidget {
  final String text;
  const HorizontalProducts({super.key, required this.text});

  @override
  State<HorizontalProducts> createState() => _HorizontalProductsState();
}

class _HorizontalProductsState extends State<HorizontalProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 25,
            right: 15,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    '${locale[curLN]?["seeAll"]}',
                    style: const TextStyle(
                      color: green,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ))
            ],
          ),
        ),
        // SizedBox(height: 15,),
        SizedBox(
          height: 230,
          child: ListView(
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(
                width: 25,
              ),
              Row(
                children: List.generate(products.length, (index) {
                  // var _added=false;
                  return GestureDetector(
                    onTap: () =>
                        Get.to(() => ProductPage(url: '/product/babenak/')),
                    child: Container(
                      margin: const EdgeInsets.only(right: 18),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: 162,
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
                          ]),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(16),
                                  child: Image.asset(products[index]['img'][0]),
                                ),
                              ),
                              Text(
                                products[index]['name'],
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
                                '${products[index]['price']} TMT',
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
                                  products[index]['add'] =
                                      !products[index]['add'];
                                });
                                products[index]['add'] ? addToCart() : null;
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Icon(
                                  (products[index]['add'])
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
                  );
                }),
              )
            ],
          ),
        )
      ],
    );
  }
}
