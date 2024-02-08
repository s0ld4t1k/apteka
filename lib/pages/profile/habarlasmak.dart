import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
TextEditingController _name=TextEditingController();
TextEditingController _tel=TextEditingController();
TextEditingController _com=TextEditingController();
var nameErr=false,telErr=false,comErr=false;

class Habarlasmak extends StatefulWidget {
  const Habarlasmak({super.key});

  @override
  State<Habarlasmak> createState() => _HabarlasmakState();
}

class _HabarlasmakState extends State<Habarlasmak> {
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
          title: const Text('Habarlaşmak'),
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
                    const Text('Doly adyňyz',),
                    const SizedBox(height: 10,),
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: nameErr?red:const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            nameErr=false;
                          });
                        },
                        controller: _name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Adyňyzy giriziň',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(193, 193, 193, 1)
                          ),
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )
                        ),
                      ),
                    ),
                    nameErr?const _ErrMsg():Container(),
                    const SizedBox(height: 20,),
                    const Text('Telefon belgiňiz',),
                    const SizedBox(height: 10,),
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: telErr?red:const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: Row(
                        children: [
                          const Text('+993',style: TextStyle(
                            fontSize: 16,
                          ),),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  telErr=false;
                                });
                              },
                              keyboardType: TextInputType.phone,
                              maxLength: 8,
                              controller: _tel,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              scrollPadding: const EdgeInsets.all(0),
                              decoration: const InputDecoration(
                                counterText: '',
                                contentPadding: EdgeInsets.symmetric(vertical: 17),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    telErr?const _ErrMsg():Container(),
                    const SizedBox(height: 20,),
                    const Text('Bellik',),
                    const SizedBox(height: 10,),
                    Container(
                      height: 139,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: comErr?red:const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            comErr=false;
                          });
                        },
                        controller: _com,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.top,
                        minLines: null,
                        expands: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Bellik',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(193, 193, 193, 1),
                          )
                        ),
                      )
                    ),
                    comErr?const _ErrMsg():Container(),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50))
                ),
                onPressed: (){
                  setState(() {
                    if(_name.text=='')nameErr=true;
                    if(_tel.text=='')telErr=true;
                    if(_com.text=='')comErr=true;
                  });
                }, 
                child: const Text('Ugratmak',style: TextStyle(
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
class _ErrMsg extends StatelessWidget {
  const _ErrMsg();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        Row(
          children: [
            SvgPicture.asset('assets/icons/qMark.svg'),
            const SizedBox(width: 8,),
            const Text('Bu meýdan hökmany',style: TextStyle(
              color: red,
            ),),
          ],
        ),
      ],
    );
  }
}