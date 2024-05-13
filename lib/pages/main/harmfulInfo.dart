// ignore_for_file: file_names, deprecated_member_use

import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/harmful.dart';
import 'package:flutter/material.dart';

// var _liked = false;

class HarmfulInfo extends StatelessWidget {
  final int index;
  const HarmfulInfo({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 25,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.chevron_left_rounded),
            ),
            Expanded(
                child:
                    Center(child: Text('${locale[curLN]?["harmfullInfo"]}'))),
            // SizedBox(
            //   width: 20,
            //   height: 20,
            //   child: GestureDetector(
            //       onTap: () => Share.share('text'),
            //       child: SvgPicture.asset('assets/icons/share.svg')),
            // ),
            // const SizedBox(width: 22),
            // SizedBox(
            //   width: 20,
            //   height: 20,
            //   child: GestureDetector(
            //     onTap: () {
            //       _liked = !_liked;
            //       setState(() {});
            //     },
            //     child: (_liked)
            //         ? SvgPicture.asset('assets/icons/redHeart.svg')
            //         : SvgPicture.asset(
            //             'assets/icons/heart.svg',
            //             color: Colors.black.withOpacity(0.75),
            //           ),
            //   ),
            // ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 157,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  harmfulList[index]['img'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              harmfulList[index]['title'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(harmfulList[index]['text']),
          ],
        ),
      ),
    );
  }
}
