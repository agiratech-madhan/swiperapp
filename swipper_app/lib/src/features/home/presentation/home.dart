import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swipper_app/src/features/home/presentation/widgets.dart/slider.dart';
import 'package:swipper_app/src/utils/src/extensions/color_extension.dart';
import 'package:swipper_app/src/utils/src/helpers/ui_dimens.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.purple,
        title: Text(
          "Swiper App",
          style: context.textThemes.titleLarge?.copyWith(color: Colors.white),
        ),
        toolbarHeight: UIDimens.size80,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: Column(
        children: [
          const SliderWidget(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: UIDimens.size10),
              padding: const EdgeInsets.only(top: UIDimens.size20),
              height: context.screenHeight * 0.4,
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(200),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(images[0]),
                    ),
                    title: Text(
                      "Andreson Marckle",
                      style: context.textThemes.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Machine learning is a branch of artificial intelligence (AI) and computer science which focuses on the use of data and algorithms to imitate the way.",
                    style: context.textThemes.titleLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ).paddingAll(UIDimens.size16)
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        shape: const StadiumBorder(),
        onPressed: () async {},
        child: const Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }
}
