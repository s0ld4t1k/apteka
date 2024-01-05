import 'package:apte/widgets/reklam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
var _liked=false;
class HarmfulInfo extends StatefulWidget {
  const HarmfulInfo({super.key});

  @override
  State<HarmfulInfo> createState() => _HarmfulInfoState();
}

class _HarmfulInfoState extends State<HarmfulInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 25,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.chevron_left_rounded),
            ),
            SizedBox(width: 23,),
            Expanded(child: Text('Peýdaly maglumat')),
            GestureDetector(
              onTap: () {
                Share.share('text');
              },
              child: SvgPicture.asset('assets/icons/share.svg')
            ),
            SizedBox(width: 22,),
            Container(
              width: 17,
              height: 14,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _liked=!_liked;
                  });
                },
                child: (_liked)?SvgPicture.asset('assets/icons/redHeart.svg')
                :SvgPicture.asset('assets/icons/heart.svg',color: Colors.black,)
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 325,
                height: 157,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/images/harmfulBanner2.png',fit: BoxFit.fill,),
              ),
            ),
            SizedBox(height: 15,),
            Text('C witamin näme we onuň saglyga nähili peýdasy bar?',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: 10,),
            Text('12/12/2023ý',style: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(141, 141, 141, 1),
            ),),
            SizedBox(height: 18,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Witamin C näme?',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),),
                SizedBox(height: 12,),
                Text('Antioksidant täsiri bar. Demiriň has gowy siňmegine we gematopoeziň kadalaşmagyna kömek edýär. Gan damarlarynyň çeýeligini we kapilýar geçirijiligini ýokarlandyrýar. Merkezi nerw ulgamyna peýdaly täsir edýär.\nAntioksidant täsiri bar. Demiriň has gowy siňmegine we gematopoeziň kadalaşmagyna kömek edýär. \nGan damarlarynyň çeýeligini we kapilýar geçirijiligini ýokarlandyrýar.'),
                SizedBox(height: 28,),
                Reklam(photo: 'assets/images/vitaminC.png',),
                SizedBox(height: 28,),
                Text('Nähili peýdasy bar?',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),),
                SizedBox(height: 12,),
                Text('Antioksidant täsiri bar. Demiriň has gowy siňmegine we gematopoeziň kadalaşmagyna kömek edýär. Gan damarlarynyň çeýeligini we kapilýar geçirijiligini ýokarlandyrýar. Merkezi nerw ulgamyna peýdaly täsir edýär.\nAntioksidant täsiri bar. Demiriň has gowy siňmegine we gematopoeziň kadalaşmagyna kömek edýär. Gan damarlarynyň çeýeligini we kapilýar geçirijiligini ýokarlandyrýar.'),
                SizedBox(height: 28,),
                Reklam(),
                SizedBox(height: 28,),
                Text('Antioksidant täsiri bar. Demiriň has gowy siňmegine we gematopoeziň kadalaşmagyna kömek edýär. Gan damarlarynyň çeýeligini we kapilýar geçirijiligini ýokarlandyrýar.'),
                SizedBox(height: 30,),
              ],
            )
          ],
        ),
      ),
    );
  }
}