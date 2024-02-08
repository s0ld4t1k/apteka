import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
List adresType=[
  ['Öý','assets/icons/oy.svg',],
  ['Iş','assets/icons/is.svg',],
  ['Başga','assets/icons/basga.svg',],
];
List adres=[
  [0,'Arçabil şaýoly jaý 142 , 3-nji etaj otag 25',],
  [1,'Arçabil şaýoly jaý 142 , 3-nji etaj otag 25 we we we we w e we w ew e w e w e e w ew ',],
];
class Adres extends StatefulWidget {
  const Adres({super.key});

  @override
  State<Adres> createState() => _AdresState();
}

class _AdresState extends State<Adres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text('Salgylarym'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: 
        adres.isEmpty?Column(
          children: [
            Image.asset('assets/images/locat.png'),
            const SizedBox(height: 10,),
            const Text('Salgy tapylmady',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),),
            const SizedBox(height: 17,),
            const Text('Sargytlary aňsatlyk bilen ýerine ýetirmek üçin salgyňyzy goşup bilersiňiz',style: TextStyle(
              color: Color.fromRGBO(131, 135, 140, 1),
            ),
            textAlign: TextAlign.center,),
            const SizedBox(height: 33,),
            OutlinedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                side: MaterialStateProperty.all(const BorderSide(color: orange)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: orange,
                    )
                  )
                )
              ),
              onPressed: ()=>Navigator.pushNamed(context, '/bag/salgym'), 
              child: const Text('Salgy goş',style: TextStyle(
                color: orange,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
            )
          ],
        ):
        Column(
          children: List.generate(adres.length, (index) => Stack(
            children: [
              Container(
                height: 101,
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                  color: const Color.fromRGBO(252, 252, 252, 1),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: Colors.white,
                          ),
                          child: Center(child: SvgPicture.asset(adresType[adres[index][0]][1]))
                        ),
                      ],
                    ),
                    const SizedBox(width: 14,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(adresType[adres[index][0]][0]),
                          const SizedBox(height: 8,),
                          Text(adres[index][1],style: const TextStyle(
                            color: Color.fromRGBO(108, 108, 108, 1),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,),
                        ],
                      )
                    )
                  ],
                ),
              ),
              Positioned(
                top: 16,
                right: 50,
                child: GestureDetector(
                  onTap: ()=>Navigator.pushNamed(context, '/bag/salgymManual',arguments: adres[index]),
                  child: SvgPicture.asset('assets/icons/edit.svg'),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      adres.removeAt(index);
                    });
                  },
                  child: SvgPicture.asset('assets/icons/delete.svg')
                ),
              ),
            ],
          )),
        ),
      ),
      floatingActionButton: adres.isNotEmpty?FloatingActionButton(
        backgroundColor: orange,
        onPressed: ()=>Navigator.pushNamed(context, '/bag/salgym'),
        child: const Icon(Icons.add,color: Colors.white,),
      ):null,
    );
  }
}