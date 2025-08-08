import 'package:flutter/material.dart';

// 하단 네비게이션은 무시!
class Home0806 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    print(index);
                    // index == 0 => 오늘날짜가 포함된 주차
                    // index == 1 => 오늘날짜가 포함된 주차의 다음주
                    // index == 2 => 오늘날짜가 포함된 주차의 다다음주
                    // ...
                    // index == 9 => 오늘날짜가 포함된 주차의 9주 후
                    // 날짜 위젯이 오늘일때는 파란색으로 출력, 날짜밑에 점(.) 출력
                    // 오늘 날짜가 속한 주의 월요일 찾기!
                    DateTime startOfWeek = today.subtract(
                      Duration(days: today.weekday - 1),
                    );
                    startOfWeek = startOfWeek.add(Duration(days: index * 7));
                    List<Widget> children = [];
                    final dayNames = [
                      "Mon",
                      "Tue",
                      "Wed",
                      "Thu",
                      "Fri",
                      "Sat",
                      "Sun",
                    ];
                    for (var i = 0; i < 7; i++) {
                      int dayNumber = startOfWeek.day + i;
                      bool isToday = dayNumber == today.day &&
                          startOfWeek.month == today.month &&
                          startOfWeek.year == today.year;
                      children.add(day(dayNames[i], "$dayNumber", isToday));
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: children),
                    );
                  },
                ),
              ),
              Expanded(child: Container(height: 50, color: Colors.lightGreen)),
              //
            ],
          ),
        ),
      ),
    );
  }

  Widget day(String dayLabel, String day, bool isToday) {
    Color selectedColor = Colors.blue;
    final textStyle = isToday
        ? TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: selectedColor,
          )
        : TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          );

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dayLabel, style: textStyle),
          Text(day, style: textStyle),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: isToday ? selectedColor : null,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
