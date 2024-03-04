import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/widgets/bag&Card/cart_product_list.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SargytPage extends StatelessWidget {
  const SargytPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(CupertinoIcons.chevron_back),
        ),
        title: Text('Sargyt'),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              itemBuilder:(context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Color.fromRGBO(242, 242, 242, 1)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 74,
                      height: 76,
                      child: Image.asset(cartProductList[index]['img'],fit: BoxFit.contain,),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartProductList[index]['name'],style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 5,),
                          Text(cartProductList[index]['desc'],style: TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(113, 114, 122, 1),
                          ),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(child: Text('${cartProductList[index]['price']} TMT',style: TextStyle(
                                color: orange,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),)),
                              Text('${cartProductList[index]['count']} sany',style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(129, 129, 129, 1),
                              ),)
                            ],
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ), 
              separatorBuilder:(context, index) => SizedBox(height: 15,), 
              itemCount: cartProductList.length
            ),
            Devider(),
            Text('Haryt sany: ${cartProductList.length}',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),),
            SizedBox(height: 15,),
            Row(
              children: [
                Expanded(child: Text(locale[curLN]!['resPrice']!,style: TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),)),
                Text(' TMT',style: TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),),
              ],
            ),
            SizedBox(height: 14,),
            Row(
              children: [
                Expanded(child: Text(locale[curLN]!['arzanladysh']!,style: TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),)),
                Text(' TMT',style: TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),),
              ],
            ),
            SizedBox(height: 14,),
            Row(
              children: [
                Expanded(child: Text(locale[curLN]!['deliveryHyzmat']!,style: TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),)),
                Text(' TMT',style: TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),),
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 15),
              color: Color.fromRGBO(184, 184, 184, 1),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(locale[curLN]!['res']!,style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),),
                ),
                Text(' TMT',style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),)
              ],
            ),
            SizedBox(height: 26,),
            OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(color: red)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
              ),
              onPressed: (){
                Get.back();
              }, 
              child:  Text('Goýbolsun et',style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: red
              ),)
            ),
            SizedBox(height: 23,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(orange),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 50))
              ),
              onPressed: (){
                selectedTab=0;
                Get.offAll(()=>MainPage());
              }, 
              child: Text('Söwda dowam et',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),)
            )
          ],
        ),
      ),
    );
  }
}