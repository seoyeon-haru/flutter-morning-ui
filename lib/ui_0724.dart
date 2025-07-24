import 'package:flutter/material.dart';

class Home0724 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Column(
      children: [
        Container(),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.grey),
              child: Text('1'),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.grey),
              child: Column(
                children: [
                  Text('2'),
                  Text('A B C')
                ],
              ),
            ),
            Container(
                   width: 20,
              height: 20,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.grey),
              child: Column(
                children: [
                  Text('3'),
                  Text('D E F')
                ],
              ),
            )
          ],
        ),
      ],
    ),
   );
  }

}