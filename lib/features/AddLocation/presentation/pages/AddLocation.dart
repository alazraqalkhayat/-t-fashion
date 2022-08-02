import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:t_fashion/core/app_theme.dart';
import 'package:t_fashion/core/widgets/TextFormFieldContainer.dart';
import 'package:t_fashion/core/widgets/buttons/BasicButtonsContainer.dart';
import 'package:t_fashion/core/widgets/texts/SubTitleText.dart';


class AddLocation extends StatefulWidget {
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  late double mediaHeight, mediaWidth;
  Completer<GoogleMapController> _controller = Completer();
  late double lat, lng; //15.3694
  var myMarkers = HashSet<Marker>();

  static final CameraPosition sanaa = CameraPosition(
    target: LatLng(15.3694, 44.1910),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    checkOrientation(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: mediaHeight / 6,
              width: double.infinity,
              color: AppTheme.primaryColor,
              child: Center(
                child: SubTitleText(
                  subTitle: "إضافه عنوان",
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: mediaHeight / 7),
              padding: EdgeInsets.only(),
              width: double.infinity,
              height: mediaHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GoogleMap(
                    initialCameraPosition: sanaa,
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      setState(() {
                        myMarkers.add(
                          Marker(
                            markerId: MarkerId('1'),
                            position: LatLng(15.3694, 44.1910),
                            infoWindow: InfoWindow(
                                title: "alazraq alkhayat",
                                snippet:
                                    "alazraq is the best flutter programmer on the world",
                                onTap: () {
                                  print("info window tapped");
                                }),
                            onTap: () {
                              print("marker tapped");
                            },
                          ),
                        );
                      });
                      _controller.complete(controller);
                    },
                    markers: myMarkers,
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10,right: mediaWidth/10,left: mediaWidth/10),
                    width: mediaWidth,
                    height: mediaHeight/2.5,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: Colors.white
                    ),
                    child:SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormFieldContainer(
                                hint: "اسم الموقع",
                                icon_name: "north.svg",
                                textInputType: TextInputType.text,
                                onChange: (newValue) {
                                },
                                validator: (validatorValue) {
                                  return "";
                                },
                                autofocus: true,
                                obscureText: false,
                                enable: true,
                                maxLength: 50,
                              ),
                              TextFormFieldContainer(
                                hint: "تحديد الموقع",
                                icon_name: "location.svg",
                                textInputType: TextInputType.text,
                                enable: false,
                                onChange: (newValue) {
                                },
                                validator: (validatorValue) {
                                  return "";
                                },
                                autofocus: true,
                                obscureText: false,
                                maxLength: 50,
                              ),

                              BasicButtonsContainer(
                                backgroundColor: AppTheme.primaryColor,
                                textColor: Colors.white,
                                title: "إضافه",
                                onTap: (){
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ),


                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkOrientation(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      mediaHeight = MediaQuery.of(context).size.width;
      mediaWidth = MediaQuery.of(context).size.height;
    } else {
      mediaHeight = MediaQuery.of(context).size.height;
      mediaWidth = MediaQuery.of(context).size.width;
    }
  }
}
