// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/category/controller.dart';

class SubKategory extends StatelessWidget {
  const SubKategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (cc) {
      var subcategory = cc.categories.detail!.loc![cc.selectedCategory];
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
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.chevron_left_rounded)),
          title: Text(cc.getTitle(subcategory.title!)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  cc.selectedSubategory = index;
                  cc.getCategoryProducts();
                  Navigator.of(context).pushNamed('/kategory/subKategoryPage');
                },
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              cc.getTitle(
                                  subcategory.subcategories![index].title!),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color.fromRGBO(237, 237, 237, 1),
                    )
                  ],
                ),
              );
            },
            itemCount: subcategory.subcategories!.length,
          ),
        ),
      );
    });
  }
}
