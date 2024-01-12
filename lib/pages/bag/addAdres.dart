import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
var _selectedAdres=false;
List adressList=[
  ['Garaşsyzlyk şaýoly, 52 jaý, 107 otag',],
];
class AddAdres extends StatefulWidget {
  const AddAdres({super.key});

  @override
  State<AddAdres> createState() => _AddAdresState();
}

class _AddAdresState extends State<AddAdres> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Wrap(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text('Salgyňyz',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  Spacer(),
                  IconButton(
                    onPressed: ()=>Navigator.pop(context), 
                    icon: Icon(Icons.close),
                  )
                ],
              ),
              SizedBox(height: 23,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedAdres=!_selectedAdres;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _selectedAdres?green:Color.fromRGBO(237, 237, 237, 1),
                    )
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text(adressList.last[0])),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedAdres?green:Color.fromRGBO(216, 216, 216, 1),
                            width: _selectedAdres?4:2,
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 13,),
              Container(
                width: 108,
                height: 18,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0))
                  ),
                  onPressed: (){}, 
                  child: Text('+ Täze salgy goş',style: TextStyle(
                    color: orange,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))
                ),
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text('Şu salgyny ulan',style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),)
              ),
              SizedBox(height: 50,),
            ],
          ),
        ],
      ),
    );
  }
}