import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swipper_app/src/utils/src/helpers/ui_dimens.dart';

import '../../providers/providers.dart';

final List<String> images = [
  "https://www.simplilearn.com/ice9/free_resources_article_thumb/What_is_the_Importance_of_Technology.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW5g9J-H5IyEA0Ka7lgmB6EPvQik26NcJdI4oaYOtTQVR0SGhGqhI2noEzLWO69QbjGZI&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo_kuW-2nvWxTRlLSnElwerO5dgkVXVMEx0hejsTKJG3rNoF5nzeVekJOlEojH4OQhTR8&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6vqp_5lUBWIisNHXwUPPv0o6Jr6abjgn3kSN1KU3boJuUFUxSfRe_68ZETSR2i0Oz1js&usqp=CAU"
];

class SliderWidget extends HookConsumerWidget {
  const SliderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final cons = ref.watch(swipeCOntrollerProvider);
    return Column(
      children: [
        SizedBox(
          height: context.screenHeight * 0.4,
          child: Swiper(
            itemWidth: 300,
            itemHeight: 225,
            loop: false,
            duration: 1200,
            controller: cons,
            allowImplicitScrolling: true,
            onIndexChanged: (int index) {
              ref.read(currentIndexProvider.notifier).state = index;
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  width: 400,
                  height: 400,
                  images[index],
                  fit: BoxFit.fill,
                ),
              );
            },
            indicatorLayout: PageIndicatorLayout.COLOR,
            autoplay: true,
            itemCount: images.length,
            layout: SwiperLayout.STACK,
          ),
        ),
        AnimatedSmoothIndicator(
          count: images.length,
          activeIndex: currentIndex,
          effect: const WormEffect(
            dotHeight: 18,
            activeDotColor: Colors.purple,
            dotWidth: 18,
            type: WormType.underground,
          ),
          onDotClicked: (index) {
            cons.move(index, animation: true);
          },
        ),
      ],
    );
  }
}
