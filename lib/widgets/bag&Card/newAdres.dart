
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
var _selectedAdresType=0;
MapController _mc=MapController();
dynamic markers=[
  Marker(
    point: LatLng(_lat, _long), 
    child: SvgPicture.asset('assets/icons/loc.svg'),
  ),
];
List adresTypeList=[
  'Öý',
  'Iş',
  'Başga',
];
class NewAdres extends StatefulWidget {
  const NewAdres({super.key});

  @override
  State<NewAdres> createState() => _NewAdresState();
}
var _lat=37.57,_long=58.225999;
class _NewAdresState extends State<NewAdres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Salgym'),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  child: FlutterMap(
                    mapController: _mc,
                    options: MapOptions(
                      onMapReady: () async{
                        var _per=await Geolocator.requestPermission();
                        if(_per!=LocationPermission.denied){
                          Position _pos=await Geolocator.getCurrentPosition();
                          setState(() {
                            _lat=_pos.latitude;
                            _long=_pos.longitude;
                          });
                          _mc.move(LatLng(_lat, _long), 12);
                          markers[0]=Marker(
                            point: LatLng(_lat, _long), 
                            child: SvgPicture.asset('assets/icons/loc.svg'),
                          );
                        }
                      },
                      onLongPress: (tapPosition, point) {
                        setState(() {
                          _lat=point.latitude;
                          _long=point.longitude;
                          markers[0]=Marker(
                            point: point, 
                            child: SvgPicture.asset('assets/icons/loc.svg'),
                          );
                        });
                      },
                      initialCenter: LatLng(_lat, _long),
                      initialZoom: 12,
                    ), 
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      ),
                      MarkerLayer(
                        markers: markers,
                      )
                    ]
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 25,
            bottom: MediaQuery.of(context).size.height/2+34,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Center(child: SvgPicture.asset('assets/icons/gps.svg')),
            )
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              height: MediaQuery.of(context).size.height/2,
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: 60,
                        height: 2.5,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(205, 205, 205, 1),
                          borderRadius: BorderRadius.circular(31),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text('Salgyňyz',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),),
                        Spacer(),
                        SvgPicture.asset('assets/icons/gps.svg'),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/icons/loc.svg'),
                        SizedBox(width: 21,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText('$_lat, $_long'),
                              SizedBox(height: 18,),
                              ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(Size(107, 34)),
                                  backgroundColor: MaterialStateProperty.all(green.withOpacity(0.1)),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ))
                                ),
                                onPressed: ()=>Navigator.pushNamed(context,'/bag/salgymManual',arguments: ['','',]), 
                                child: Text('Üýtget',style: TextStyle(
                                  color: green,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 1,
                      margin: EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(237, 237, 237, 1),
                      ),
                    ),
                    Row(
                      children: [
                        Text('Salgynyň görnüşi',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Wrap(
                          spacing: 11,
                          children: List.generate(adresTypeList.length, (index){
                            return OutlinedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 25,vertical: 6)),
                                side: MaterialStateProperty.all(BorderSide(
                                  color: _selectedAdresType==index?green:Color.fromRGBO(237, 237, 237, 1),
                                )),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ))
                              ),
                              onPressed: (){
                                setState(() {
                                  _selectedAdresType=index;
                                });
                              }, 
                              child: Text(adresTypeList[index],style: TextStyle(
                                color: _selectedAdresType==index?green:Color.fromRGBO(168, 168, 168, 1),
                                fontWeight: FontWeight.w500,
                              ),)
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(double.infinity, 50))
                      ),
                      onPressed: (){}, 
                      child: Text('Tassykla',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}