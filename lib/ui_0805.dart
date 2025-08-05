import 'package:flutter/material.dart';

class Home0805 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("막대그래프")),
      body: Column(
        children: [
          // 컨테이너 안에서
          // 월~일 막대 출력
          // 막대하나당 0.0~1.0 사이 값
          Container(
            width: double.infinity,
            height: 400,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "막대그래프",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "월화수목금토일",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bar(ratio: .5, label: "월", color: Colors.red),
                      Bar(ratio: .2, label: "화", color: Colors.orange),
                      Bar(ratio: .7, label: "수", color: Colors.yellow),
                      Bar(ratio: .34, label: "목", color: Colors.green),
                      Bar(ratio: .12, label: "금", color: Colors.blue),
                      Bar(ratio: 1, label: "토", color: Colors.indigo),
                      Bar(ratio: .5, label: "일", color: Colors.purple),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  Bar({
    super.key,
    required this.ratio,
    required this.label,
    required this.color,
  });

  double ratio;
  String label;
  Color color;

  @override
  Widget build(BuildContext context) {
    final width = 30.0;

    return Column(
      children: [
        SizedBox(height: 20),
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  BoxConstraints;
                  return Container(
                    height: constraints.maxHeight * ratio,
                    width: width,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(label),
      ],
    );
  }
}
