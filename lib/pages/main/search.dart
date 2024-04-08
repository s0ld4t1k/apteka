// ignore_for_file: deprecated_member_use

import 'package:apte/pages/main/searchPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

List<String> searchHistoryTemp = [];
List<String> searchHistory = [];
void addToHistory(value) {
  searchHistoryTemp.add(value);
  searchHistoryTemp.addAll(searchHistory);
  // print(_searchHistoryTemp);
  searchHistory = searchHistoryTemp;
  searchHistoryTemp = [];
  Hive.box('box').put('search', searchHistory);
}

class Searck extends StatelessWidget {
  const Searck({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          titleSpacing: 0,
          leading: IconButton(
            padding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
              maxHeight: 24,
              maxWidth: 24,
            ),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.chevron_left_rounded),
          ),
          title: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: 44,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                            color: Color.fromRGBO(131, 132, 139, 1),
                          ),
                          autofocus: true,
                          onSubmitted: (value) {
                            searchText = value;
                            addToHistory(value);
                            Navigator.of(context)
                                .pushNamed('/mainPage/searchPage');
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '${locale[curLN]?["searchHint"]}',
                              prefixIconConstraints: const BoxConstraints(
                                maxHeight: 20,
                                maxWidth: 20,
                                minHeight: 20,
                                minWidth: 20,
                              ),
                              contentPadding: const EdgeInsets.all(0),
                              prefixText: '   ',
                              prefixIcon: SvgPicture.asset(
                                'assets/icons/search.svg',
                                color: green,
                              ),
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: textGrey3,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 25),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${locale[curLN]?["mostSearchs"]}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(186, 186, 186, 1),
                ),
              ),
              const SizedBox(height: 7),
              searchHistory.isEmpty
                  ? const Expanded(child: Center(child: Text('No data')))
                  : Column(
                      children: List.generate(
                          searchHistory.length > 4 ? 4 : searchHistory.length,
                          (index) => InkWell(
                                onTap: () {
                                  searchText = searchHistory[index];
                                  Get.to(() => const SearchPage());
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/search.svg'),
                                          const SizedBox(
                                            width: 21,
                                          ),
                                          Text(
                                            searchHistory[index],
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.chevron_right_rounded,
                                            color: Color.fromRGBO(
                                                131, 133, 137, 1),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      color: const Color.fromRGBO(
                                          237, 237, 237, 1),
                                    ),
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
