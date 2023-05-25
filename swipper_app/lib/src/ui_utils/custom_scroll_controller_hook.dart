// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// ScrollController useScrollController({
//   double initialScrollOffset = 0.0,
//   bool keepScrollOffset = true,
//   String? debugLabel,
//   List<Object?>? keys,
// }) {
//   return use(
//     _ScrollControllerHook(
//       initialScrollOffset: initialScrollOffset,
//       keepScrollOffset: keepScrollOffset,
//       debugLabel: debugLabel,
//       keys: keys,
//     ),
//   );
// }

// class _ScrollControllerHook extends Hook<ScrollController> {
//   const _ScrollControllerHook({
//     required this.initialScrollOffset,
//     required this.keepScrollOffset,
//     this.debugLabel,
//     List<Object?>? keys,
//   }) : super(keys: keys);

//   final double initialScrollOffset;
//   final bool keepScrollOffset;
//   final String? debugLabel;

//   @override
//   HookState<ScrollController, Hook<ScrollController>> createState() =>
//       _ScrollControllerHookState();
// }

// class _ScrollControllerHookState
//     extends HookState<ScrollController, _ScrollControllerHook> {
//   late final controller = ScrollController(
//     initialScrollOffset: hook.initialScrollOffset,
//     keepScrollOffset: hook.keepScrollOffset,
//     debugLabel: hook.debugLabel,
//   );

//   @override
//   ScrollController build(BuildContext context) => controller;

//   @override
//   void dispose() => controller.dispose();

//   @override
//   String get debugLabel => 'useScrollController';
// }

// /**
//  * @hookMethod
// SwipeController useSwipeController({
//   required SwipeDirection initialDirection,
//   required void Function(SwipeDirection direction) listener,
// }) {
//   final controller = SwipeController(initialDirection: initialDirection);
//   controller.addListener(listener);
//   return controller;
// }
//  */

// abstract class IndexControllerEventBase {
//   final bool animation;

//   final completer = Completer<void>();
//   Future<void> get future => completer.future;
//   void complete() {
//     if (!completer.isCompleted) {
//       completer.complete();
//     }
//   }

//   IndexControllerEventBase({
//     required this.animation,
//   });
// }

// mixin TargetedPositionControllerEvent on IndexControllerEventBase {
//   double get targetPosition;
// }
// mixin StepBasedIndexControllerEvent on TargetedPositionControllerEvent {
//   int get step;
//   int calcNextIndex({
//     required int currentIndex,
//     required int itemCount,
//     required bool loop,
//     required bool reverse,
//   }) {
//     var cIndex = currentIndex;
//     if (reverse) {
//       cIndex -= step;
//     } else {
//       cIndex += step;
//     }

//     if (!loop) {
//       if (cIndex >= itemCount) {
//         cIndex = 0;
//       } else if (cIndex < 0) {
//         cIndex = itemCount - 1;
//       }
//     }
//     return cIndex;
//   }
// }

// class NextIndexControllerEvent extends IndexControllerEventBase
//     with TargetedPositionControllerEvent, StepBasedIndexControllerEvent {
//   NextIndexControllerEvent({
//     required bool animation,
//   }) : super(
//           animation: animation,
//         );

//   @override
//   int get step => 1;

//   @override
//   double get targetPosition => 1;
// }

// class PrevIndexControllerEvent extends IndexControllerEventBase
//     with TargetedPositionControllerEvent, StepBasedIndexControllerEvent {
//   PrevIndexControllerEvent({
//     required bool animation,
//   }) : super(
//           animation: animation,
//         );
//   @override
//   int get step => -1;

//   @override
//   double get targetPosition => 0;
// }

// class MoveIndexControllerEvent extends IndexControllerEventBase
//     with TargetedPositionControllerEvent {
//   final int newIndex;
//   final int oldIndex;
//   MoveIndexControllerEvent({
//     required this.newIndex,
//     required this.oldIndex,
//     required bool animation,
//   }) : super(
//           animation: animation,
//         );
//   @override
//   double get targetPosition => newIndex > oldIndex ? 1 : 0;
// }

// class IndexController extends ChangeNotifier {
//   IndexControllerEventBase? event;
//   int index = 0;
//   Future move(int index, {bool animation = true}) {
//     final e = event = MoveIndexControllerEvent(
//       animation: animation,
//       newIndex: index,
//       oldIndex: this.index,
//     );
//     notifyListeners();
//     return e.future;
//   }

//   Future next({bool animation = true}) {
//     final e = event = NextIndexControllerEvent(animation: animation);
//     notifyListeners();
//     return e.future;
//   }

//   Future previous({bool animation = true}) {
//     final e = event = PrevIndexControllerEvent(animation: animation);
//     notifyListeners();
//     return e.future;
//   }
// }
