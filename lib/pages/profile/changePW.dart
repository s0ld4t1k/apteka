import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangePW extends StatefulWidget {
  const ChangePW({super.key});

  @override
  State<ChangePW> createState() => _ChangePWState();
}

class _ChangePWState extends State<ChangePW> {
  TextEditingController _pw=TextEditingController();
  TextEditingController _conPW=TextEditingController();
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
          title: Text('Açarsözi üýtgetmek'),
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
                    Text('Täze açarsözi',),
                    SizedBox(height: 10,),
                    PWField(con: _pw,),
                    SizedBox(height: 20,),
                    Text('Açarsözi tassykla',),
                    SizedBox(height: 10,),
                    PWField(con: _conPW,),
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
      )
    );
  }
}
// ignore: must_be_immutable
class PWField extends StatefulWidget {
  final con;
  var eye=true;
  PWField({super.key, this.con});
  @override
  State<PWField> createState() => _PWFieldState();
}

class _PWFieldState extends State<PWField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: EdgeInsets.only(left: 25,right: 15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(251, 251, 251, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: widget.con,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: widget.eye?Color.fromRGBO(193, 193, 193, 1):Colors.black,
              ),
              obscureText: widget.eye,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                hintText: '********',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(193, 193, 193, 1),
                ),
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                )
              ),
            ),
          ),
          IconButton(
            splashRadius: 15,
            onPressed: (){
              setState(() {
                widget.eye=!widget.eye;
              });
            }, 
            icon: widget.eye?SvgPicture.asset('assets/icons/eye.svg')
            :SvgPicture.asset('assets/icons/eye-slash.svg'),
          )
        ],
      ),
    );
  }
}