import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
List subKategory=[
  'Akuşerlik, ginekologiýa',
  'Dermotologiýa',
  'Immun ulgamy',
  'Onkologiýa',
  'Agyry aýyryjylar, anestezik',
  'Allergiýa garşy',
  'Stomatologik serişdeler',
  'Nerw ulgamy',
  'Parazitlere garşy',
  'Dem alyş ulgamy',
];
class SubKategory extends StatefulWidget {
  const SubKategory({super.key});

  @override
  State<SubKategory> createState() => _SubKategoryState();
}

class _SubKategoryState extends State<SubKategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: EdgeInsets.all(0),
          constraints: BoxConstraints(
            maxHeight: 24,
            maxWidth: 24,
            minHeight: 24,
            minWidth: 24,
          ),
          onPressed: ()=>Navigator.pop(context), 
          icon: Icon(Icons.chevron_left_rounded)
        ),
        title: Text('Derman serişdeleri'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 1,
              color: Color.fromRGBO(237, 237, 237, 1),
            );
          },
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () =>Navigator.of(context).pushNamed('/kategory/subKategoryPage'),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Text(subKategory[index],style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),),
                    Spacer(),
                    Icon(Icons.chevron_right_rounded),
                  ],
                ),
              ),
            );
          },
          itemCount: subKategory.length,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(bottomAppBarList.length, (index) => 
            (index==2)?
            GestureDetector(
              onTap: () {
                selectedTab=index;
                Navigator.of(context).pushNamedAndRemoveUntil('/',(_)=>false);
              },
              child: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(46),
                ),
                child: Center(child: SvgPicture.asset(bottomAppBarList[index])),
              ),
            )
            :IconButton(
              onPressed: (){
                setState(() {
                  selectedTab=index;
                  Navigator.of(context).pushNamedAndRemoveUntil('/',(_)=>false);
                });
              }, 
              icon: SvgPicture.asset(
                bottomAppBarList[index],
                color: (selectedTab==index)?green:tabIconGrey,
              ),
            ),),
          ),
        ),
      ),
    );
  }
}