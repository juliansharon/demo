import 'package:demo/models/picsum_result/picsum_result.dart';
import 'package:demo/widgets/home_screen/header_section.dart';
import 'package:demo/widgets/home_screen/story_section.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [HeaderSecttion(), StorySection()],
      ),
    );

    // return ListView.builder(
    //   itemCount: data.length,
    //   itemBuilder: (_, i) => Text(
    //     data[i].author ?? "",
    //   ),
    // );
  }
}
