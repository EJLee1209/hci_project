import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


final List<String> imagePaths = [
  'images/sample_banner.png',
  'images/sample_banner.png',
  'images/sample_banner.png'
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter project",
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.add_alert, color: Colors.black),
              iconSize: 35,
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              AppTitleImage(),
              Container(
                margin: EdgeInsets.fromLTRB(30, 12, 30, 12),
                decoration: BoxDecoration(
                    color: Color(0xFF1D1459),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0,3)
                      )
                    ]
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "상품권 사용 가능 금액\n200,000 원 입니다.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                            onPressed: (){},
                            child: Text(
                              "결제",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        MaterialButton(
                            onPressed: (){},
                            child: Text(
                              "충전",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),
                              textAlign: TextAlign.center,
                            )
                        ),
                        MaterialButton(
                            onPressed: (){},
                            child: Text(
                              "내역",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),
                              textAlign: TextAlign.center,
                            )
                        )
                      ],
                    ),
                  ],
                ),
              ),
              
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: -6,
                                blurRadius: 5,
                                offset: const Offset(0,3)
                            )
                          ]
                      ),
                      child: IconButton(
                          onPressed: (){},
                          icon: Image.asset(
                            "images/zero_pay.png",
                            fit: BoxFit.fill,
                          ),
                        iconSize: 150,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
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
                            child: MaterialButton(
                                onPressed: (){},
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.card_giftcard,
                                      size: 35,
                                      color: Color(0xFF1D1459),
                                    ),
                                    Text(
                                        "선물/쿠폰",
                                        style: TextStyle(
                                            fontSize: 14,
                                          color: Color(0xFF1D1459),
                                        )
                                    )
                                  ],
                                )
                            ),
                          ),
                          Container(
                            width: 100,
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            decoration: BoxDecoration(
                                color: Colors.white,
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
                            child: MaterialButton(
                                onPressed: (){},
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.map,
                                      size: 35,
                                      color: Color(0xFF1D1459),
                                    ),
                                    Text(
                                        "서비스 소개",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF1D1459),
                                        )
                                    )
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              BannerImage()
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.location_on_outlined,
                      size: 36,
                    )
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.person,
                      size: 36,
                    )
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.menu,
                      size: 36,
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppTitleImage extends StatelessWidget {
  const AppTitleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "지역경제 살리는",
                style: TextStyle(
                    color: Color(0xFF1D1459),
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "강원상품권",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          Expanded(
          flex: 1,
            child: Image.asset(
              "images/home_character.png",
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}


class BannerImage extends StatelessWidget {
  const BannerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: CarouselSlider(
        items: imagePaths.map((imagePath) {
          return Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
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

