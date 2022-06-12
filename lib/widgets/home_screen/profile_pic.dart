import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';

class ProfilePic extends StatelessWidget {
  final String? url;
  const ProfilePic({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(200),
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image(
          image: NetworkImage(url ?? Faker().image.image()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
