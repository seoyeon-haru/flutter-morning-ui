import 'package:flutter/material.dart';

// 하단 네비게이션은 무시!
class Home0806 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("${today.year}년 ${today.month}월 ${today.day}"),
            Text(
              "Today",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80,
              child: PageView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  // TODO today 라는변수에 담긴 값을 이용해서 날짜 출력!
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        day("Mon", "4"),
                        day("Tue", "5"),
                        day("Wed", "6"),
                        day("Thu", "7"),
                        day("Fri", "8"),
                        day("Sat", "9"),
                        day("Sun", "10"),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(child: Container(height: 50, color: Colors.lightGreen)),
            //
          ],
        ),
      ),
    );
  }

  Widget day(String dayLabel, String day) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayLabel,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Text(
            day,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
