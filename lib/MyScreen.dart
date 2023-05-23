import 'package:app/MyAccount.dart';
import 'package:app/MyInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(0, 70, 20, 0),
              child: Row(
                children: [
                  Text(
                    "  My Page",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1.5),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            ' 내 정보',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> MyInfo())
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(' 내 계좌',
                              style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)
                          ),
                          const Spacer(),
                         IconButton(onPressed: (){
                           Navigator.push(context,
                           MaterialPageRoute(builder: (context)=>MyAccout())
                           );

                         }, icon: Icon(
                           Icons.arrow_forward_ios,
                           size: 20,
                           color: Colors.black,
                         ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(' 고객센터',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                  )),
                          const Spacer(),
                           IconButton(onPressed: (){}, icon: Icon(
                             Icons.arrow_forward_ios,
                             size: 20,
                             color: Colors.black,
                           ),)


                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(' 버전',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              )),
                          const Spacer(),
                          Text(' 2.9',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                child: IconButton(
                  icon: Icon(Icons.language),
                  onPressed: (){},
                ),
                ),
              ],
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


          ]
    ),
    ),
    );
  }
}
