import 'package:flutter/material.dart';

class Home0821 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 300,
            color: Colors.blueGrey[900],
            child: CustomPaint(
              foregroundPainter: _MyPainter(),
              child: Row(
                children: [
                  bar('일'),
                  SizedBox(width: 10),
                  bar('월'),
                  SizedBox(width: 10),
                  bar('화'),
                  SizedBox(width: 10),
                  bar('수'),
                  SizedBox(width: 10),
                  bar('목'),
                  SizedBox(width: 10),
                  bar('금'),
                  SizedBox(width: 10),
                  bar('토'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bar(String day) {
    return Expanded(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          day,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    // 일, 월, 화, 수, 목, 금, 토
    // 40%, 25%, 15%, 60%, 70%, 85%, 50%

    double maxWidth = size.width;
    double maxHeight = size.height;
    double barWidth = (maxWidth - 60) / 7;
    double halfBarWidth = barWidth / 2;

    Paint brush = Paint();
    brush.color = Colors.red;
    brush.strokeWidth = 3;
    final values = [40, 25, 15, 60, 70, 85, 50];
    final points = <Offset>[];
    for (var i = 0; i < values.length; i++) {
      final v = values[i];

      /// canvas.drawLine 이용해서 각 점들 선 그리기
      points.add(
        Offset(halfBarWidth + (barWidth + 10) * i,
            maxHeight - maxHeight * v / 100),
      );
      canvas.drawCircle(points[i], 8, brush);

      // TODO 곡선으로 바꾸기(잠정적 연기 - 로직 복잡)
    }
    // 선은 6번만 그리면 됨
    for (var i = 1; i < points.length; i++) {
      canvas.drawLine(points[i - 1], points[i], brush);
    }

    // canvas.drawLine(
    //   Offset(halfBarWidth, maxHeight - maxHeight * 40 / 100),
    //   Offset(dx, dy),
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
