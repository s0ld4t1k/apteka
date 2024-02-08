import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
List hasap=[
  [
    'assets/icons/profile/sargytlarym.svg',
    'Sargytlarym',
    '/profile/sargyt',
  ],
  [
    'assets/icons/profile/adres.svg',
    'Salgylarym',
    '/profile/adres',
  ],
  [
    'assets/icons/profile/like.svg',
    'Halanlarym',
    '/profile/like',
  ],
];
List sazlama=[
  [
    'assets/icons/profile/language.svg',
    'Dil üýtgetmek',
    'Türkmen',
    '/profile/lang',
  ],
];
List habarlas=[
  [
    'assets/icons/profile/call.svg',
    'Habarlaşmak',
    '/profile/habarlasmak',
  ],
  [
    'assets/icons/profile/info.svg',
    'Biz barada',
    '',
  ],
];
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/profile/user'),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: green,
                    ),
                    child: Center(child: SvgPicture.asset('assets/icons/user.svg')),
                  ),
                  const SizedBox(width: 15,),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Merjen Annaýewa',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),),
                        SizedBox(height: 6,),
                        Text('+99361616161',style: TextStyle(
                          color: Color.fromRGBO(99, 99, 99, 1),
                        ),)
                      ],
                    )
                  ),
                  const Icon(Icons.chevron_right_rounded,color: Color.fromRGBO(173, 173, 173, 1),),
                ],
              ),
            ),
            const SizedBox(height: 27,),
            const Text('Hasabym',style: TextStyle(
              fontWeight: FontWeight.w500,
            ),),
            Column(
              children: List.generate(hasap.length, (index) => Column(
                children: [
                  InkWell(
                    onTap: ()=>Navigator.pushNamed(context, hasap[index][2]),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        children: [
                          SvgPicture.asset(hasap[index][0]),
                          const SizedBox(width: 20,),
                          Text(hasap[index][1]),
                          const Spacer(),
                          const Icon(Icons.chevron_right_rounded,color: Color.fromRGBO(173, 173, 173, 1),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color.fromRGBO(237, 237, 237, 1),
                  ),
                ],
              )),
            ),
            const SizedBox(height: 30,),
            const Text('Sazlamalar',style: TextStyle(
              fontWeight: FontWeight.w500,
            ),),
            Column(
              children: List.generate(sazlama.length, (index) => Column(
                children: [
                  InkWell(
                    onTap: ()=>Navigator.pushNamed(context, sazlama[index][3]),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        children: [
                          SvgPicture.asset(sazlama[index][0]),
                          const SizedBox(width: 20,),
                          Text(sazlama[index][1]),
                          const Spacer(),
                          Text(sazlama[index][2],style: const TextStyle(color: orange),),
                          const SizedBox(width: 23,),
                          const Icon(Icons.chevron_right_rounded,color: Color.fromRGBO(173, 173, 173, 1),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color.fromRGBO(237, 237, 237, 1),
                  ),
                ],
              )),
            ),
            const SizedBox(height: 30,),
            const Text('Habarlaşmak',style: TextStyle(
              fontWeight: FontWeight.w500,
            ),),
            Column(
              children: List.generate(habarlas.length, (index) => Column(
                children: [
                  InkWell(
                    onTap: ()=>Navigator.pushNamed(context, habarlas[index][2]),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        children: [
                          SvgPicture.asset(habarlas[index][0]),
                          const SizedBox(width: 20,),
                          Text(habarlas[index][1]),
                          const Spacer(),
                          const Icon(Icons.chevron_right_rounded,color: Color.fromRGBO(173, 173, 173, 1),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color.fromRGBO(237, 237, 237, 1),
                  ),
                ],
              )),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/profile/singOut.svg'),
                    const SizedBox(width: 20,),
                    const Text('Hasapdan çyk',style: TextStyle(
                      color: red,
                    ),),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}