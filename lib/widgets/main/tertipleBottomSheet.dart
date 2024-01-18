import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
var _selectedTertip=0;
List _tertipList=[
  'Köp satylanlar',
  'Baha görä artmagy',
  'Baha görä kemelmegi',
  'Adyna göra (A-Z)',
];
class TertipleBottomSheet extends StatefulWidget {
  const TertipleBottomSheet({super.key});

  @override
  State<TertipleBottomSheet> createState() => _TertipleBottomSheetState();
}

class _TertipleBottomSheetState extends State<TertipleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.symmetric(horizontal: 25,),
      child: Column(
        children: [
          Row(
            children: [
              Text('Tertiple',style: TextStyle(
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
          SizedBox(height: 34-18,),
          Expanded(
            child: ListView.separated(
              itemBuilder:(context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedTertip=index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Row(
                      children: [
                        Text(_tertipList[index],style: TextStyle(
                          fontSize: 16,
                        ),),
                        Spacer(),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: (index==_selectedTertip)
                              ?green
                              :Color.fromRGBO(216, 216, 216, 1),
                              width: (index==_selectedTertip)?4:2,
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }, 
              separatorBuilder:(context, index) {
                return Container(
                  height: 1,
                  width: double.infinity,
                  color: Color.fromRGBO(237, 237, 237, 1),
                );
              }, 
              itemCount: _tertipList.length
            ),
          )
        ],
      ),
    );
  }
}