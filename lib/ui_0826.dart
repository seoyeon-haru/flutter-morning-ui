import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_morning_ui/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// SliverAppBar: CustomScrollView 에서 AppBar 사용하고 싶을 때
// SliverToBoxAdapter: 일반위젯을 CustomScrollView 에서 사용하고 싶을 때
// SliverList: ListView를 CustomScrollView 에서 사용하고 싶을 때
// SliverPersistentHeader: 항상 표시되는 Sliver
class Home0826 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],

      /// ListView, singleChildScrollView는 전체가 하나의 영역으로 스크롤이 됨
      /// CustomScrollView : 영역을 세세하게 조절할 수 있는 위젯
      /// => 세세하게 조절하는 영역을 Sliver (스크롤 영역의 조각)
      body: CustomScrollView(
        // ListView의 children에 해당하는 속성!
        // Widget 이 들어가지 않고
        // 스크롤 영역의 조각 객체 (Sliver) 가 들어감
        slivers: [
          // SliverAppBar(
          //   /// pinned : 최소 높이가 되었을 때 더 이상 스크롤되지 않고 고정할지 여부
          //   pinned: true,
          //   title: Text('슬리버 앱바'),

          //   /// expandedHeight flexibleSpace 의 최대 높이
          //   expandedHeight: 300,

          //   /// flexibleSpace 늘어났다 줄어들었다 가능
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text('플랙시블 스페이스'),
          //     background: Opacity(
          //       opacity: .5,
          //       child: Image.network(
          //         'https://picsum.photos/200/300',
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
          // 스크롤 영역을 조금 더 자유롭게 구현
          SliverPersistentHeader(
            /// minExtent 밑으로 줄어들지 않음
            pinned: true,
            // pinned false 로 주고 많이 사용
            // floating true 로 주게 되면 현재 스크롤의 위치가
            // 최상단이 아니더라도 스크롤 아래로 이동하면 나타남
            // floating: true,
            delegate: MySliver(),
          ),
          // 위젯과 Sliver 사이의 다리 역할
          // CustomScrollView 내에서 일반 위젯 사용하고 싶을 때 사용
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20)

                  /// copyWith: 객체 복사하는 함수
                  /// 파라미터에 null 을 넘겨주면 기존값, 값을 넘겨주면 해당 값이 적용되어
                  /// 새로운 객체 생성해서 반환
                  .copyWith(bottom: 20),
              child: Text(
                '어댑터',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          // 들어가는 속성 및 객체 이름만 다르고
          // 위젯을 반환하는 함수는 ListView.builder 의 itemBuilder 속성에 들어가는
          // 함수와 동일
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // 원, 선 노랑, 글자 검정
                return Container(
                  width: double.infinity,
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            )),
                          ),
                          Expanded(
                            // 에러 나서 Expanded로 감쌈
                            child: Container(
                              width: 4,
                              height: double.infinity,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        // 모든 Text 위젯에 동일한 스타일을 적용하고 싶을때 사용
                        // (style 선언 안 한 Text만 적용)
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          child: Column(
                            // center 고정이라 변경해줘야 함
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // Text 길어지면 overflow 오류 방지하기 위해
                                  Expanded(
                                    child: Text(
                                      'Coffee Shop',
                                      maxLines: 1,
                                      // 길어지면 뒤에 ... 나오게
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Text('2.5km')
                                ],
                              ),
                              SizedBox(height: 10),
                              Text('서울특별시 서초구 반포동')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              // ListView.builder 의 itemCount 속성과 동일
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class MySliver extends SliverPersistentHeaderDelegate {
  GoogleMapController? mapController;
  // 그릴 위젯 반환
  /// CustomScrollView 가 스크롤 될 때
  /// MySliver 의 높이가 변경될 때 호출됨
  /// shrinkOffset => 현재 MySliver 의 위치
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    print('MySliver shrinkOffset : $shrinkOffset');
    return Stack(
      children: [
        Container(
          color: Colors.green,
          // 한 번 초기화되고 나서 속성 변경 후 테스트할 때 리스타트 해줘야 함
          child: GoogleMap(
            /// CustomScrollView 안에서 GoogleMap 사용 시
            /// 제스처 우선순위 (특히 드래그) 가 CustomScrollView 가 높아서
            /// 지도의 드래그 제스처가 작동 잘 안함
            /// 제스처 우선순위를 가져오기 해야됨
            /// gestureRecognizers : 구글 맵이 어떤 제스처 우선순위 가져올지 정하는
            gestureRecognizers: {
              /// Factory : 객체를 생성하는 함수 가지고 있는 클래스
              /// 필요할 때마다 함수 실행해서 객체를 생성
              Factory(
                /// EagerGestureRecognizer 우선순위 정할 때 강제로 우선순위 가장 높게 설정
                /// 사용자의 제스처가 발생했을 때 (터치, 드래그 등) 항상 먼저 제스처 이벤트를 가져감
                () => EagerGestureRecognizer(),
              ),
            },
            initialCameraPosition: CameraPosition(
              // 지도 제일 처음 보이는 위도 경도
              //35.1681608 129.0573853
              target: LatLng(35.1681608, 129.0573853),
              // 배율
              zoom: 15,
            ),
            markers: {
              Marker(
                /// zIndex :마커의 보여지는 우선순위 결정하는 속성
                /// 숫자 높으면 위에 보이게 됨
                zIndex: 1,
                // 지도에서 중복되면 안되는 값
                // 지도 내에서 마커를 특정하기 위해서 사용
                markerId: MarkerId('1'),
                position: LatLng(
                  35.17510185908504,
                  128.94967909902334,
                ),
                onTap: () {
                  print('마커 터치됨');
                },
                icon: markerIcon!,
              ),
              // Marker(
              //     zIndex: 0,
              //     // 지도에서 중복되면 안되는 값
              //     // 지도 내에서 마커를 특정하기 위해서 사용
              //     markerId: MarkerId('2'),
              //     position: LatLng(
              //       35.17550185908504,
              //       128.94967909902334,
              //     )),
            },
            // Google 기본 현재 위치 아이콘 보여지는지 여부
            // 보통 디자인이 이쁘지 않아서 false 로 비활성화 시켜주고
            // Stack 위젯으로 버튼 위젯 겹쳐서 구현
            // 버튼 위젯 내에서 GoogleMapController 이용해서 지도 위치 이동
            myLocationButtonEnabled: false,
            // 이동한 지도의 가운데에 해당하는 위도 경도를 가지고 있는 객체
            onCameraMove: (position) {
              print(position);
            },
            polylines: {
              /// points 속성에 위치좌표 리스트안에 넣어주면
              /// 선을 만들어줌
              Polyline(
                polylineId: PolylineId('1'),
                color: Colors.amber,
                visible: true,
                width: 10,
                points: [
                  LatLng(36.17510185908504, 128.94967909902334),
                  LatLng(35.17550185908504, 128.94967909902334)
                ],
              ),
            },
            // 구글 맵이 초기화되고 나서 실행되는 함수
            // GoogleMapController 라는 타입의 controller 파라미터 넘겨주는데
            // 지도가 초괴화되고 나서 지도를 제어할 수 있는 역할
            onMapCreated: (controller) async {
              await Future.delayed(Duration(seconds: 3));
              // 구글맵 이동할 때 사용
              controller.animateCamera(
                CameraUpdate.newLatLng(
                  LatLng(
                    35.17510185908504,
                    128.94967909902334,
                  ),
                ),
              );
              // 변수에 담아뒀다가 사용
              // 지도가 초기화되었을 때만 전달해주기 때문에
              // 나중에 지도를 제어하기 위해서 변수에 담아서 사용
              mapController = controller;
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),
        )
      ],
    );
  }

  // 최대 높이
  @override
  double get maxExtent => 600;

  // 최소 높이
  @override
  double get minExtent => 300;

  /// shouldRebuild : MySliver 의 속성이 변경되었을 때 다시 그릴지 여부
  /// CustomPainter 사용할 때 사용했던 메서드
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
