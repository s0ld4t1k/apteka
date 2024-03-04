// ignore_for_file: file_names

import 'package:apte/pages/kard/kard.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/statusCon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
List paymentHistoryList=[
  {
    'bankID': 3,
    'name':'Türkmenbaşy Bank',
    'date':'Fewral 1, 2024 | 12:30',
    'price':'220.00',
    'status':'Goýbolsun edildi',
  },
  {
    'bankID': 0,
    'name':'Türkmenbaşy Bank',
    'date':'Fewral 1, 2024 | 12:30',
    'price':'220.00',
    'status':'Ýalňyş töleg',
  },
  {
    'bankID': 2,
    'name':'Türkmenbaşy Bank',
    'date':'Fewral 1, 2024 | 12:30',
    'price':'220.00',
    'status':'Kabul edildi',
  },
  {
    'bankID': 0,
    'name':'Türkmenbaşy Bank',
    'date':'Fewral 1, 2024 | 12:30',
    'price':'220.00',
    'status':'Goýbolsun edildi',
  },
  {
    'bankID': 3,
    'name':'Türkmenbaşy Bank',
    'date':'Fewral 1, 2024 | 12:30',
    'price':'220.00',
    'status':'Kabul edildi',
  },
  {
    'bankID': 2,
    'name':'Türkmenbaşy Bank',
    'date':'Fewral 1, 2024 | 12:30',
    'price':'220.00',
    'status':'Ýalňyş töleg',
  },
];
class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Get.back(), 
          icon: const Icon(Icons.chevron_left_rounded)
        ),
        title: Text('${locale[curLN]?['paymentHistory']}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: sargytBorder),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Image.asset(cardImages[paymentHistoryList[index]['bankID']]),
                  ),
                  const SizedBox(width: 17,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(paymentHistoryList[index]['name'],style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                        const SizedBox(height: 2,),
                        Text(paymentHistoryList[index]['date'],style: const TextStyle(
                          fontSize: 12,
                          color: sargytTextGrey,
                        ),),
                        const SizedBox(height: 10,),
                        StatusCon(text: paymentHistoryList[index]['status'],errText: 'Ýalňyş töleg',),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(paymentHistoryList[index]['price'],style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: green,
                    ),),
                  ),
                ],
              ),
            );
          },
          itemCount: paymentHistoryList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          separatorBuilder: (context, index) => const SizedBox(height: 15,),
        ),
      ),
    );
  }
}