import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
List _searchHistory=[
  'нурофен',
  'метипред',
  'стрепсилс',
  'нурофен',
];
class Searck extends StatelessWidget {
  const Searck({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 25,
          title: Container(
            margin: EdgeInsets.only(bottom: 11),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(
                    minHeight: 24,
                    minWidth: 24,
                    maxHeight: 24,
                    maxWidth: 24,
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: Icon(Icons.chevron_left_rounded),
                ),
                SizedBox(width: 18,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 44,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(249, 249, 249, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Color.fromRGBO(131, 132, 139, 1),
                            ),
                            autofocus: true,
                            onSubmitted: (value)=>
                            Navigator.of(context).pushNamed('/mainPage/searchPage'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Harydyň adyny giriziň',
                              prefixIconConstraints: BoxConstraints(
                                maxHeight: 20,
                                maxWidth: 20,
                                minHeight: 20,
                                minWidth: 20,
                              ),
                              contentPadding: EdgeInsets.all(0),
                              prefixText: '   ',
                              prefixIcon: SvgPicture.asset('assets/icons/search.svg',color: green,),
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: textGrey3,
                                fontWeight: FontWeight.w500,
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Köp gözlenýänler',style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(186, 186, 186, 1),
              ),),
              SizedBox(height: 7,),
              Column(
                children: List.generate(_searchHistory.length, (index) => InkWell(
                  onTap: (){},
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/search.svg'),
                            SizedBox(width: 21,),
                            Text(_searchHistory[index],),
                            Spacer(),
                            Icon(Icons.chevron_right_rounded,color: Color.fromRGBO(131, 133, 137, 1),)
                          ],
                        ),
                      ),
                      Container(height: 1,color: Color.fromRGBO(237, 237, 237, 1),),
                    ],
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}