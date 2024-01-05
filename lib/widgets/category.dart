import 'package:flutter/material.dart';
List _categoryList=[
  ['assets/icons/tooth.png','Diş agyry',Color.fromRGBO(255, 200, 201, 1),],
  ['assets/icons/orgHeart.png','Ýürek agyry',Color.fromRGBO(168, 236, 237, 1),],
  ['assets/icons/lungs.png','Öýken agyry',Color.fromRGBO(209, 249, 180, 1),],
  ['assets/icons/stomach.png','Iç agyry',Color.fromRGBO(255, 201, 169, 1),],
  ['assets/icons/bandage.png','Ten agyry',Color.fromRGBO(200, 242, 239, 1),],
];
class MainCategory extends StatelessWidget {
  const MainCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 25),
          child: Text('Nähili agyryňyz bar ?',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),),
        ),
        SizedBox(height: 15,),
        Container(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 20,),
              Row(
                children: List.generate(_categoryList.length, (index) => Container(
                  width: 75,
                  child: Column(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _categoryList[index][2],
                        ),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(_categoryList[index][0],)
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(_categoryList[index][1],style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                ),),
              )
            ]
          ),
        ),
      ],
    );
  }
}