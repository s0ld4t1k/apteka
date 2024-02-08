import 'package:apte/pages/bag/bankKarty.dart';
import 'package:apte/pages/bag/nagt.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';

class SargytEtmek extends StatelessWidget {
  const SargytEtmek({super.key});

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
          title: const Text('Sargyt etmek'),
        ),
        body: GestureDetector(
          onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
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
                          labelPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: green
                          ),
                          tabs: const [
                            Text('Nagt'),
                            Text('Bank Karty'),
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height-250,
                  child: const TabBarView(
                    children: [
                      Nagt(),
                      BankKarty(),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}