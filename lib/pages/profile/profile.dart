import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
List hasap=[
  [
    'assets/icons/profile/sargytlarym.svg',
    'Sargytlarym',
    '',
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
        title: Text('Profil'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
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
                  SizedBox(width: 15,),
                  Expanded(
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
                  Icon(Icons.chevron_right_rounded,color: Color.fromRGBO(173, 173, 173, 1),),
                ],
              ),
            ),
            SizedBox(height: 27,),
            Text('Hasabym',style: TextStyle(
              fontWeight: FontWeight.w500,
            ),),
            Column(
              children: List.generate(hasap.length, (index) => Column(
                children: [
                  InkWell(
                    onTap: ()=>Navigator.pushNamed(context, hasap[index][2]),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        children: [
                          SvgPicture.asset(hasap[index][0]),
                          SizedBox(width: 20,),
                          Text(hasap[index][1]),
                          Spacer(),
                          Icon(Icons.chevron_right_rounded,color: Color.fromRGBO(173, 173, 173, 1),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Color.fromRGBO(237, 237, 237, 1),
                  ),
                ],
              )),
            ),
            SizedBox(height: 30,),
            Text('Sazlamalar',style: TextStyle(
              fontWeight: FontWeight.w500,
            ),),
            Column(
              children: List.generate(sazlama.length, (index) => Column(
                children: [
                  InkWell(
                    onTap: ()=>Navigator.pushNamed(context, sazlama[index][3]),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        children: [
                          SvgPicture.asset(sazlama[index][0]),
                          SizedBox(width: 20,),
                          Text(sazlama[index][1]),
                          Spacer(),
                          Text(sazlama[index][2],style: TextStyle(color: orange),),
                          SizedBox(width: 23,),
                          Icon(Icons.chevron_right_rounded,color: Color.fromRGBO(173, 173, 173, 1),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Color.fromRGBO(237, 237, 237, 1),
                  ),
                ],
              )),
            ),
            SizedBox(height: 30,),
            Text('Habarlaşmak',style: TextStyle(
              fontWeight: FontWeight.w500,
            ),),
            Column(
              children: List.generate(habarlas.length, (index) => Column(
                children: [
                  InkWell(
                    onTap: ()=>Navigator.pushNamed(context, habarlas[index][2]),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        children: [
                          SvgPicture.asset(habarlas[index][0]),
                          SizedBox(width: 20,),
                          Text(habarlas[index][1]),
                          Spacer(),
                          Icon(Icons.chevron_right_rounded,color: Color.fromRGBO(173, 173, 173, 1),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Color.fromRGBO(237, 237, 237, 1),
                  ),
                ],
              )),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/profile/singOut.svg'),
                    SizedBox(width: 20,),
                    Text('Hasapdan çyk',style: TextStyle(
                      color: red,
                    ),),
                    Spacer(),
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