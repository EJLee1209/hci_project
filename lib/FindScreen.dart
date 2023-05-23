import 'package:app/MapDetailScreen.dart';
import 'package:app/MapScreen.dart';
import 'package:app/SearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'model/Place.dart';

// 가맹점 찾기 Screen
class FindScreen extends StatefulWidget {
  const FindScreen({Key? key}) : super(key: key);

  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  List<String> tabTitles = ['전체', '학원/교육', '음식점/카페', '의료/보건', '농산물/청과', '수산물/횟집', '축산물/정육', '미용/패션', '식료품/반찬'];
  List<Place> places = Place.getDummyData();
  List<String> location = ["철원군", "화천군", "양구군", "고성군", "인제군", "춘천시", "속초시", "양양군", "홍천군", "횡성군", "원주시", "평창군", "정선군", "동해시", "영월군", "태백시", "삼척시"];
  String _selectedLocation = "춘천시";
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar
        Container(
          padding: EdgeInsets.fromLTRB(20, 70, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "가맹점찾기",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              IconButton(
                  onPressed: () {
                    //지도 보기 화면으로 이동
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapScreen())
                    );
                  },
                  icon: const Icon(
                    Icons.location_on_outlined,
                    size: 30,
                  )
              )
            ],
          ),
        ),
        // Divier
        const Divider(thickness: 1.5),
        // 현재 위치, 매장 검색
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          height: 40,
          child: Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.all(0),
                  minSize: 0.0,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                      Text(
                        "Gangwon-do ${_selectedLocation}".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13
                        ),
                      ),
                      VerticalDivider(thickness: 1),
                      const Text(
                        "변경>",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                  onPressed: (){
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: double.infinity,
                          child: Expanded(
                            child: ListView.builder(itemBuilder: (context, index) {
                              return CupertinoButton(
                                  child: Text(
                                    location[index],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                    ),
                                  ),
                                  onPressed: (){
                                    // 장소 변경
                                    setState(() {
                                      _selectedLocation = location[index];
                                    });
                                    Navigator.pop(context);
                                  }
                              );
                            },
                              itemCount: location.length,
                              padding: EdgeInsets.all(10),
                            ),
                          )
                        );
                      },
                    );
                  }
              ),

              Spacer(),
              CupertinoButton(
                padding: EdgeInsets.zero,
                  minSize: 0.0,
                  child: Row(
                    children: const [
                      Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.black
                      ),
                      Text(
                          "매장검색",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black
                          ),
                      )
                    ],
                  ),
                  onPressed: (){
                    // 매장 검색 화면 이동
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen())
                    );
                  }
              )
            ],
          ),
        ),
        
        // tab view
        Container(
          height: 120,
          color: Color(0xFFEEEEEE),
          child: ListView.builder(itemBuilder: (context, index) {
            return CupertinoButton(
              padding: EdgeInsets.all(0),
                minSize: 0.0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                            Icons.all_inclusive,
                            color: _selected==index ? Colors.white : Color(0xFF171559)
                        ),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Color(0xFF171559)
                            ),
                            borderRadius: BorderRadius.circular(12),

                            color: _selected==index ? Color(0xFF171559) : Color(0xFFEEEEEE)
                        ),
                      ),
                      Text(
                          tabTitles[index],
                        style: TextStyle(
                            color: Color(0xFF171559),
                          fontSize: 13
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: (){
                  setState(() {
                    _selected = index;
                  });
                }
            );
          },
            itemCount: tabTitles.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
          ),
        ),
        // 정렬 기준
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Row(
              children: const [
                Text(
                  "거리순",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Icon(Icons.keyboard_arrow_down)
              ],
            )
        ),
        // 가맹점 리스트
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: CupertinoButton(
                minSize: 0.0,
                  padding: EdgeInsets.all(0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${places[index].title}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black
                              ),
                            ),
                            Text(
                                "${places[index].subTitle}",
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey
                              ),
                            ),
                            Text(
                                "${places[index].description}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const Icon(
                                Icons.directions,
                              size: 50,
                            ),
                            Text("${places[index].distance}")
                          ],
                        ),
                      )
                    ],
                  ),
                  onPressed: (){
                    // 가맹점 클릭 이벤트
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapDetailScreen())
                    );
                  },
              ),
            );
          },
            itemCount: places.length,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
          ),
        )

      ],
    );
  }
}
