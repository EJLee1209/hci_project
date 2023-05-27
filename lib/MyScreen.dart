import 'package:app/MyAccount.dart';
import 'package:app/MyInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final List locale=[
    {'name':'English','locale':Locale('en','US')},
    {'name':'한국어','locale':Locale('ko','KR')}
  ];
  updatelanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context){
    showDialog(context: context,
        builder: (builder){
          return AlertDialog(
            title: Text('choose your language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:GestureDetector(
                          onTap: (){
                            updatelanguage(locale[index]['locale']);
                          },

                          child:Text(locale[index]['name'])),);
                  },
                  separatorBuilder: (context,index){
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body:Padding( 
          padding: EdgeInsets.all(20),
        
        child: Column(

          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(0, 70, 20, 0),
              child: Row(
                children: [
                  Text(
                    "My page".tr,
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
                            'My info'.tr,
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
                          Text('My account'.tr,
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
                          Text('Customer Service'.tr,
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
            CupertinoButton(
                padding: EdgeInsets.fromLTRB(0, 20, 15, 20),
                minSize: 0.0,

                child: Row(
                  children: [
                    Text('Language'.tr,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        )),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.black,
                    )
                  ],
                ),
                onPressed: () {
                  builddialog(context);
                }
            ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('version'.tr,
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


          ]
    ),
        ),
    ),
    );
  }
}
