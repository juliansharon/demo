import 'package:demo/widgets/home_screen/icon_holders.dart';
import 'package:demo/widgets/home_screen/profile_pic.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class PostBox extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  const PostBox({Key? key, this.hintText, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      child: Row(
        children: [
          const ProfilePic(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 40,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: hintText ?? "what do you think",
                ),
              ),
            ),
          )),
          IconHolder(icon: icon ?? Icons.image)
        ],
      ),
    );
  }
}
