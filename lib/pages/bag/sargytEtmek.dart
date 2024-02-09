import 'package:apte/pages/bag/bankKarty.dart';
import 'package:apte/pages/bag/nagt.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';

class SargytEtmek extends StatelessWidget {
  const SargytEtmek({super.key});
  @override
  Widget build(BuildContext context) {
    var jem=ModalRoute.of(context)?.settings.arguments;
    print(MediaQuery.of(context).size.height);
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
          title: const Text('Sargyt etmek'),
        ),
        body: GestureDetector(
          onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 122,
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Töleg usulyny saýlaň',),
                      const SizedBox(height: 12,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(245, 245, 245, 1)
                        ),
                        padding: const EdgeInsets.all(4),
                        height: 50,
                        child: TabBar(
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
                            borderRadius: BorderRadius.circular(6),
                            color: green
                          ),
                          dividerColor: Colors.transparent,
                          tabs: const [
                            Text('Nagt'),
                            Text('Bank Karty'),
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height-283,
                  child: const TabBarView(
                    children: [
                      Nagt(),
                      BankKarty(),
                    ]
                  ),
                ),
                Container(
                  height: 105,
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Jemi',style: TextStyle(
                                  color: Color.fromRGBO(107, 107, 107, 1),
                                ),),
                                Text('$jem TMT',style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),)
                              ],
                            )
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(196, 46)),
                              elevation: MaterialStateProperty.all(1),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ))  
                            ),
                            onPressed: (){
                              
                            }, 
                            child: const Text('Sargyt et',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),)
                          ),
                        ],
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}