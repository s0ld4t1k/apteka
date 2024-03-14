// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List gorkezmeList = [];

// ignore: must_be_immutable
class InfoRow extends StatefulWidget {
  int index;
  var _up = true;
  InfoRow({super.key, required this.index});
  @override
  State<InfoRow> createState() => _InfoRowState();
}

class _InfoRowState extends State<InfoRow> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                widget._up = !widget._up;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Text(
                    gorkezmeList[widget.index][0],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Icon(
                      (widget._up == false)
                          ? CupertinoIcons.chevron_up
                          : CupertinoIcons.chevron_down,
                      color: const Color.fromRGBO(156, 156, 156, 1),
                      size: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: (!widget._up) ? 1 : 0,
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
