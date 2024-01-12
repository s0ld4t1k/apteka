import 'package:apte/widgets/FiltrBottomSheet.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/tertipleBottomSheet.dart';
import 'package:apte/widgets/verticalProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _tc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _searchText=ModalRoute.of(context)?.settings.arguments as String;
    _tc.text=_searchText;
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: bc,
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
                            controller: _tc,
                            style: TextStyle(
                              color: Color.fromRGBO(131, 132, 139, 1),
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              prefixIconConstraints: BoxConstraints(
                                maxHeight: 20,
                                maxWidth: 20,
                                minHeight: 20,
                                minWidth: 20,
                              ),
                              prefixText: '   ',
                              prefixIcon: SvgPicture.asset('assets/icons/search.svg',color: green,),
                              border: InputBorder.none,
                              hintText: 'Harydyň adyny giriziň',
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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(double.infinity, 42)),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Color.fromRGBO(237, 237, 237, 1))
                        ))
                      ),
                      onPressed: (){
                        showModalBottomSheet(
                          showDragHandle: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )
                          ),
                          context: context, 
                          builder:(context) {
                            return TertipleBottomSheet();
                          },
                        );
                      }, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/tertiple.svg'),
                          SizedBox(width: 7,),
                          Text('Tertiple',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 21,),
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(double.infinity, 42)),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Color.fromRGBO(237, 237, 237, 1))
                        ))
                      ),
                      onPressed: (){
                        showModalBottomSheet(
                          useRootNavigator: true,
                          isScrollControlled: true,
                          showDragHandle: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )
                          ),
                          context: context, 
                          builder:(context) {
                            return FiltrBottomSheet();
                          },
                        );
                      }, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/filter.svg'),
                          SizedBox(width: 7,),
                          Text('Filtr',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 17,),
              VerticalProducts(),
            ],
          ),
        ),
      ),
    );
  }
}