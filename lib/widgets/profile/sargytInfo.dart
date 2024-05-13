// ignore_for_file: file_names

import 'package:apte/data/dio.dart';
import 'package:apte/data/model/order/model.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';

class SargytInfo extends StatelessWidget {
  final Loc? loc;
  const SargytInfo({super.key, required this.loc});

  @override
  Widget build(BuildContext context) {
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
        title: Text('${locale[curLN]?['orderInfo']}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: sargytBorder),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 75,
                          height: 70,
                          child: Image.network(
                            loc?.items?[index].product?.image?.imgUrl ?? '',
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/err.png',
                              scale: 3,
                            ),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Image.asset(
                                'assets/images/err.png',
                                scale: 3,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Dioo.getTitle(loc?.items?[index].product?.title),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 13),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${locale[curLN]?['count']}: ${loc?.items?[index].quantity}',
                                    style: const TextStyle(
                                      color: green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${loc?.items?[index].totalPrice}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: loc?.items?.length ?? 0),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${locale[curLN]?['toleg']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 37,
                  child: Row(
                    children: [
                      Text(
                        '${locale[curLN]?['resPrice']}',
                        style: const TextStyle(
                            color: sargytTextGrey, fontSize: 16),
                      ),
                      const Spacer(),
                      Text(
                        '${loc?.total}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color.fromRGBO(107, 107, 107, 1),
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 37,
                //   child: Row(
                //     children: [
                //       Text(
                //         '${locale[curLN]?['arzanladysh']}',
                //         style: const TextStyle(
                //           color: sargytTextGrey,
                //           fontSize: 16,
                //         ),
                //       ),
                //       const Spacer(),
                //       const Text(
                //         '0.0',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w700,
                //           fontSize: 16,
                //           color: red,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 37,
                  child: Row(
                    children: [
                      Text(
                        '${locale[curLN]?['deliveryHyzmat']}',
                        style: const TextStyle(
                          color: sargytTextGrey,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '0.0',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: sargytTextGrey,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color.fromRGBO(183, 183, 183, 1),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${locale[curLN]?['res']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ),
                    Text(
                      '${loc?.total}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
