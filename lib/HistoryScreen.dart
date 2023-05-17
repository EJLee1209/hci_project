import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

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
                      "내역",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ],
                )
            ),
            const Divider(
              thickness: 1.5,
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text(
                  "한림 은행",
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ),
            const Text(
              "000000-000000",
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            const Text(
              "5,000,000원",
              style: TextStyle(
                  fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF171559)
                      ),
                        onPressed: (){},
                        child: Text("상품권")
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF171559)
                      ),
                      onPressed: (){},
                      child: Text("제로페이")
                  ),
                ],
              ),
            ),
            Divider(thickness: 3,),

            Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.fromLTRB(20, 8, 0, 8),
                    minSize: 0.0,
                    child: const Icon(
                      Icons.search,
                      color: Color(0xFF171559)
                    ),
                    onPressed: (){}
                ),
                Spacer(),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                    minSize: 0.0,
                    child: Row(
                      children: const [
                        Text(
                            "2023.05.17",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey
                          ),
                        ),
                        Icon(
                            Icons.arrow_drop_down,
                          color: Color(0xFF171559),
                        )
                      ],
                    ),
                    onPressed: (){}
                )
              ],
            ),

            Divider(thickness: 3,),

          ],
        ),
      ),
    );
  }
}
