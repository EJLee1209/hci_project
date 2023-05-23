// 내 정보 my information
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    "  My info".tr,
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
                      Text('   Name'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      ),
                      Spacer(),
                      Text('Lee Min Hoo '.tr)
                   ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Text('   Email'.tr,
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
                      Text('   Phone num'.tr,
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
                  Text('   Edit my info'.tr,
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
                  Text('   Change Password'.tr,
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
                        TextButton(onPressed: (){}, child: Text('Log out'.tr)),
                        Text(' | '),
                        TextButton(onPressed: (){}, child: Text('Cancel my Membership'.tr))
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