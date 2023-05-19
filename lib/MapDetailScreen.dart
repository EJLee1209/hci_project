import 'dart:async';

import 'package:app/SearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class MapDetailScreen extends StatelessWidget {
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
        body: MapView(),
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
  }
}


class PlaceNavigationBar extends StatefulWidget {
  @override
  State<PlaceNavigationBar> createState() => _PlaceNavigationBarState();
}

class _PlaceNavigationBarState extends State<PlaceNavigationBar> {
  bool _showNavigation = false;
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
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
              visible: _selected==0,
            ),

            // 대중교통
            Visibility(
                child: Row(
                  children: [

                  ],
                ),
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
              visible: _selected==2,
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
                          color: _selected == 0 ? Colors.white : Color(0xFF171559),
                          size: 40,
                        ),
                        onPressed: (){
                          setState(() {
                            _selected = 0;
                          });
                        },
                        color: _selected == 0 ? Color(0xFF171559) : Colors.white,
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
                          color: _selected == 1 ? Colors.white : Color(0xFF171559),
                          size: 40,
                        ),
                        onPressed: (){
                          setState(() {
                            _selected = 1;
                          });
                        },
                        color: _selected == 1 ? Color(0xFF171559) : Colors.white,
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
                          color: _selected == 2 ? Colors.white : Color(0xFF171559),
                          size: 40,
                        ),
                        onPressed: (){
                          setState(() {
                            _selected = 2;
                          });
                        },
                        color: _selected == 2 ? Color(0xFF171559) : Colors.white,
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


