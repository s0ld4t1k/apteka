import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/horizontalProducts.dart';
import 'package:flutter/material.dart';

class BagProduct extends StatefulWidget {
  final index;
  BagProduct({super.key, this.index});

  @override
  State<BagProduct> createState() => _BagProductState();
}

class _BagProductState extends State<BagProduct> {
  var _count=1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color.fromRGBO(242, 242, 242, 1),),
          ),
          height: 100,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: 90,
                height: 100,
                child: Image.asset(productList[widget.index][0]),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 16,right: 34,top: 12,bottom: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productList[widget.index][1],style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                      Text(productList[widget.index][4],style: TextStyle(
                        color: Color.fromRGBO(113, 114, 122, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        if(_count>1)_count--;
                                      });
                                    },
                                    splashRadius: 15, 
                                    padding: EdgeInsets.all(0),
                                    constraints: BoxConstraints(
                                      maxHeight: 24,
                                      maxWidth: 24,
                                      minHeight: 24,
                                      minWidth: 24,
                                    ),
                                    icon: Icon(Icons.remove_rounded,color:green),
                                  ),
                                ),
                                Text(_count.toString()),
                                Container(
                                  decoration: BoxDecoration(
                                    color: green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _count++;
                                      });
                                    },
                                    splashRadius: 15, 
                                    padding: EdgeInsets.all(0),
                                    constraints: BoxConstraints(
                                      maxHeight: 24,
                                      maxWidth: 24,
                                      minHeight: 24,
                                      minWidth: 24,
                                    ),
                                    icon: Icon(Icons.add_rounded,color:green),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Text(productList[widget.index][2],style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 11,
          right: 14,
          child: IconButton(
            onPressed: (){
              setState(() {
                productList.removeAt(widget.index);
              });
            }, 
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(
              maxHeight: 20,
              maxWidth: 20,
              minHeight: 20,
              minWidth: 20,
            ),
            icon: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(color: green,width: 1.2),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Icon(Icons.close_rounded,color: green,size: 16,),
            )
          )
        )
      ],
    );
  }
}