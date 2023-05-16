// 가맹점 찾기 - Map Screen
import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';


class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NaverMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.5665, 126.9780),
          zoom: 14.0,
        ),
      ),
    );
  }
}
