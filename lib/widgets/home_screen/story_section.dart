import 'package:demo/cubits/image_fetch/imagefetch_cubit.dart';
import 'package:demo/models/picsum_result/picsum_result.dart';
import 'package:demo/widgets/home_screen/error.dart';
import 'package:demo/widgets/home_screen/story_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StorySection extends StatelessWidget {
  const StorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagefetchCubit, ImagefetchState>(
      builder: (context, state) {
        return SizedBox(
          height: 150,
          child: state is ImagefectchLoading
              ? _showLoaders()
              : state is ImagefetchLoaded
                  ? _showdata(state)
                  : _showError(),
        );
      },
    );
  }

  _showLoaders() {
    return ListView(scrollDirection: Axis.horizontal, children: const [
      StoryTile(),
      StoryTile(),
      StoryTile(),
      StoryTile(),
      StoryTile(),
    ]);
  }

  _showdata(ImagefetchLoaded state) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.resultdata.length,
      itemBuilder: (_, i) => StoryTile(
        data: state.resultdata[i],
      ),
    );
  }

  _showError() {
    return ErrorPage();
  }
}
