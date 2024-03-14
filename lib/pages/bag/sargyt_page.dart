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
          icon: const Icon(CupertinoIcons.chevron_back),
        ),
        title: Text(locale[curLN]!['order']!),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              itemBuilder:(context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: const Color.fromRGBO(242, 242, 242, 1)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 74,
                      height: 76,
                      child: Image.asset(cartProductList[index]['img'],fit: BoxFit.contain,),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartProductList[index]['name'],style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,overflow: TextOverflow.ellipsis,),
                          const SizedBox(height: 5,),
                          Text(cartProductList[index]['desc'],style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(113, 114, 122, 1),
                          ),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(child: Text('${cartProductList[index]['price']} TMT',style: const TextStyle(
                                color: orange,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),)),
                              Text('${cartProductList[index]['count']} sany',style: const TextStyle(
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
              separatorBuilder:(context, index) => const SizedBox(height: 15,), 
              itemCount: cartProductList.length
            ),
            const Devider(),
            Text('${locale[curLN]!['productCount']!} ${cartProductList.length}',style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),),
            const SizedBox(height: 15,),
            Row(
              children: [
                Expanded(child: Text(locale[curLN]!['resPrice']!,style: const TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),)),
                const Text(' TMT',style: TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),),
              ],
            ),
            const SizedBox(height: 14,),
            Row(
              children: [
                Expanded(child: Text(locale[curLN]!['arzanladysh']!,style: const TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),)),
                const Text(' TMT',style: TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),),
              ],
            ),
            const SizedBox(height: 14,),
            Row(
              children: [
                Expanded(child: Text(locale[curLN]!['deliveryHyzmat']!,style: const TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),)),
                const Text(' TMT',style: TextStyle(
                  color: Color.fromRGBO(131, 133, 137, 1),
                ),),
              ],
            ),
            Container(
              height: 1,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 15),
              color: const Color.fromRGBO(184, 184, 184, 1),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(locale[curLN]!['res']!,style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),),
                ),
                const Text(' TMT',style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),)
              ],
            ),
            const SizedBox(height: 26,),
            OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(const BorderSide(color: red)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
              ),
              onPressed: (){
                Get.back();
              }, 
              child: Text(locale[curLN]!['cancel']!,style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: red
              ),)
            ),
            const SizedBox(height: 23,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(orange),
                minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50))
              ),
              onPressed: (){
                selectedTab=0;
                Get.offAll(()=>const MainPage());
              }, 
              child: Text(locale[curLN]!['continueShop']!,style: const TextStyle(
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