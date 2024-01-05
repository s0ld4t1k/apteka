import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';

class Reklam extends StatelessWidget {
  final photo,text,text2,price;

  const Reklam({
    super.key, 
    this.photo='assets/images/spray.png',
    this.text='ВитаМишки BIO+ пребиотик жеват пастилки №60', 
    this.text2='Трог Медикал GMBH- Германия', 
    this.price='12.00 TMT',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 115,
          height: 121,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                offset: Offset(0,1),
                color: Colors.black.withOpacity(0.05),
              )
            ]
          ),
          child: Image.asset(photo,),
        ),
        SizedBox(width: 19,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text,style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),),
              SizedBox(height: 5,),
              Text(text2,style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color.fromRGBO(160, 160, 160, 1),
              ),),
              SizedBox(height: 9,),
              Text(price,style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: green,
              ),),
              SizedBox(height: 9,),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(81, 23)),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor: MaterialStateProperty.all(orange),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ))
                ),
                onPressed: (){
                  
                }, 
                child: Text('Sebede goş',style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),),
              )
            ],
          )
        ),
      ],
    );
  }
}