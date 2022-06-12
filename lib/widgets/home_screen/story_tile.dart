import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/cubits/image_fetch/imagefetch_cubit.dart';
import 'package:demo/models/picsum_result/picsum_result.dart';
import 'package:demo/widgets/home_screen/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryTile extends StatelessWidget {
  final PicsumResult? data;
  const StoryTile({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagefetchCubit, ImagefetchState>(
      builder: (context, state) {
        if (state is ImagefectchLoading) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              child: const Loader(),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
        if (state is ImagefetchLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 200,
                width: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 200,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      data?.downloadUrl ?? ""))),
                          child: Container(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(),
                      ),
                    ),
                    Text(
                      data?.author ?? "author",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
