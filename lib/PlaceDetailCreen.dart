// 가맹점 상세 정보

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "가맹점 상세 정보",
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
        ),
        body: Column(
          children: [
            // 김밥 천국
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Color(0xFF171559)
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "김밥천국",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                      Text(
                        "식당",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Icon(
                        Icons.location_on,
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
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                          Icons.location_on_outlined
                      ),
                      Text(
                          "강원도 춘천시 행촌로 14",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Spacer(),
                      Icon(
                          Icons.copy,
                          color: Colors.blue
                      ),
                      Text(
                          "복사",
                        style: TextStyle(
                            fontSize: 14,
                          color: Colors.blue
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person
                        ),
                        Text(
                            "이은재"
                        )
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 8),
                    child: Text(
                      "상세정보",
                      style: TextStyle(
                          fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec nisl eget quam porta auctor. Proin sed rutrum risus, in faucibus risus. Maecenas non justo sollicitudin, pharetra risus vel, accumsan metus. Nunc semper nisl non tempor vestibulum. Nullam et ornare turpis. Suspendisse eget molestie ipsum. Vivamus eu dui orci. Duis eu nulla vestibulum, efficitur justo ut, lacinia sem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In congue lacus ac lacus luctus suscipit. Praesent viverra nisi ut massa maximus malesuada. Aliquam at malesuada justo, sed efficitur ex. Nam sollicitudin, massa sed blandit accumsan, eros massa rutrum ex, in cursus leo mauris iaculis ligula."
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
