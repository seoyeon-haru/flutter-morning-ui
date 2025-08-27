import 'package:flutter/material.dart';

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
          child: Center(child: Text('구글 지도 영역')),
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
