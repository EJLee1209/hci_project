// 가맹점 찾기 - Map Screen
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveCamera();
  }

  moveCamera() async {
    final controller = await _controller.future;
    controller.moveCamera(
        CameraUpdate.toCameraPosition(CameraPosition(target: LatLng(37.8866303, 127.7353948)))
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "지도 보기",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(
                  Icons.arrow_back_ios_new,
                color: Colors.black,
              )
          ),
        ),
        body: Container(
          child: NaverMap(
            onMapCreated: onMapCreated,
            mapType: _mapType,
          ),
        ),
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
