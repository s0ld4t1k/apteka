import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
List _kategoryList=[
  ['Sowuklama','assets/kategory/mask.png',],
  ['Derman serişdeleri','assets/kategory/derman.png',],
  ['Gigiýena','assets/kategory/tooth.png',],
  ['Şeker keseli','assets/kategory/blood.png',],
  ['Lukmançylyk enjamlary','assets/kategory/stetoscope.png',],
  ['Antibiotikler','assets/kategory/sirop.png',],
  ['Şeker keseli','assets/kategory/pistol.png',],
  ['Antiseptikler we kosmetika','assets/kategory/mylo.png',],
  ['Süňk-skelet ','assets/kategory/bone.png',],
  ['Ene we çaga','assets/kategory/pregnant.png',],
  ['Optika','assets/kategory/lupa.png',],
  ['Süňk-skelet ','assets/kategory/medicine.png',],
];
class Kategory extends StatelessWidget {
  const Kategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Kategoriýa'),),
        body: SingleChildScrollView(
          controller: contrl,
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(249, 249, 249, 1),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 20,
                      minHeight: 20,
                      minWidth: 20,
                    ),
                    suffixIcon: SvgPicture.asset('assets/icons/search.svg',color: green),
                    hintText: 'Ady boýunça gözle',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: textGrey3,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 111,
                  mainAxisExtent:  135,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 20,
                ),
                itemBuilder:(context, index) {
                  return GestureDetector(
                    onTap: ()=>Navigator.of(context).pushNamed('/kategory/subKategory'),
                    child: Container(
                      height: 135,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: 111,
                              height: 119,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(250, 250, 250, 1),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 22,
                            child: Text(_kategoryList[index][0],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                          Positioned(
                            top: 0,
                            left: 10,
                            right: 10,
                            // bottom: 60,
                            child: Container(
                              // color: Colors.pink,
                              width: 80,
                              height: 80,
                              child: Image.asset(_kategoryList[index][1])
                            )
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _kategoryList.length,
              )
            ],
          )
        ),
      ),
    );
  }
}