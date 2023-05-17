import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'model/Place.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchKeyword = ""; // 검색어 입력
  List<String> _recentSearch = []; // 최근 검색 기록
  List<Place> places = Place.getDummyData(); // 가맹점 리스트
  List<Place> _placesFromKeyword = []; // 검색 결과
  var txt = TextEditingController(); // TextField Controller

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // AppBar
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(0, 70, 20, 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new)
                  ),
                  Text(
                    "매장 검색",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ),

            // 검색창
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: txt,
                      onChanged: (newValue) {
                        // 입력 값 변경
                        setState(() {
                          _searchKeyword = newValue;
                          _placesFromKeyword.clear();
                          places.forEach((element) {
                            if(element.title!.contains(newValue) || element.subTitle!.contains(newValue)) {
                              _placesFromKeyword.add(element);
                            }
                          });
                        });
                      },
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.all(0),
                      minSize: 0.0,
                      child: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      onPressed: () {
                        // 검색
                        setState(() {
                          _recentSearch.insert(0, _searchKeyword); // 검색기록 추가
                        });
                      },
                  )
                ],
              ),
            ),

            // 최근 검색어 기록
            Visibility(
                visible: _searchKeyword.isEmpty,
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "최근 검색어",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            CupertinoButton(
                                padding: EdgeInsets.all(0),
                                minSize: 0.0,
                                child: const Text(
                                  "전체삭제",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: (){
                                  // 최근 검색어 전체 삭제
                                  setState(() {
                                    _recentSearch.clear();
                                  });
                                }
                            )
                          ],
                        ),

                        Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return CupertinoButton(
                                  padding: EdgeInsets.all(0),
                                    minSize: 0.0,
                                    onPressed: () {
                                      // 최근 검색어 클릭 -> 입력
                                      setState(() {
                                        _searchKeyword = _recentSearch[index];
                                        txt.text = _recentSearch[index];
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.search,
                                                size: 30,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  _recentSearch[index],
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              CupertinoButton(
                                                  padding: EdgeInsets.all(5),
                                                  minSize: 0.0,
                                                  child: const Icon(
                                                    Icons.delete,
                                                    size: 30,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      // 단일 검색 기록 삭제
                                                      _recentSearch.removeAt(index);
                                                    });
                                                  }
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 1.5,
                                        )
                                      ],
                                    )
                                );
                              },
                              itemCount: _recentSearch.length,
                            )
                        )
                      ],
                    ),
                  ),
                ),
            ),

            // 매장 검색 결과 리스트
            Visibility(
                visible: _searchKeyword.isNotEmpty,
                child: Expanded(
                    child: Column(
                      children: [
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
                        Expanded(
                          child: ListView.builder(itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
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
                                            _placesFromKeyword.isEmpty ? "${places[index].title}" : "${_placesFromKeyword[index].title}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.black
                                            ),
                                          ),
                                          Text(
                                            _placesFromKeyword.isEmpty ? "${places[index].title}" : "${_placesFromKeyword[index].subTitle}",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey
                                            ),
                                          ),
                                          Text(
                                            _placesFromKeyword.isEmpty ? "${places[index].description}" : "${_placesFromKeyword[index].description}",
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
                                          Text(_placesFromKeyword.isEmpty ? "${places[index].distance}" : "${_placesFromKeyword[index].distance}")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: (){
                                  // 가맹점 클릭 이벤트

                                },
                              ),
                            );
                          },
                            itemCount: _placesFromKeyword.isEmpty ? places.length : _placesFromKeyword.length,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                          ),
                        ),
                      ],
                    )
                ),
            )
          ],
        ),
      ),
    );
  }
}
