import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:get/get.dart';

enum PayType {
  zeroPay, // 제로페이
  giftCardPay, // 상품권 결제
  giftCardPurchase  // 상품권 구매
}


class PayScreen extends StatefulWidget {
  // 결제 종류 구분을 위한 변수 (제로페이, 상품권 결제/구매)
  // 변수 타입은 PayType 열거형 사용
  PayType payType = PayType.zeroPay;

  // 생성자 파라미터로 받음
  PayScreen(PayType payType) {
    this.payType = payType;
  }

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  final myController = TextEditingController();
  bool _passwordOk = false;
  int _remainTime = 180;
  late Timer _timer;
  String _title = "";

  @override
  void initState() {
    super.initState();
    switch(widget.payType) {
      case PayType.zeroPay:
        _title = "Paying by ZeroPay".tr;
        break;
      case PayType.giftCardPay:
        _title = "Paying by GiftCard".tr;
        break;
      case PayType.giftCardPurchase:
        _title = "Buying GiftCard".tr;
        break;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_passwordOk) { // 결제 비밀번호 통과
      if (widget.payType == PayType.zeroPay){
        // 제로페이
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
                          "Paying by ZeroPay".tr,
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
                    "Show the generated QR code to the clerk".tr,
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
                      "Remaining Time : ${_remainTime~/60}:${_remainTime%60}".tr,
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
      } else if(widget.payType == PayType.giftCardPurchase) {
        // 상품권 구매
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(20, 70, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Buying GiftCard".tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close
                            )
                        )
                      ],
                    )
                ),

                // 구매 완료 이미지, 텍스트
                Expanded(
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/home_character.png"),
                          Text(
                              "상품권 99,750 원이\n구매되었습니다!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                  ),
                ),

                // 확인 버튼
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 80),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                            "Confirm".tr,
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      )
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        // 상품권 결제
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
                          "Paying by GiftCard".tr,
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
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                          "mount of GiftCard : ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "73,000원",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent
                        ),
                      )
                    ],
                  ),
                ),

                const Divider(
                  thickness: 1.5,
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(18, 50, 18, 12),
                  child: Text(
                    "Show the generated QR code to the clerk".tr,
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
                      "Remaining Time : ${_remainTime~/60}:${_remainTime%60}".tr,
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
      }

    }else {
      // 결제 비밀번호 확인 화면
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
                          _title,
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
                          "Please enter 6 digits pass".tr,
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
                    keyboardType: TextInputType.number,
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

