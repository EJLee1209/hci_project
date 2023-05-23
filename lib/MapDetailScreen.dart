import 'dart:async';

import 'package:app/PlaceDetailCreen.dart';
import 'package:app/SearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MapDetailScreen extends StatefulWidget {
  @override
  State<MapDetailScreen> createState() => _MapDetailScreenState();
}

class _MapDetailScreenState extends State<MapDetailScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "김밥 천국",
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
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen())
                    );
                  },
                  icon: Icon(
                    Icons.manage_search_outlined,
                    color: Colors.black,
                    size: 30,
                  )
              ),
            ],
          ),
          body: Stack(
            children: [
              // 최단경로
              MapView(),

              // 대중교통 리스트
              Visibility(
                visible: _selected == 1,
                child: Container(
                  color: Colors.white,
                  child: Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "오늘 오후 2:44 출발",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.fromLTRB(30, 8, 8, 30),
                                child: Row(
                                  children: [
                                    const Text(
                                      "26분",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "오후 2:44 ~ 3:11",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            "도보 10분 | 카드 1,500원 | 대기 15분 예상",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 30),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.directions_bus_outlined,
                                      color: Colors.blue,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "한림대학교",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "3-S, 300",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87
                                          ),
                                        ),
                                        Text(
                                          "성심경로당 정류장",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Divider(
                                thickness: 1.5,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "오늘 오후 2:44 출발",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.fromLTRB(30, 8, 8, 30),
                                child: Row(
                                  children: [
                                    const Text(
                                      "26분",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "오후 2:44 ~ 3:11",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            "도보 10분 | 카드 1,500원 | 대기 15분 예상",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 30),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.directions_bus_outlined,
                                      color: Colors.blue,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "한림대학교",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "3-S, 300",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87
                                          ),
                                        ),
                                        Text(
                                          "성심경로당 정류장",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Divider(
                                thickness: 1.5,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "오늘 오후 2:44 출발",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.fromLTRB(30, 8, 8, 30),
                                child: Row(
                                  children: [
                                    const Text(
                                      "26분",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "오후 2:44 ~ 3:11",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            "도보 10분 | 카드 1,500원 | 대기 15분 예상",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 30),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.directions_bus_outlined,
                                      color: Colors.blue,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "한림대학교",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "3-S, 300",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87
                                          ),
                                        ),
                                        Text(
                                          "성심경로당 정류장",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Divider(
                                thickness: 1.5,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "오늘 오후 2:44 출발",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.fromLTRB(30, 8, 8, 30),
                                child: Row(
                                  children: [
                                    const Text(
                                      "26분",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "오후 2:44 ~ 3:11",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            "도보 10분 | 카드 1,500원 | 대기 15분 예상",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 30),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.directions_bus_outlined,
                                      color: Colors.blue,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "한림대학교",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "3-S, 300",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87
                                          ),
                                        ),
                                        Text(
                                          "성심경로당 정류장",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Divider(
                                thickness: 1.5,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "오늘 오후 2:44 출발",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.fromLTRB(30, 8, 8, 30),
                                child: Row(
                                  children: [
                                    const Text(
                                      "26분",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "오후 2:44 ~ 3:11",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            "도보 10분 | 카드 1,500원 | 대기 15분 예상",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 30),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.directions_bus_outlined,
                                      color: Colors.blue,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "한림대학교",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "3-S, 300",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87
                                          ),
                                        ),
                                        Text(
                                          "성심경로당 정류장",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Divider(
                                thickness: 1.5,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            height: 200,
            child: PlaceNavigationBar(),
          )
      ),
    );
  }
}


class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;

  moveCamera() async {
    final controller = await _controller.future;
    controller.moveCamera(
        CameraUpdate.toCameraPosition(CameraPosition(target: LatLng(37.8866303, 127.7353948)))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NaverMap(
        onMapCreated: onMapCreated,
        mapType: _mapType,
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
    moveCamera();
  }
}


class PlaceNavigationBar extends StatefulWidget {
  @override
  State<PlaceNavigationBar> createState() => _PlaceNavigationBarState();
}

class _PlaceNavigationBarState extends State<PlaceNavigationBar> {
  bool _showNavigation = false;
  int _selectedTransportation = 0;

  @override
  Widget build(BuildContext context) {
    _MapDetailScreenState? parent = context.findAncestorStateOfType<_MapDetailScreenState>();

    if(_showNavigation) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            // 도보
            Visibility(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "최단거리",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "5분",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          Text(
                            "14분",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              "863m",
                              style: TextStyle(
                                fontSize: 16,

                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              visible: parent?._selected == 0,
            ),

            // 대중교통
            Visibility(
                child: SizedBox(
                  height: 50,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Expanded(
                            child: CupertinoButton(
                              color: _selectedTransportation == 0 ? Color(0xFF171559) : Colors.white,
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              minSize: 0.0,
                              child: Text(
                                "전체",
                                style: TextStyle(
                                    color: _selectedTransportation == 0 ? Colors.white : Color(0xFF171559),
                                    fontSize: 18
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedTransportation = 0;
                                });
                              },
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Expanded(
                            child: CupertinoButton(
                              color: _selectedTransportation == 1 ? Color(0xFF171559) : Colors.white,
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              minSize: 0.0,
                              child: Text(
                                "버스",
                                style: TextStyle(
                                    color: _selectedTransportation == 1 ? Colors.white : Color(0xFF171559),
                                    fontSize: 18
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedTransportation = 1;
                                });
                              },
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Expanded(
                            child: CupertinoButton(
                              color: _selectedTransportation == 2 ? Color(0xFF171559) : Colors.white,
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              minSize: 0.0,
                              child: Text(
                                "지하철",
                                style: TextStyle(
                                    color: _selectedTransportation == 2 ? Colors.white : Color(0xFF171559),
                                    fontSize: 18
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedTransportation = 2;
                                });
                              },
                            )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Expanded(
                            child: CupertinoButton(
                              color: _selectedTransportation == 3 ? Color(0xFF171559) : Colors.white,
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              minSize: 0.0,
                              child: Text(
                                "버스+지하철",
                                style: TextStyle(
                                    color: _selectedTransportation == 3 ? Colors.white : Color(0xFF171559),
                                    fontSize: 18
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedTransportation = 3;
                                });
                              },
                            )
                        ),
                      ),
                    ],
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              visible: parent?._selected == 1,
            ),
            // 자차
            Visibility(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "3분",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "863m",
                          style: TextStyle(
                            fontSize: 16,

                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 12),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "택시비 약 4,000원",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              visible: parent?._selected==2,
            ),
            // 아래 3개 버튼
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                      ),
                      child: CupertinoButton(
                        padding: EdgeInsets.all(12),
                        minSize: 0.0,
                        child: Icon(
                          Icons.run_circle_outlined,
                          color: parent?._selected == 0 ? Colors.white : Color(0xFF171559),
                          size: 40,
                        ),
                        onPressed: (){
                          parent?.setState(() {
                            parent._selected = 0;
                          });
                        },
                        color: parent?._selected == 0 ? Color(0xFF171559) : Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                      ),
                      child: CupertinoButton(
                        padding: EdgeInsets.all(12),
                        minSize: 0.0,
                        child: Icon(
                          Icons.directions_bus_outlined,
                          color: parent?._selected == 1 ? Colors.white : Color(0xFF171559),
                          size: 40,
                        ),
                        onPressed: (){
                          parent?.setState(() {
                            parent._selected = 1;
                          });
                        },
                        color: parent?._selected == 1 ? Color(0xFF171559) : Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                      ),
                      child: CupertinoButton(
                        padding: EdgeInsets.all(12),
                        minSize: 0.0,
                        child: Icon(
                          Icons.directions_car_outlined,
                          color: parent?._selected == 2 ? Colors.white : Color(0xFF171559),
                          size: 40,
                        ),
                        onPressed: (){
                          parent?.setState(() {
                            parent._selected = 2;
                          });
                        },
                        color: parent?._selected == 2 ? Color(0xFF171559) : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
            child: Row(
              children: [
                Container(
                  child: Icon(
                      Icons.restaurant_rounded,
                      color: Color(0xFF171559)
                  ),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Color(0xFF171559)
                      ),
                      borderRadius: BorderRadius.circular(12),

                      color:  Colors.white
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "김밥천국",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                      Text(
                        "음식점/카페",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(),

                // 가맹점 상세 정보화면으로 이동하는 버튼
                CupertinoButton(
                    padding: EdgeInsets.all(0),
                    minSize: 0.0,
                    child: Container(
                      child: Icon(
                          Icons.read_more,
                          color: Color(0xFF171559),
                          size: 30
                      ),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Color(0xFF171559)
                          ),
                          shape: BoxShape.circle,
                          color:  Colors.white
                      ),
                    ),
                    onPressed: (){
                      // 가맹점 상세 정보화면으로 이동
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlaceDetailScreen())
                      );
                    }
                ),
              ],
            ),
          ),

          // 아래 3개 버튼들
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Color(0xFF171559)
                        ),
                        borderRadius: BorderRadius.circular(12),

                        color:  Colors.white
                    ),
                    child: CupertinoButton(
                      padding: EdgeInsets.all(12),
                      minSize: 0.0,
                      child: Icon(
                        Icons.account_balance,
                        color: Color(0xFF171559),
                        size: 40,
                      ),
                      onPressed: (){},
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Color(0xFF171559)
                        ),
                        borderRadius: BorderRadius.circular(12),

                        color:  Colors.white
                    ),
                    child: CupertinoButton(
                      padding: EdgeInsets.all(12),
                      minSize: 0.0,
                      child: Icon(
                        Icons.call,
                        color: Color(0xFF171559),
                        size: 40,
                      ),
                      onPressed: (){},
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Color(0xFF171559)
                        ),
                        borderRadius: BorderRadius.circular(12),

                        color:  Colors.white
                    ),
                    child: CupertinoButton(
                      padding: EdgeInsets.all(12),
                      minSize: 0.0,
                      child: Icon(
                        Icons.directions,
                        color: Color(0xFF171559),
                        size: 40,
                      ),
                      onPressed: (){
                        // 이동경로를 보여주는 화면 보여줌
                        setState(() {
                          _showNavigation = true;
                        });
                      },
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}


