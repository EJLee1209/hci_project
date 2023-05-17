import 'package:app/MapScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 가맹점 찾기 Screen
class FindScreen extends StatefulWidget {
  const FindScreen({Key? key}) : super(key: key);

  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  List<String> tabTitles = ['전체', '학원/교육', '음식점/카페', '의료/보건', '농산물/청과', '수산물/횟집', '축산물/정육', '미용/패션', '식료품/반찬'];
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 70, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
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
                  icon: Icon(
                    Icons.location_on_outlined,
                    size: 30,
                  )
              )
            ],
          ),
        ),
        Divider(thickness: 1.5),

        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          height: 40,
          child: Row(
            children: const [
              Icon(
                  Icons.location_on,
                size: 20,
              ),
              Text(
                  "강원도 춘천시",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13
                ),
              ),
              VerticalDivider(thickness: 1),
              Text(
                "변경>",
                style: TextStyle(
                    fontSize: 13,
                  color: Colors.grey
                ),
              ),
              Spacer(),
              Icon(
                  Icons.search,
                size: 20,
              ),
              Text(
                  "매장검색",
                style: TextStyle(
                    fontSize: 13
                ),
              )
            ],
          ),
        ),

        // tab view
        Container(
          height: 120,
          color: Color(0xFF9BA4B5),
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
                            color: Color(0xFF171559)
                        ),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Color(0xFF171559)
                            ),
                            borderRadius: BorderRadius.circular(12),

                            color: _selected==index ? Colors.white : Color(0xFF9BA4B5)
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
          ),
        ),
      ],
    );
  }
}
