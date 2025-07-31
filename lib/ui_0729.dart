import 'package:flutter/material.dart';

class Home0729 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 어떤 날짜를 입력받더라도 해당 날짜가 속해있는 달의 달력 출력!
    // DateTime date = DateTime.now();
    DateTime date = DateTime.now();
    DateTime beginDate = DateTime(date.year, date.month, 1);
    final endOfmonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    int endDate = endOfmonths[date.month - 1];
    if (date.month == 2 && date.year % 4 == 0) {
      endDate = 29;
    }
    int weekday = beginDate.weekday == 7 ? 0 : beginDate.weekday;

    List<String> days = [];
    for (var i = 0; i < weekday; i++) {
      days.add('');
    }
    for (var i = 1; i <= endDate; i++) {
      days.add("$i");
    }
    while (days.length % 7 != 0) {
      days.add('');
    }
    int weekCount = (days.length / 7).ceil();
    return Scaffold(
      appBar: AppBar(
        title: Text('달력'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                dayLabel('S'),
                SizedBox(width: 2),
                dayLabel('M'),
                SizedBox(width: 2),
                dayLabel('T'),
                SizedBox(width: 2),
                dayLabel('W'),
                SizedBox(width: 2),
                dayLabel('T'),
                SizedBox(width: 2),
                dayLabel('F'),
                SizedBox(width: 2),
                dayLabel('S'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                dayBox(days[0]),
                dayBox(days[1]),
                dayBox(days[2]),
                dayBox(days[3]),
                dayBox(days[4]),
                dayBox(days[5]),
                dayBox(days[6]),
              ],
            ),
            Row(
              children: [
                dayBox(days[7]),
                dayBox(days[8]),
                dayBox(days[9]),
                dayBox(days[10]),
                dayBox(days[11]),
                dayBox(days[12]),
                dayBox(days[13]),
              ],
            ),
            Row(
              children: [
                dayBox(days[14]),
                dayBox(days[15]),
                dayBox(days[16]),
                dayBox(days[17]),
                dayBox(days[18]),
                dayBox(days[19]),
                dayBox(days[20]),
              ],
            ),
            Row(
              children: [
                dayBox(days[21]),
                dayBox(days[22]),
                dayBox(days[23]),
                dayBox(days[24]),
                dayBox(days[25]),
                dayBox(days[26]),
                dayBox(days[27]),
              ],
            ),
            if (weekCount > 4)
              Row(
                children: [
                  dayBox(days[28]),
                  dayBox(days[29]),
                  dayBox(days[30]),
                  dayBox(days[31]),
                  dayBox(days[32]),
                  dayBox(days[33]),
                  dayBox(days[34]),
                ],
              ),
            if (weekCount > 5)
              Row(
                children: [
                  dayBox(days[35]),
                  dayBox(days[36]),
                  dayBox(days[37]),
                  dayBox(days[38]),
                  dayBox(days[39]),
                  dayBox(days[40]),
                  dayBox(days[41]),
                ],
              ),
            grid(),
          ],
        ),
      ),
    );
  }

  Widget grid() {
    DateTime date = DateTime.now();

    DateTime beginDate = DateTime(date.year, date.month, 1);
    final endOfmonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    int endDate = endOfmonths[date.month - 1];
    if (date.month == 2 && date.year % 4 == 0) {
      endDate = 29;
    }
    int weekday = beginDate.weekday == 7 ? 0 : beginDate.weekday;

    List<Widget> days = [];
    for (var i = 0; i < weekday; i++) {
      days.add(gridItem(''));
    }
    for (var i = 1; i <= endDate; i++) {
      days.add(gridItem("$i"));
    }

    return Container(
      height: 300,
      color: Colors.blue,
      child: GridView.count(
        crossAxisCount: 7,
        childAspectRatio: 1.2,
        children: days,
      ),
    );
  }

  Widget gridItem(String day) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: day.isEmpty ? null : Colors.grey[400],
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(day),
    );
  }

  SizedBox dayLabel(String engText) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  engText,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget dayBox(String? numberText) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.grey[100]!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (numberText != null)
                Text(
                  numberText,
                  style: TextStyle(fontSize: 25),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
