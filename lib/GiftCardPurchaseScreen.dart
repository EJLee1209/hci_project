import 'package:app/PayScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/PurchaseCard.dart';

class GiftCardPurchaseScreen extends StatefulWidget {
  const GiftCardPurchaseScreen({Key? key}) : super(key: key);

  @override
  State<GiftCardPurchaseScreen> createState() => _GiftCardPurchaseScreenState();
}

class _GiftCardPurchaseScreenState extends State<GiftCardPurchaseScreen> {
  List<PurchaseCard> cards = <PurchaseCard>[];

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
                    "강원상품권",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ),

            // 월 잔여 할인 한도
            Text(
                "월 잔여 할인 한도",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),
            ),
            Text(
                "200,000원",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF171559)
                    ),
                      onPressed: (){},
                      child: Text(
                          "할인한도",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          )
                      ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF171559)
                  ),
                    onPressed: (){},
                    child: Text(
                        "한도확인",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        )
                    )
                )
              ],
            ),
            const Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),

            // 상품권 추가 버튼, 초기화 버튼
            Container(
              margin: const EdgeInsets.fromLTRB(18, 12, 18, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // 5천원권 추가
                        setState(() {
                          cards.add(
                              PurchaseCard(
                                  "5천원권","5%","5,000원","4,750원"
                              )
                          );
                        });
                      },
                      child: Text(
                          "5천원권"
                      ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF171559),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 1만원권 추가
                      setState(() {
                        cards.add(
                            PurchaseCard(
                                "1만원권","5%","10,000원","9,500원"
                            )
                        );
                      });
                    },
                    child: Text(
                        "1만원권"
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF171559),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 5만원권 추가
                      setState(() {
                        cards.add(
                            PurchaseCard(
                                "5만원권","5%","50,000원","47,500원"
                            )
                        );
                      });
                    },
                    child: Text(
                        "5만원권"
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF171559),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),

                  CupertinoButton(
                    padding: EdgeInsets.all(0),
                      child: Icon(Icons.refresh),
                      onPressed: () {
                        setState(() {
                          cards = [];
                        });
                      },
                  ),
                ],
              ),
            ),

            // 구매할 상품권 리스트
            Visibility(
                child: Container(
                    width: double.infinity,
                    height: 300,
                    margin: EdgeInsets.fromLTRB(18, 10, 18, 18),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: -3,
                              blurRadius: 10,
                              offset: Offset(0,3)
                          )
                        ]
                    ),
                    child: ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: cards.length,
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: PurchaseCardItem(
                                cards[index],
                                    (card) {
                                  setState(() {
                                    cards.remove(card);
                                  });
                                },
                              )
                          );
                        }
                    )
                ),
              visible: !cards.isEmpty,
            )

          ],
        ),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
          child: Row(
            children: [
              Text(
                  "총 99,750원",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              CupertinoButton(
                padding: EdgeInsets.fromLTRB(40, 12, 40, 12),
                color: Colors.blue,
                  child: Text("구매하기"),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PayScreen(PayType.giftCardPurchase))
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PurchaseCardItem extends StatefulWidget {
  late PurchaseCard card;
  late Function(PurchaseCard card) deleteAction = (PurchaseCard card) {};

  PurchaseCardItem(PurchaseCard card, Function(PurchaseCard card) f) {
    this.card = card;
    this.deleteAction = f;
  }

  @override
  State<PurchaseCardItem> createState() => _PurchaseCardItemState();
}

class _PurchaseCardItemState extends State<PurchaseCardItem> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.card.title}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
            Text(
              "${widget.card.discount}",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            )
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CupertinoButton(
                padding: EdgeInsets.all(0),
                minSize: 0.0,
                child: Icon(
                  Icons.cancel_outlined,
                  size: 18,
                  color: Colors.black,
                ),
                onPressed: (){
                  // 카드 삭제
                  widget.deleteAction(widget.card);
                }
            ),
            Text(
              "${widget.card.price}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
            Text(
              "${widget.card.originalPrice}",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: CupertinoColors.inactiveGray
              ),
            ),
            // 카운터
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: [
                  CupertinoButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      minSize: 0.0,
                      child: Icon(
                        Icons.remove,
                        size: 18,
                        color: Colors.black,
                      ),
                      onPressed: (){
                        // 카운트 감소
                        setState(() {
                          if(_count > 1)
                            _count--;
                        });
                      }
                  ),

                  Text("${_count}"),

                  CupertinoButton(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      minSize: 0.0,
                      child: Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.black,
                      ),
                      onPressed: (){
                        // 카운트 증가
                        setState(() {
                          _count++;
                        });
                      }
                  ),
                ],
              ),
            )

          ],
        )
      ],
    );
  }
}

