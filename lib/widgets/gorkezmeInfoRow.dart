// ignore_for_file: file_names

import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
List gorkezmeList=[];

// ignore: must_be_immutable
class InfoRow extends StatefulWidget {
  int index;
  var _up=true;
  InfoRow({super.key,required this.index});
  @override
  State<InfoRow> createState() => _InfoRowState();
}

class _InfoRowState extends State<InfoRow> {
  
  @override
  Widget build(BuildContext context) {
    gorkezmeList=[
      ['${locale[curLN]?["aboutproduct"]}','Алмагель А (Almagel® A) Состав и форма выпуска 5 мл суспензии для приема внутрь содержит алюминия гидроксида 300 мг (эквивалентно 200 мг оксида алюминия), магния гидроксида 100 мг и анестезина 100 мг; в пластиковых флаконах по 170 мл в комплекте с дозировочной ложкой, в картонной пачке 1 флакон. Характеристика Суспензия белого или слегка сероватого цвета с характерным сладковатым вкусом и запахом лимона. Фармакологическое действие и анестезина 100 мг; в пластиковых флаконах по 170 мл в комплекте с дозировочной ложкой, в картонной пачке 1 флакон Фармакологическое действие — обволакивающее, адсорбирующее, антацидное.',],
      ['${locale[curLN]?["duzum"]}','kakashka 1 kg',],
      ['${locale[curLN]?["saklanyshy"]}','C -25',],
      ['${locale[curLN]?["ulanylyshy"]}','bir yerine dykmaly',],
      ['${locale[curLN]?["manLimit"]}','dolboyoblar',],
    ];
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                widget._up=!widget._up;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Text(gorkezmeList[widget.index][0],style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),),
                  const Spacer(),
                  Center(
                    child: Icon(
                      (widget._up==false)?CupertinoIcons.chevron_up
                      :CupertinoIcons.chevron_down,
                      color: const Color.fromRGBO(156, 156, 156, 1),
                      size: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: (!widget._up)?1:0, 
            duration: const Duration(milliseconds: 500),
            child: Visibility(
              visible: (!widget._up),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(gorkezmeList[widget.index][1]),
              ),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color.fromRGBO(235, 235, 235, 1),
          ),
        ],
      ),
    );
  }
}