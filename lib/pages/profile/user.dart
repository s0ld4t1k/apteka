
import 'package:apte/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
TextEditingController _name=TextEditingController(text: 'Merjen Annaýewa');
TextEditingController _tel=TextEditingController(text: '+99361616161');

class User extends StatelessWidget {
  User({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(
              maxHeight: 24,
              maxWidth: 24,
              minHeight: 24,
              minWidth: 24,
            ),
            onPressed: ()=>Navigator.pop(context), 
            icon: Icon(Icons.chevron_left_rounded)
          ),
          title: Text('Maglumatlar'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height-231,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Doly adyňyz',),
                    SizedBox(height: 10,),
                    Container(
                      height: 52,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        controller: _name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Telefon belgiňiz',),
                    SizedBox(height: 10,),
                    Container(
                      height: 52,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        maxLength: 12,
                        controller: _tel,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Açarsözi',),
                    SizedBox(height: 10,),
                    Container(
                      height: 52,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(orange.withOpacity(0.1)),
                              minimumSize: MaterialStateProperty.all(Size(118, 20)),
                              padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                              alignment: Alignment.centerLeft  
                            ),
                            onPressed: ()=>Navigator.pushNamed(context, '/profile/user/changePW'), 
                            child: Text('Açarsözini çalyş',style: TextStyle(
                              fontSize: 16,
                              color: orange,
                            ),)
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 50))
                ),
                onPressed: ()=>Navigator.pop(context), 
                child: Text('Ýatda sakla',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}