import 'package:flutter/material.dart';
List filtrList=[
  [
    'Arzanladyş',
    [
      'Arzanladyş',
    ],
  ],
  [
    'Göwrüm',
    [
      '10 ml',
      '5 ml',
      '15 ml',
    ],
  ],
  [
    'Öndüriji ýurt',
    [
      'Russiýa',
      'Fransiýa',
      'Germaniýa',
      'Hindistan',
      'Belorussiýa',
      'Eýran',
      'Türkmenistan',
      'Türkiýe',
    ],
  ],
  [
    'Jyns',
    [
      'Aýal',
      'Erkek',
      'Çaga',
    ],
  ],
];
class FiltrBottomSheet extends StatefulWidget {
  const FiltrBottomSheet({super.key});

  @override
  State<FiltrBottomSheet> createState() => _FiltrBottomSheetState();
}

class _FiltrBottomSheetState extends State<FiltrBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: 645,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Filtr',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.all(0),
                    constraints: BoxConstraints(
                      maxHeight: 24,
                      maxWidth: 24,
                      minHeight: 24,
                      minWidth: 24,
                    ),
                    onPressed: ()=>Navigator.pop(context), 
                    icon: Icon(Icons.close),
                  )
                ],
              ),
              SizedBox(height: 28,),
              Container(
                height: 510,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(filtrList[index][0],style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),),
                        SizedBox(height: 15,),
                        Wrap(
                          spacing: 12,
                          runSpacing: 9,
                          children: List.generate(filtrList[index][1].length, (i) => Container(
                            height: 30,
                            child: OutlinedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                                  horizontal: 20
                                )),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                )),
                                minimumSize: MaterialStateProperty.all(Size(80,30))
                              ),
                              onPressed: (){}, 
                              child: Text(filtrList[index][1][i], style: TextStyle(
                                color: Color.fromRGBO(71, 71, 71, 1),
                              ),),
                            ),
                          ),),
                        ),
                      ],
                    );
                  }, 
                  separatorBuilder:(context, index) {
                    return Container(
                      height: 1,
                      margin: EdgeInsets.symmetric(vertical: 18),
                      width: double.infinity,
                      color: Color.fromRGBO(237, 237, 237, 1),
                    );
                  }, 
                  itemCount: filtrList.length
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 45)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))
                ),
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text('Filterle',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),)
              )
            ],
          ),
        ),
      ],
    );
  }
}