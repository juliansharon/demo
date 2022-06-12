import 'package:demo/models/picsum_result/picsum_result.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  final List<PicsumResult> data;
  const MainView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, i) => Text(
        data[i].author ?? "",
      ),
    );
  }
}
