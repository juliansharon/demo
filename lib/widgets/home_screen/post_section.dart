import 'package:demo/cubits/image_fetch/imagefetch_cubit.dart';
import 'package:demo/widgets/home_screen/error.dart';
import 'package:demo/widgets/home_screen/loader.dart';
import 'package:demo/widgets/home_screen/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostSection extends StatelessWidget {
  const PostSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagefetchCubit, ImagefetchState>(builder: (_, state) {
      if (state is ImagefectchLoading) {
        return const Loader();
      }
      if (state is ImagefetchLoaded) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: ListView.builder(
              shrinkWrap: false,
              itemCount: state.resultdata.length,
              itemBuilder: (_, i) {
                return Post(data: state.resultdata[i]);
              }),
        );
      }
      return const ErrorPage();
    });
  }
}
