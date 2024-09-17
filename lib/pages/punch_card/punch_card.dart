import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';

class PunchCard extends StatelessWidget {
  const PunchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My card')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 250, 250, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '125 TMT',
                          style: TextStyle(
                            color: green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          '123232 TMT bilen töläň.',
                          style: TextStyle(color: textGrey),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(child: Image.asset('assets/images/punch_coin.png'))
                ],
              ),
            ),
            Container(
              // color: ,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: green,
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/waves.png'),
                ),
              ),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  Container(
                    height: 112,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Her gezek satyn alanyňyzda sanly kartyňyzy “Sagdyn Diýar” dermanhanasynda skanirläň!',
              style: TextStyle(color: textGrey),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 25),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
              color: textGrey3,
              size: 14,
            ),
            SizedBox(width: 5),
            Expanded(
                child: Text(
              'Her ýyl 1-nji ýanwarda ballaryň möhleti gutarýar!',
              style: TextStyle(color: textGrey3, fontSize: 12),
            ))
          ],
        ),
      ),
    );
  }
}
