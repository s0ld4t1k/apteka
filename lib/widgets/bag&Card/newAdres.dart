// ignore_for_file: file_names

import 'package:apte/data/model/address/controller.dart';
import 'package:apte/pages/bag/addAdres.dart';
import 'package:apte/widgets/bag&Card/newAdresManual.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

var _selectedAdresType = 0;
var _lat = 37.57, _long = 58.225999;
void getGeo() async {
  try {
    var per = await Geolocator.requestPermission();
    if (per != LocationPermission.denied) {
      Position pos = await Geolocator.getCurrentPosition();
      _lat = pos.latitude;
      _long = pos.longitude;
      mc.move(LatLng(_lat, _long), 12);
      markers[0] = Marker(
        point: LatLng(_lat, _long),
        child: SvgPicture.asset('assets/icons/loc.svg'),
      );
    }
  } catch (e) {
    debugPrint('-----geolocator------$e');
  }
}

dynamic markers = [
  Marker(
    point: LatLng(_lat, _long),
    child: SvgPicture.asset('assets/icons/loc.svg'),
  ),
];
List adresTypeList = [];
MapController mc = MapController();

class NewAdres extends StatefulWidget {
  const NewAdres({super.key});

  @override
  State<NewAdres> createState() => _NewAdresState();
}

class _NewAdresState extends State<NewAdres> {
  @override
  void initState() {
    mc = MapController();
    super.initState();
  }

  @override
  void dispose() {
    mc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    adresTypeList = [
      '${locale[curLN]?['home']}',
      '${locale[curLN]?['work']}',
      '${locale[curLN]?['other']}',
    ];
    return GetBuilder<AddressController>(
        init: AddressController(),
        builder: (ac) {
          return Scaffold(
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
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.chevron_left_rounded)),
              title: Text('${locale[curLN]?['myAdres']}'),
            ),
            body: Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: FlutterMap(
                            mapController: mc,
                            options: MapOptions(
                              onMapReady: () {
                                setState(() {});
                                getGeo();
                              },
                              onLongPress: (tapPosition, point) {
                                setState(() {
                                  _lat = point.latitude;
                                  _long = point.longitude;
                                  markers[0] = Marker(
                                    point: point,
                                    child: SvgPicture.asset(
                                        'assets/icons/loc.svg'),
                                  );
                                });
                              },
                              initialCenter: LatLng(_lat, _long),
                              initialZoom: 12,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              ),
                              MarkerLayer(markers: markers)
                            ]),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 25,
                    bottom: MediaQuery.of(context).size.height / 2 + 34,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          getGeo();
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: SvgPicture.asset('assets/icons/gps.svg')),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    // margin: const EdgeInsets.only(bottom: 10),
                    height: MediaQuery.of(context).size.height / 2,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 35),
                              Row(
                                children: [
                                  Text(
                                    '${locale[curLN]?['adres']}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset('assets/icons/gps.svg'),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset('assets/icons/loc.svg'),
                                  const SizedBox(width: 21),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SelectableText('$_lat, $_long'),
                                        const SizedBox(height: 18),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                      const Size(107, 34)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      green.withOpacity(0.1)),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ))),
                                          onPressed: () => Get.to(
                                              () => const NewAdresManual()),
                                          child: Text(
                                            '${locale[curLN]?['change']}',
                                            style: const TextStyle(
                                              color: green,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: double.infinity,
                                height: 1,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(237, 237, 237, 1),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${locale[curLN]?['salgynynGornushi']}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Wrap(
                                    spacing: 11,
                                    children: List.generate(
                                        adresTypeList.length, (index) {
                                      return OutlinedButton(
                                          style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 25,
                                                          vertical: 6)),
                                              side: MaterialStateProperty.all(
                                                  BorderSide(
                                                color:
                                                    _selectedAdresType == index
                                                        ? green
                                                        : const Color.fromRGBO(
                                                            237, 237, 237, 1),
                                              )),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ))),
                                          onPressed: () {
                                            setState(() {
                                              _selectedAdresType = index;
                                            });
                                          },
                                          child: Text(
                                            adresTypeList[index],
                                            style: TextStyle(
                                              color: _selectedAdresType == index
                                                  ? green
                                                  : const Color.fromRGBO(
                                                      168, 168, 168, 1),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ));
                                    }),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(double.infinity, 50))),
                                onPressed: () {
                                  ac.add(
                                      _selectedAdresType + 1, '$_lat, $_long');
                                  selectedAdresStr.value = '$_lat, $_long';
                                  selectedAdres.value =
                                      ac.addresses.detail?.loc?.length ?? 1 - 1;
                                  Get.back();
                                },
                                child: Text(
                                  '${locale[curLN]?['confirm']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20)
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: 35,
                            child: Center(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: 60,
                                height: 2.5,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(205, 205, 205, 1),
                                  borderRadius: BorderRadius.circular(31),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
