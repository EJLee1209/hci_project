// 내 정보 my information
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo>
{

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [

            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(0, 70, 20, 0),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      icon:Icon(Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                      )
                  ),
                  Text(
                    "  내 정보",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                ],
              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),

           child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                )
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('   이름',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      ),
                      Spacer(),
                      Text('이민호  ')
                   ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Text('   이메일',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Text('leeMin@naver.com  '),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Text('   천화번호',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Text('010-1234-5678 ')
                    ],
                  )
                ],
              ),
            ),
    ),
            SizedBox(height: 14,),
            Padding(padding:EdgeInsets.only(top: 16, left: 16, right: 16),

             child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               border: Border.all(
                 color: Colors.black,
                 width: 2,
               )
             ),
              child: Row(
                children: [
                  Text('   회원정보 변경',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){},
                      icon:Icon(Icons.arrow_forward_ios,
                      size: 20,
                        color: Colors.black,
                      )

                  )
                ],
              ),
            ),
                  ),
            SizedBox(height: 14,),

            Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 2
                ),
              ),
              child: Row(
                children: [
                  Text('   비밀번호 변경',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){},
                      icon:Icon(Icons.arrow_forward_ios,
                      size: 20,
                        color: Colors.black,
                      )
                  )
                ],
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){}, child: Text('로그아웃')),
                        Text(' | '),
                        TextButton(onPressed: (){}, child: Text('회원 탈퇴'))
                      ],
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}