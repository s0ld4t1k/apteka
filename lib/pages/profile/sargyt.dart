import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/profile/garasylyanlar.dart';
import 'package:apte/widgets/profile/sargytlar.dart';
import 'package:flutter/material.dart';

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
          title: const Text('Sargytlarym'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: const TabBar(
                  labelColor: green,
                  unselectedLabelColor: Color.fromRGBO(165, 167, 185, 1),
                  tabs: [
                    Tab(
                      child: Text('Garaşylýanlar'),
                    ),
                    Tab(
                      child: Text('Sargytlar'),
                    ),
                  ]
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Garasylyanlar(),
                    Sargytlarym(),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}