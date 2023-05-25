import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);
final swipeCOntrollerProvider = Provider<SwiperController>((ref) {
  final swipecontroller = SwiperController();
  ref.onDispose(() {
    swipecontroller.dispose();
  });
  return swipecontroller;
});
