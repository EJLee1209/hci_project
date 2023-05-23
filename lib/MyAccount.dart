// 내 계좌 my accounts
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccout extends StatefulWidget{

  @override
  State<MyAccout> createState()=>_MyAccountState();
}

class _MyAccountState extends State<MyAccout>
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home:Scaffold(
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
                    "  My account".tr,
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
                padding: EdgeInsets.only(top: 20, left: 16, right: 16,bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 2
                  )
                ),
                child: Column(
                  children: [

                    Row(

                      children: [
                        Text('NH bank'.tr,
                        style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                        ),
                         ),
                         SizedBox(width: 8,),
                     TextButton(
                      onPressed: () {},
                       style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                       foregroundColor: MaterialStateProperty.all<Color>(Colors.white),),
                         child: Text('main account'.tr),)
                    ],
                    ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('000000-00000',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            )
                          ],
                        ),
                  ],
                ),
              ),

            ),

            Padding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IBK bank'.tr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '000000-00000',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10), // Add spacing between rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle "주계과 설정" TextButton onPressed event
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: Text('Set up as main account'.tr),
                        ),
                        SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            // Handle "삭제" TextButton onPressed event
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: Text('Delete'.tr),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


            Padding(
                padding: EdgeInsets.only(left: 16,right: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 2
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            )


          ],
        ),
      ),
    );

  }
}