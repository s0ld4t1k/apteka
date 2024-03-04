
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
TextEditingController _name=TextEditingController(text: 'Merjen Annaýewa');
TextEditingController _tel=TextEditingController(text: '+99361616161');

class User extends StatelessWidget {
  const User({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
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
          title:  Text('${locale[curLN]?['infos']}'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height-231,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('${locale[curLN]?['dolyAdynyz']}',),
                    const SizedBox(height: 10,),
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        controller: _name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                     Text('${locale[curLN]?['tel']}'),
                    const SizedBox(height: 10,),
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        maxLength: 12,
                        controller: _tel,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                     Text('${locale[curLN]?['password']}',),
                    const SizedBox(height: 10,),
                    Container(
                      height: 52,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(orange.withOpacity(0.1)),
                              minimumSize: MaterialStateProperty.all(const Size(118, 20)),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                              alignment: Alignment.centerLeft  
                            ),
                            onPressed: ()=>Navigator.pushNamed(context, '/profile/user/changePW'), 
                            child:  Text('${locale[curLN]?['toChangePassword']}',style: const TextStyle(
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
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50))
                ),
                onPressed: ()=>Navigator.pop(context), 
                child:  Text('${locale[curLN]?['save']}',style: const TextStyle(
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