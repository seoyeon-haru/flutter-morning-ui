import 'dart:math';

import 'package:flutter/material.dart';

class Home0820 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            color: Colors.green[100],
            child: CustomPaint(
              painter: _MyPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override

  /// Canvas : 할당받은 크기의 영역 내에서 자유롭게 그릴 수 있는 객체,
  /// 그리기 위한 여러가지 메서드가 포함되어 있음
  /// Size 객체 : CustomPainter 가 가지고 있는 크기 => 부모 위젯으로부터 물려받은 크기
  /// 가로, 세로 정보만 담고 있는 객체
  void paint(Canvas canvas, Size size) {
    // paint 객체 : 붓 색상, 붓 두께 , 끝 둥글기
    Paint brush = Paint();
    brush.color = Colors.pinkAccent;
    // 원을 그릴 때
    // canvas.drawCircle(Offset(150, 150), 50, p1);
    final center = Offset(size.width / 2, size.height / 2);

    final values = [15, 10, 20, 18, 7, 30];
    final colors = [
      Colors.pink,
      Colors.orange,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.indigo,
    ];
    double startAngle = -90.toRadian();
    double radius = size.width / 3;
    for (var i = 0; i < values.length; i++) {
      final percentage = values[i];
      final color = colors[i];
      double sweepAngle = percentage.percentageToRadian();

      // 호를 그릴 때
      /// 두 번째 인자 : startAngle : 정의한 각도만큼 회전 => 3시 방향이 시작점
      /// 세 번째 인자 : sweepAngle : 정의한 각도만큼 호를 그림
      Rect rect2 = Rect.fromCircle(center: center, radius: radius);
      brush.color = color;
      canvas.drawArc(rect2, startAngle, sweepAngle, true, brush);

      startAngle = startAngle + sweepAngle;
      radius = radius + 5;
    }
  }

  /// _MyPainter 속성이 바뀌었을 때 다시 그릴지 여부
  /// true => 다시 그림
  /// false => 다시 그리지 않음
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

extension DouleExt on double {
  double toRadian() {
    return this / 360 * 2 * pi;
  }

  /// 백분율을 호도법으로 변환
  /// 25.percentageToRadian() => pi /2
  /// 50.percentageToRadian() => pi
  double percentageToRadian() {
    return this / 100 * 2 * pi;
  }
}

extension IntExt on int {
  double toRadian() {
    return this / 360 * 2 * pi;
  }

  double percentageToRadian() {
    return this / 100 * 2 * pi;
  }
}
