import 'package:apte/data/dio.dart';
import 'package:apte/data/model/user/controller.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/profile/adres.dart';
import 'package:apte/pages/profile/habarlasmak.dart';
import 'package:apte/pages/profile/lang.dart';
import 'package:apte/pages/profile/product_page.dart.dart';
import 'package:apte/pages/profile/sargyt.dart';
import 'package:apte/pages/profile/user.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:apte/widgets/circul.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/controller/langController.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

final List hasap = [
  ['assets/icons/profile/sargytlarym.svg', '', () => const Sargyt()],
  ['assets/icons/profile/adres.svg', '', () => const Adres()],
  ['assets/icons/profile/like.svg', ''],
];
final List sazlama = [
  [
    'assets/icons/profile/language.svg',
    '',
    '',
    () => Get.to(() => const Language())
  ],
];
final List habarlas = [
  [
    'assets/icons/profile/call.svg',
    '',
    () => Get.to(() => const Habarlasmak()),
  ],
  [
    'assets/icons/profile/info.svg',
    '',
    () async {
      if (!await launchUrl(Uri.parse('http://sagdyndiyar.com.tm/'))) {
        throw Exception('couldn\'t open url');
      }
    }
  ],
];

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LangCont>(builder: (lc) {
      sazlama[0][2] = (curLN == 'tm')
          ? 'Türkmen'
          : (curLN == 'ru')
              ? 'Русский'
              : 'English';
      sazlama[0][1] = '${locale[curLN]?['changeLang']}';
      habarlas[0][1] = '${locale[curLN]?['contactUs']}';
      habarlas[1][1] = '${locale[curLN]?['aboutUs']}';
      hasap[0][1] = '${locale[curLN]?['myOrders']}';
      hasap[1][1] = '${locale[curLN]?['myAdres']}';
      hasap[2][1] = '${locale[curLN]?['myLikes']}';
      return GetBuilder<UserController>(
          init: UserController(),
          builder: (uc) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text('${locale[curLN]?['profile']}'),
              ),
              body: SingleChildScrollView(
                controller: contrl,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: uc.isLoad
                    ? const Circul()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => Get.to(() => const User()),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: green,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                        'assets/icons/user.svg'),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.name ?? '',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        '+993 ${user.phone}',
                                        style: const TextStyle(
                                          color: Color.fromRGBO(99, 99, 99, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Color.fromRGBO(173, 173, 173, 1),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 27),
                          Text(
                            '${locale[curLN]?['myProfile']}',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Column(
                            children: List.generate(
                                hasap.length,
                                (index) => Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (index == 2) {
                                              Get.to(() => ProfileProductsPage(
                                                  text: hasap[index][1]));
                                            } else {
                                              Get.to(hasap[index][2]);
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    hasap[index][0]),
                                                const SizedBox(width: 20),
                                                Text(hasap[index][1]),
                                                const Spacer(),
                                                const Icon(
                                                  Icons.chevron_right_rounded,
                                                  color: Color.fromRGBO(
                                                      173, 173, 173, 1),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 1,
                                          color: const Color.fromRGBO(
                                              237, 237, 237, 1),
                                        ),
                                      ],
                                    )),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            '${locale[curLN]?['settings']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Column(
                            children: List.generate(
                                sazlama.length,
                                (index) => Column(
                                      children: [
                                        InkWell(
                                          onTap: sazlama[index][3],
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    sazlama[index][0]),
                                                const SizedBox(width: 20),
                                                Text(sazlama[index][1]),
                                                const Spacer(),
                                                Text(
                                                  sazlama[index][2],
                                                  style: const TextStyle(
                                                      color: orange),
                                                ),
                                                const SizedBox(width: 23),
                                                const Icon(
                                                  Icons.chevron_right_rounded,
                                                  color: Color.fromRGBO(
                                                      173, 173, 173, 1),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 1,
                                          color: const Color.fromRGBO(
                                              237, 237, 237, 1),
                                        ),
                                      ],
                                    )),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            '${locale[curLN]?['contactUs']}',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Column(
                            children: List.generate(
                                habarlas.length,
                                (index) => Column(
                                      children: [
                                        InkWell(
                                          onTap: habarlas[index][2],
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    habarlas[index][0]),
                                                const SizedBox(width: 20),
                                                Text(habarlas[index][1]),
                                                const Spacer(),
                                                const Icon(
                                                  Icons.chevron_right_rounded,
                                                  color: Color.fromRGBO(
                                                      173, 173, 173, 1),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 1,
                                          color: const Color.fromRGBO(
                                              237, 237, 237, 1),
                                        ),
                                      ],
                                    )),
                          ),
                          InkWell(
                            onTap: () => Dioo().logOut(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/profile/singOut.svg'),
                                  const SizedBox(width: 20),
                                  Text(
                                    '${locale[curLN]?['logOut']}',
                                    style: const TextStyle(color: red),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            );
          });
    });
  }
}
