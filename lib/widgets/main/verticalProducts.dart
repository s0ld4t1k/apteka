import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/main/horizontalProducts.dart';
import 'package:flutter/material.dart';

class VerticalProducts extends StatefulWidget {
  const VerticalProducts({super.key});

  @override
  State<VerticalProducts> createState() => _VerticalProductsState();
}

class _VerticalProductsState extends State<VerticalProducts> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 152,
        mainAxisExtent: 168,
        mainAxisSpacing: 18,
        crossAxisSpacing: 21,
      ),
      children: List.generate(productList.length, (index) => GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/mainPage/productPage'),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
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
                      padding: EdgeInsets.all(12),
                      child: Center(child: Image.asset(productList[index][0],fit: BoxFit.fill,)),
                    ),
                  ),
                  Text(productList[index][1],style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 6,),
                  Text(productList[index][2],style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: green,
                  ),),
                  SizedBox(height: 16,),
                ],
              ),
              Positioned(
                right: 3,
                bottom: 11,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      productList[index][3]=!productList[index][3];
                    });
                    print('add to cart');
                  },
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: orange,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Icon(
                      (productList[index][3])?
                      Icons.done:Icons.add,color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}