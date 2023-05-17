import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'HomeScreen.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // AppBar
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(0, 70, 20, 0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new)
                    ),
                    Text(
                      "알림",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ],
                )
            ),
            Divider(
              thickness: 1.5
            ),

            // 공지/이벤트 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.notifications_active_outlined,
                          size: 36,
                          color: _selected == 0 ? Colors.black : Colors.grey,
                        ),
                        Text(
                            "공지",
                          style: TextStyle(
                              color: _selected == 0 ? Colors.black : Colors.grey,
                              fontSize: 16
                          ),
                        )
                      ],
                    ),
                    onPressed: (){
                      // 공지 버튼
                      setState(() {
                        _selected = 0;
                      });
                    }
                ),
                CupertinoButton(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.card_giftcard_outlined,
                          size: 36,
                          color: _selected == 1 ? Colors.black : Colors.grey,
                        ),
                        Text(
                          "이벤트",
                          style: TextStyle(
                              color: _selected == 1 ? Colors.black : Colors.grey,
                              fontSize: 16
                          ),
                        )
                      ],
                    ),
                    onPressed: (){
                      // 공지 버튼
                      setState(() {
                        _selected = 1;
                      });
                    }
                )
              ],
            ),

            // 공지 (visible = _selected == 0)
            Visibility(
                child: Expanded(
                  child: Column(
                    children: [
                      // 광고 배너
                      ImageSlider(),

                      // 공지
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                          itemBuilder: (context, index) {
                            return CupertinoButton(
                                padding: EdgeInsets.all(0),
                                minSize: 0.0,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "공지${index+1}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                              ),
                                            ),
                                            const Text(
                                              "2023.05.17",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey
                                              ),
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 2,
                                    )
                                  ],
                                ),
                                onPressed: (){}
                            );
                          },
                          itemCount: 20,
                        ),
                      )
                    ],
                  ),
                ),
              visible: _selected==0,
            ),

            // 이벤트 (visible = _selected == 1)
            Visibility(
                child: Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                    itemBuilder: (context, index) {
                      return CupertinoButton(
                          padding: EdgeInsets.all(0),
                          minSize: 0.0,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "이벤트${index+1}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),
                                      ),
                                      const Text(
                                        "2023.05.17",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2,
                              )
                            ],
                          ),
                          onPressed: (){}
                      );
                    },
                    itemCount: 20,
                  ),
                ),
              visible: _selected == 1,
            )


          ],
        ),
      ),
    );
  }
}
