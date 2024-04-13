import 'package:apte/pages/bag/bag.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';

class Reklam extends StatelessWidget {
  final String photo, text, text2, price;

  const Reklam({
    super.key,
    this.photo = 'assets/images/spray.png',
    this.text = 'ВитаМишки BIO+ пребиотик жеват пастилки №60',
    this.text2 = 'Трог Медикал GMBH- Германия',
    this.price = '12.00 TMT',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 115,
          height: 121,
          padding: const EdgeInsets.all(12),
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
          child: const Placeholder(),
        ),
        const SizedBox(width: 19),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text2,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color.fromRGBO(160, 160, 160, 1),
              ),
            ),
            const SizedBox(height: 9),
            Text(
              price,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: green,
              ),
            ),
            const SizedBox(height: 9),
            ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(const Size(81, 23)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5)),
                  backgroundColor: MaterialStateProperty.all(orange),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  )),
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 10))),
              onPressed: addToCart,
              child: Text(
                '${locale[curLN]?["addCart"]}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        )),
      ],
    );
  }
}
