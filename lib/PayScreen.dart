import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';


class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  final myController = TextEditingController();
  bool _passwordOk = false;
  int _remainTime = 180;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_passwordOk) { // 제로페이 결제 비밀번호 통과
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
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
                        "제로페이 결제",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18, 50, 18, 12),
                child: Text(
                    "생성된 QR코드를 점원에게 보여주세요",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "남은시간 : ${_remainTime~/60}:${_remainTime%60}",
                    style: TextStyle(
                      fontSize: 13,
                        color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(
                          Icons.rotate_left,
                        color: Colors.blue,
                      )
                  )
                ],
              ),

              Image.asset(
                  "images/img_qr.png",
                width: 200,
                height: 200,
              ),
              const Spacer(),

              CupertinoButton(
                padding: EdgeInsets.all(0),
                  child: Container(
                    color: Colors.grey,
                    width: double.infinity,
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          size: 36,
                          color: Colors.black,
                        ),
                        Text(
                            "가맹점 QR코드를 스캔하려면\n여기를 터치하세요",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  onPressed: () {

                  }

              )
            ],
          ),
        ),
      );
    }else {
      return MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
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
                          "제로페이 결제",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        )
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(30, 80, 30, 0),
                    child: Column(
                      children: [
                        Text(
                          "거래승인번호 6자리를 입력해주세요",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(100, 20, 100, 18),
                  child: TextField(
                    controller: myController,
                    maxLines: 1,
                    maxLength: 6,
                    textAlign: TextAlign.center,
                    onChanged: (String value) {
                      if(value == "123456") {
                        setState(() {
                          _passwordOk = true;

                          // 타이머 시작
                          _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                            setState(() {
                              if(_remainTime > 0){
                                _remainTime-=1;
                              } else {
                                _timer.cancel();
                              }
                            });
                          });
                        });
                      }
                    },
                    obscureText: true,
                  ),
                )
              ],
            ),
          )
      );
    }
  }
}

