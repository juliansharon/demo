import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/cubits/image_fetch/imagefetch_cubit.dart';
import 'package:demo/models/picsum_result/picsum_result.dart';
import 'package:demo/widgets/home_screen/post_box.dart';
import 'package:demo/widgets/home_screen/profile_pic.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Post extends StatefulWidget {
  final PicsumResult data;

  const Post({Key? key, required this.data}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagefetchCubit, ImagefetchState>(
      builder: (context, state) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                height: 10,
                thickness: 1,
              ),
            ),
            Row(
              children: [
                ProfilePic(
                  url: Faker().image.image(keywords: ["man", "women"]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.author ?? "author",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: const [
                          Text("30 mins .",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.group,
                            size: 14,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () => setState(() {
                    liked = !liked;
                  }),
                  child: Icon(
                    Icons.favorite,
                    color: liked ? Colors.red : Colors.grey.shade400,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.data.downloadUrl ?? "",
                  )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: PostBox(
                hintText: "Say Something",
                icon: Icons.share,
              ),
            )
          ],
        );
      },
    );
  }
}
