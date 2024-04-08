import 'package:apte/data/model/cart/controller.dart';
import 'package:flutter/material.dart';

import '../../data/api/register.dart';
import '../../data/dio.dart';
import '../../widgets/colors.dart';

class BagItem extends StatefulWidget {
  final CartController cc;
  final int index;
  const BagItem({super.key, required this.index, required this.cc});

  @override
  State<BagItem> createState() => _BagItemState();
}

class _BagItemState extends State<BagItem> {
  int quantity = 1;
  @override
  void initState() {
    for (var i = 0; i < widget.cc.quantity.length; i++) {
      if (widget.cc.quantity[i]['product'] ==
          widget.cc.cartProducts.detail?.loc?[widget.index].id) {
        quantity = widget.cc.quantity[i]['quantity'];
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(242, 242, 242, 1),
            ),
          ),
          // height: 100,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: 90,
                height: 100,
                child: Image.network(
                  widget.cc.cartProducts.detail?.loc?[widget.index].image
                          ?.imgUrl ??
                      '',
                  errorBuilder: (context, error, stackTrace) => const Text('err'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          Dioo.getTitle(widget.cc.cartProducts.detail
                              ?.loc?[widget.index].title),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10 + 4 + 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.cc.cartProducts.detail?.loc?[widget.index].price?.price} TMT',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            // width: 75,
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      try {
                                        await Dioo()
                                            .dio
                                            .post('${baseUrl}cart/', data: {
                                          'product': widget.cc.cartProducts
                                              .detail?.loc?[widget.index].id,
                                          'quantity': 1,
                                          'action': 'remove'
                                        });
                                        if (quantity > 1) {
                                          quantity--;
                                        }
                                      } catch (e) {
                                        debugPrint('----minus-----$e');
                                      }
                                      setState(
                                        () {},
                                      );
                                    },
                                    splashRadius: 15,
                                    padding: const EdgeInsets.all(0),
                                    constraints: const BoxConstraints(
                                      maxHeight: 24,
                                      maxWidth: 24,
                                      minHeight: 24,
                                      minWidth: 24,
                                    ),
                                    icon: const Icon(
                                      Icons.remove_rounded,
                                      color: green,
                                      size: 17,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(quantity.toString()),
                                const SizedBox(width: 10),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: IconButton(
                                    splashRadius: 15,
                                    padding: const EdgeInsets.all(0),
                                    constraints: const BoxConstraints(
                                      maxHeight: 24,
                                      maxWidth: 24,
                                      minHeight: 24,
                                      minWidth: 24,
                                    ),
                                    onPressed: () async {
                                      try {
                                        await Dioo()
                                            .dio
                                            .post('${baseUrl}cart/', data: {
                                          'product': widget.cc.cartProducts
                                              .detail?.loc?[widget.index].id,
                                          'quantity': 1,
                                          'action': 'add'
                                        });
                                        quantity++;
                                      } catch (e) {
                                        debugPrint('-----add------$e');
                                      }
                                      setState(
                                        () {},
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.add_rounded,
                                      color: green,
                                      size: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () async {
              try {
                await Dioo().dio.post(
                  '${baseUrl}cart/',
                  data: {
                    'product':
                        widget.cc.cartProducts.detail?.loc?[widget.index].id,
                    'quantity': quantity,
                    'action': 'remove'
                  },
                );
                widget.cc.cartProducts.detail?.loc?.removeAt(widget.index);
                widget.cc.update();
              } catch (e) {
                debugPrint('----remove product-------$e');
              }
              setState(() {});
            },
            padding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(
              maxHeight: 20,
              maxWidth: 20,
              minHeight: 20,
              minWidth: 20,
            ),
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  border: Border.all(color: green, width: 1.2),
                  borderRadius: BorderRadius.circular(32)),
              child: const Icon(
                Icons.close_rounded,
                color: green,
                size: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
