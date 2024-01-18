import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';

class ShowPromokod extends StatelessWidget {
  const ShowPromokod({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).
        viewInsets.bottom),
        height: 200,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Promokod',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),
            SizedBox(height: 21,),
            Container(
              height: 49,
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  labelText: 'Promokod', 
                  labelStyle: TextStyle(
                    color: green,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: green
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: green
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 21,),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 46)),
                backgroundColor: MaterialStateProperty.all(
                  green.withOpacity(0.7)
                ),
              ),
              onPressed: (){}, 
              child: Text('Giriz',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}