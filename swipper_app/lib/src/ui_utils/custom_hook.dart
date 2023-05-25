import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

SwiperController useSwipeController() {
  return use(
    const _PageControllerHook(),
  );
}

class _PageControllerHook extends Hook<SwiperController> {
  const _PageControllerHook();

  @override
  HookState<SwiperController, Hook<SwiperController>> createState() =>
      _PageControllerHookState();
}

class _PageControllerHookState
    extends HookState<SwiperController, _PageControllerHook> {
  late final controller = SwiperController();

  @override
  SwiperController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'usePageController';
}
