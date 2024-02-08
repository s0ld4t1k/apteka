import 'package:apte/widgets/bag&Card/newAdres.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
var _selectedAdresType=0;
class NewAdresManual extends StatefulWidget {
  const NewAdresManual({super.key});

  @override
  State<NewAdresManual> createState() => _NewAdresManualState();
}
TextEditingController _adr=TextEditingController();
class _NewAdresManualState extends State<NewAdresManual> {
  @override
  Widget build(BuildContext context) {
    _selectedAdresType=0;
    _adr.text='';
    dynamic list=ModalRoute.of(context)?.settings.arguments;
    if(list[0]!='')_selectedAdresType=list[0];
    if(list[1]!='')_adr.text=list[1];
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            padding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(
              maxHeight: 24,
              maxWidth: 24,
              minHeight: 24,
              minWidth: 24,
            ),
            onPressed: ()=>Navigator.pop(context), 
            icon: const Icon(Icons.chevron_left_rounded)
          ),
          title: const Text('Salgym'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height-230,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Salgyňyz'),
                        const SizedBox(height: 10,),
                        Container(
                          height: 108,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(251, 251, 251, 1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1))
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          child: TextField(
                            controller: _adr,
                            textAlignVertical: TextAlignVertical.top,
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none
                              )
                            ),
                          ),
                        ),
                        const SizedBox(height: 22,),
                        const Text('Salgynyň görnüşi'),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Wrap(
                              spacing: 11,
                              children: List.generate(adresTypeList.length, (index){
                                return OutlinedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 25,vertical: 6)),
                                    side: MaterialStateProperty.all(BorderSide(
                                      color: _selectedAdresType==index?green:const Color.fromRGBO(237, 237, 237, 1),
                                    )),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ))
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      _selectedAdresType=index;
                                    });
                                  }, 
                                  child: Text(adresTypeList[index],style: TextStyle(
                                    color: _selectedAdresType==index?green:const Color.fromRGBO(168, 168, 168, 1),
                                    fontWeight: FontWeight.w500,
                                  ),)
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50))
                ),
                onPressed: (){}, 
                child: const Text('Ýatda sakla',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}