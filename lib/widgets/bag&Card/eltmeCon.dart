import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
var curEltme=0;

class EltmeCon extends StatelessWidget {
  final text1,text2,index;
  const EltmeCon({this.text1, this.text2, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      decoration: BoxDecoration(
        color: index==curEltme
        ?green.withOpacity(0.1):null,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: index==curEltme
          ?green:const Color.fromRGBO(242, 242, 242, 1),
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity-40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text1,style: const TextStyle(
                    color: Color.fromRGBO(107, 107, 107, 1),
                  ),),
                  Text(text2,style: const TextStyle(
                    color: green,
                    fontSize: 12,
                  ),),
                ],
              ),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: index==curEltme?4:1,
                color: index==curEltme
                ?green:const Color.fromRGBO(242, 242, 242, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}