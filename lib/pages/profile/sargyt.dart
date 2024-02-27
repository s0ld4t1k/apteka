import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/profile/garasylyanlar.dart';
import 'package:apte/widgets/profile/sargytlar.dart';
import 'package:flutter/material.dart';
List garasylyanlar=[
  {
    "status":"Garaşylýar",
    "sargytBelgisi":"0012",
    "senesi":"12.02.2023/13:00",
    "jemi":"4000 TMT",
    'jemiBaha':'83.00 TMT',
    'arzanladysh':'15.00 TMT',
    'eltipBermekHyzmaty':'10.00 TMT',
    'promokod':'12YDSREFW1',
    'products':[
      {
        'imgUrl':'assets/images/spray.png',
        'name':'Мультивитамины для детей',
        'desc':'Фармакор продакшн ООО',
        'count':'1',
        'price':'20.00 TMT',
      },
      {
        'imgUrl':'assets/images/multiVitamin.png',
        'name':'Мультивитамины для детей',
        'desc':'Фармакор продакшн ООО',
        'count':'5',
        'price':'20.00 TMT',
      },
      {
        'imgUrl':'assets/images/melotanin.png',
        'name':'Мультивитамины для детей',
        'desc':'Фармакор продакшн ООО',
        'count':'2',
        'price':'20.00 TMT',
      },
    ]
  },
  {
    "status":"Kabul edildi",
    "sargytBelgisi":"0012",
    "senesi":"12.02.2023/13:00",
    "jemi":"4000 TMT",
  },
  {
    "status":"Goýbolsun edildi",
    "sargytBelgisi":"0012",
    "senesi":"12.02.2023/13:00",
    "jemi":"4000 TMT",
  },
  {
    "status":"Kabul edildi",
    "sargytBelgisi":"0012",
    "senesi":"12.02.2023/13:00",
    "jemi":"4000 TMT",
  },
  {
    "status":"Goýbolsun edildi",
    "sargytBelgisi":"0012",
    "senesi":"12.02.2023/13:00",
    "jemi":"4000 TMT",
  },
];
class Sargyt extends StatelessWidget {
  const Sargyt({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
          title:  Text('${locale[curLN]?['myOrders']}'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(245, 245, 245, 1)
                  ),
                  padding: const EdgeInsets.all(4),
                  height: 50,
                  child:  TabBar(
                    unselectedLabelColor: Colors.black,
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    indicatorColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: green,
                    ),
                    dividerColor: Colors.transparent,
                    tabs: [
                      Text('${locale[curLN]?['waitingOrders']}',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),),
                      Text('${locale[curLN]?['orders']}',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),),
                    ]
                  ),
                ),
                SizedBox(height: 20,),
                const Expanded(
                  child: TabBarView(
                    children: [
                      Garasylyanlar(),
                      Sargytlarym(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}