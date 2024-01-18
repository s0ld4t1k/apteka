import 'package:apte/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
List like=[
  ['assets/images/multiVitamin.png','Мультивитамины для детей 250ml','12.00 TMT',false,'Фармакор продакшн ООО',1,],
  ['assets/images/melotanin.png','Мультивитамины для детей 250ml','12.00 TMT',false,'Фармакор продакшн ООО',1,],
  ['assets/images/prostamol.png','Простамол Уно капсулы 320 мг 30 шт','12.00 TMT',false,'Фармакор продакшн ООО',1,],
  ['assets/images/gel.png','Мультивитамины для детей 250ml','12.00 TMT',false,'Фармакор продакшн ООО',1,],
  ['assets/images/spray.png','Мультивитамины для детей 250ml','12.00 TMT',false,'Фармакор продакшн ООО',1,],
  ['assets/images/lorangin.png','Мультивитамины для детей 250ml','12.00 TMT',false,'Фармакор продакшн ООО',1,],
  ['assets/images/vitaminC.png','ВитаМишки BIO+ пребиотик жеват пастилки №60','12.00 TMT',false,'Фармакор продакшн ООО',1,],
];
class Like extends StatefulWidget {
  const Like({super.key});

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bc,
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
        title: Text('Halanlarym'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: 
        like.isEmpty?Column(
          children: [
            Image.asset('assets/images/like.png'),
            SizedBox(height: 59,),
            Text('Siziň halan harytlaryňyz tapylmady',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: 21,),
            Text('Bu sahypada siziň halan harytlaryňyz ýerleşer',style: TextStyle(
              color: Color.fromRGBO(131, 135, 140, 1),
            ),
            textAlign: TextAlign.center,)
          ],
        ):
        Column(
          children: [
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 155,
                mainAxisExtent: 170,
                mainAxisSpacing: 17,
                crossAxisSpacing: 21,
              ),
              children: List.generate(like.length, (index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/mainPage/productPage'),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, 1),
                            color: Colors.black.withOpacity(0.05),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              child: Image.asset(like[index][0]),
                            ),
                          ),
                          SizedBox(height: 2+6,),
                          Text(like[index][1],style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,maxLines: 2,),
                          SizedBox(height: 6,),
                          Text(like[index][2],style: TextStyle(
                            color: green,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),)
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 9,
                      right: 15,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            like[index][3]=!like[index][3];
                          });
                        },
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: orange,
                          ),
                          child: Icon(
                            like[index][3]?Icons.done:Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 19,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            like.removeAt(index);
                          });
                        },
                        child: SvgPicture.asset('assets/icons/redHeart.svg')
                      ), 
                    )
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}