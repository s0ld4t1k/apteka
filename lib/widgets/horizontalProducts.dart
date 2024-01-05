import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
List productList=[
  ['assets/images/multiVitamin.png','Мультивитамины для детей 250ml','12.00 TMT',false,],
  ['assets/images/melotanin.png','Мультивитамины для детей 250ml','12.00 TMT',false,],
  ['assets/images/prostamol.png','Простамол Уно капсулы 320 мг 30 шт','12.00 TMT',false,],
  ['assets/images/gel.png','Мультивитамины для детей 250ml','12.00 TMT',false,],
  ['assets/images/spray.png','Мультивитамины для детей 250ml','12.00 TMT',false,],
  ['assets/images/lorangin.png','Мультивитамины для детей 250ml','12.00 TMT',false,],
  ['assets/images/vitaminC.png','ВитаМишки BIO+ пребиотик жеват пастилки №60','12.00 TMT',false,],
];
class HorizontalProducts extends StatefulWidget {
  final text;
  HorizontalProducts({super.key,required this.text});

  @override
  State<HorizontalProducts> createState() => _HorizontalProductsState();
}

class _HorizontalProductsState extends State<HorizontalProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 25,right: 15,top: 10),
          child: Row(
            children: [
              Text(widget.text,style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
              Spacer(),
              TextButton(
                onPressed: (){}, 
                child: Text('Ählisini gör',style: TextStyle(
                  color: green,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),)
              )
            ],
          ),
        ),
        // SizedBox(height: 15,),
        Container(
          height: 165,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 25,),
              Row(
                children: List.generate(productList.length, (index) => Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  width: 142,
                  height: 164,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        offset: Offset(0, 1),
                        color: Colors.black.withOpacity(0.05),
                      )
                    ]
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(12),
                              child: Image.asset(productList[index][0]),
                            ),
                          ),
                          Text(productList[index][1],style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 10,),
                          Text(productList[index][2],style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: green,
                          ),),
                          SizedBox(height: 16,),
                        ],
                      ),
                      Positioned(
                        right: 1,
                        bottom: 10,
                        child: InkWell(
                          onTap: () {
                            print('add to cart');
                          },
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: Icon(Icons.add,color: Colors.white,),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              )
            ],
          ),
        )
      ],
    );
  }
}