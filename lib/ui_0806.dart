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
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    todoList(
                        'Wakeup', '7:00 AM', 'Early wakeup from bed and fresh'),
                    SizedBox(height: 25),
                    todoList(
                        'Morning Excersise', '8:00 AM', '4 types of exercise'),
                    SizedBox(height: 25),
                    todoList('Meeting', '9:00 AM',
                        'Zoom call, Discuss team task for the day'),
                    SizedBox(height: 25),
                    todoList('Breakfase', '10:00 AM',
                        'Morning breakfase with bread, banana egg bowel and tea'),
                  ],
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }

  Widget todoList(String todo, String time, String sen) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),
              SizedBox(height: 5),
              //세로줄
              Expanded(
                child: Container(
                  width: 2,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          SizedBox(width: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 270,
            constraints: const BoxConstraints(minHeight: 80),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      todo,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  sen,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
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
