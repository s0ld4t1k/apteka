// ignore_for_file: file_names

import 'package:flutter/material.dart';

class VerticalProducts extends StatefulWidget {
  const VerticalProducts({super.key});

  @override
  State<VerticalProducts> createState() => _VerticalProductsState();
}

class _VerticalProductsState extends State<VerticalProducts> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 162,
        mainAxisExtent: 220,
        mainAxisSpacing: 18,
        crossAxisSpacing: 21,
      ),
      // children: List.generate(
      //   // 0,
      //   // (index) => GestureDetector(
      //   //   onTap: () =>
      //   //       Get.to(() => const ProductPage(url: '/product/babenak/')),
      //   //   child: Container(
      //   //     padding: const EdgeInsets.symmetric(horizontal: 12),
      //   //     width: 162,
      //   //     height: 220,
      //   //     decoration: BoxDecoration(
      //   //         borderRadius: BorderRadius.circular(8),
      //   //         color: Colors.white,
      //   //         boxShadow: [
      //   //           BoxShadow(
      //   //             blurRadius: 3,
      //   //             offset: const Offset(0, 1),
      //   //             color: Colors.black.withOpacity(0.05),
      //   //           )
      //   //         ]),
      //   //     child: Stack(
      //   //       children: [
      //   //         Column(
      //   //           crossAxisAlignment: CrossAxisAlignment.start,
      //   //           children: [
      //   //             Expanded(
      //   //               child: Container(
      //   //                 alignment: Alignment.center,
      //   //                 padding: const EdgeInsets.all(16),
      //   //                 child: Image.asset(products[index]['img'][0]),
      //   //               ),
      //   //             ),
      //   //             Text(
      //   //               products[index]['name'],
      //   //               style: const TextStyle(
      //   //                 fontSize: 14,
      //   //                 fontWeight: FontWeight.w500,
      //   //               ),
      //   //               maxLines: 2,
      //   //               overflow: TextOverflow.ellipsis,
      //   //             ),
      //   //             const SizedBox(
      //   //               height: 18,
      //   //             ),
      //   //             Text(
      //   //               '${products[index]['price']} TMT',
      //   //               style: const TextStyle(
      //   //                 fontSize: 14,
      //   //                 fontWeight: FontWeight.w700,
      //   //                 color: green,
      //   //               ),
      //   //             ),
      //   //             const SizedBox(
      //   //               height: 16,
      //   //             ),
      //   //           ],
      //   //         ),
      //   //         Positioned(
      //   //           right: 1,
      //   //           bottom: 10,
      //   //           child: InkWell(
      //   //             onTap: () {
      //   //               setState(() {
      //   //                 products[index]['add'] = !products[index]['add'];
      //   //               });
      //   //               products[index]['add'] ? addToCart() : null;
      //   //             },
      //   //             child: Container(
      //   //               width: 32,
      //   //               height: 32,
      //   //               decoration: BoxDecoration(
      //   //                 color: orange,
      //   //                 borderRadius: BorderRadius.circular(32),
      //   //               ),
      //   //               child: Icon(
      //   //                 (products[index]['add']) ? Icons.done : Icons.add,
      //   //                 color: Colors.white,
      //   //                 size: 20,
      //   //               ),
      //   //             ),
      //   //           ),
      //   //         ),
      //   //       ],
      //   //     ),
      //   //   ),
      //   // ),
      // ),
    );
  }
}
