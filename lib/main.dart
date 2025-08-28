import 'package:flutter/material.dart';
import 'package:flutter_morning_ui/ui_0826.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

BitmapDescriptor? markerIcon;
void main() async {
  // runApp 함수 호출되기 전에 비동기 사용할 때
  WidgetsFlutterBinding.ensureInitialized();
  // asset 이미지를 BitmapDescriptor 객체로 변환할 때
  // asset 이미지를 불러오는 과정이 필요한데
  // 파일 불러올 때 비동기로 작동
  markerIcon=
  await BitmapDescriptor.asset(
      ImageConfiguration(
        size: Size(40, 50),
      ),
      'assets/ic_location_on.png');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home0826(),
    );
  }
}
