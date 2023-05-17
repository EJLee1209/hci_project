import 'package:app/PayScreen.dart';
import 'package:app/PurchaseScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


// 홈 화면 - Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 알림 아이콘
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.fromLTRB(0, 70, 20, 0),
          child: IconButton(
            onPressed: (){},
            icon: Image.asset(
              "images/bell.png",
              width: 35,
              height: 35,
            ),
          )
        ),

        Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // 지역 경제 살리는 강원 상품권 텍스트, 이미지
                    const HomeTitleAndImage(),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFF171559),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0,3)
                            )
                          ]
                      ),

                      // 상품권 사용 가능 금액(결제, 충전, 내역)
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(22),
                            child: Text(
                              "상품권 사용 가능 금액\n200,000 원 입니다.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1.5,
                            height: 0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextButton(
                                    onPressed: (){
                                      // 제로페이 화면으로 이동
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PayScreen(true))
                                      );
                                    },
                                    child: Text(
                                      "결제",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16
                                      ),
                                    )
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                    onPressed: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PurchaseScreen())
                                      );
                                    },
                                    child: Text(
                                      "충전",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16
                                      ),
                                    )
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "내역",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16
                                      ),
                                    )
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    // 제로 페이, 선물/쿠폰, 서비스 소개
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: -8,
                                    blurRadius: 10,
                                    offset: Offset(0,3)
                                )
                              ]
                          ),
                          child: IconButton(
                              iconSize: 150,
                              onPressed: (){
                                // 제로페이 화면으로 이동
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PayScreen(true))
                                );
                              },
                              icon: Image.asset(
                                  "images/zero_pay.png"
                              )
                          ),
                        ),

                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: -3,
                                        blurRadius: 10,
                                        offset: Offset(0,3)
                                    )
                                  ]
                              ),
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: CupertinoButton(
                                    minSize: 0.0,
                                    padding: EdgeInsets.all(0),
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.card_giftcard,
                                          color: Color(0xFF171559),
                                          size: 45,
                                        ),
                                        Text(
                                          "선물/쿠폰",
                                          style: TextStyle(
                                              color: Color(0xFF171559),
                                              fontSize: 13
                                          ),
                                        )
                                      ],
                                    ),
                                    onPressed: (){}
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: -3,
                                        blurRadius: 10,
                                        offset: Offset(0,3)
                                    )
                                  ]
                              ),
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: CupertinoButton(
                                    minSize: 0.0,
                                    padding: EdgeInsets.all(0),
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.info_rounded,
                                          color: Color(0xFF171559),
                                          size: 45,
                                        ),
                                        Text(
                                          "서비스 소개",
                                          style: TextStyle(
                                              color: Color(0xFF171559),
                                              fontSize: 13
                                          ),
                                        )
                                      ],
                                    ),
                                    onPressed: (){}
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // 슬라이드 배너 이미지
                    ImageSlider()
                  ],
                ),
              ),
            )
        )
      ],
    );
  }
}

class HomeTitleAndImage extends StatelessWidget {
  const HomeTitleAndImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "지역경제 살리는",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF171559)
                ),
              ),
              Text(
                "강원상품권",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                ),
              )
            ],
          ),
          Expanded(
              flex: 1,
              child: Image.asset("images/home_character.png")
          ),
        ],
      ),
    );
  }
}


// 이미지 배너
class ImageSlider extends StatelessWidget {
  final List<String> imagePaths = [
    'images/sample_banner.png',
    'images/sample_banner.png',
    'images/sample_banner.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: double.infinity,
      height: 100, // Carousel 높이 설정
      child: CarouselSlider(
        items: imagePaths.map((imagePath) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
        ),
      ),
    );
  }
}
