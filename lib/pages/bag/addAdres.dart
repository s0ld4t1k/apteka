// ignore_for_file: file_names

import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
int _selectedAdres=-1;
List adressList=[
  ['Garaşsyzlyk şaýoly, 52 jaý, 107 otag',],
  ['Garaşsyzlyk şaýoly, 52 jaý, 107 otag',],
  ['Arçabil şaýoly jaý 142 , 3-nji etaj otag 25, Ar-çabil şaýoly jaý 142 , 3-nji etaj otag 25',],
  ['Arçabil şaýoly jaý 142 , 3-nji etaj otag 25, Ar-çabil şaýoly jaý 142 , 3-nji etaj otag 25',],
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
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Wrap(
        children: [
          Column(
            children: [
              Row(
                children: [
                   Text('${locale[curLN]?['adres']}',style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  const Spacer(),
                  IconButton(
                    onPressed: ()=>Navigator.pop(context), 
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(height: 23,),
              SizedBox(
                height: 140,
                child: ListView(
                  children: List.generate(adressList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedAdres=index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _selectedAdres==index?green:const Color.fromRGBO(237, 237, 237, 1),
                          )
                        ),
                        child: Row(
                          children: [
                            Expanded(child: Text(adressList[index][0],maxLines: 1,overflow: TextOverflow.ellipsis,)),
                            const SizedBox(width: 10,),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: _selectedAdres==index?green:const Color.fromRGBO(216, 216, 216, 1),
                                  width: _selectedAdres==index?4:2,
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                width: 108,
                height: 18,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0))
                  ),
                  onPressed: ()=>Navigator.pushNamed(context, '/bag/salgym'), 
                  child:  Text('+ ${locale[curLN]?['addNewAdres']}',style: const TextStyle(
                    color: orange,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))
                ),
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child:  Text('${locale[curLN]?['useThisAdres']}',style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),)
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ],
      ),
    );
  }
}