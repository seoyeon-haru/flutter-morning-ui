import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home0724 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
            Row(
              children: [
                numButton('1', ''),
                SizedBox(width: 20),
                numButton('2', 'A B C'),
                SizedBox(width: 20),
                numButton('3', 'D E F'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                numButton('4', 'G H I'),
                SizedBox(width: 20),
                numButton('5', 'J K L'),
                SizedBox(width: 20),
                numButton('6', 'M N O'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                numButton('7', 'P Q R S'),
                SizedBox(width: 20),
                numButton('8', 'T U V'),
                SizedBox(width: 20),
                numButton('9', 'W X Y Z'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                numButton('*', null),
                SizedBox(width: 20),
                numButton('0', '+'),
                SizedBox(width: 20),
                numButton('#', null),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                SizedBox(width: 20),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      // 101, 196, 102
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(101, 196, 102, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        CupertinoIcons.phone_fill,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget numButton(String numberText, String? subText) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numberText,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              if (subText != null)
                Text(
                  subText,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
