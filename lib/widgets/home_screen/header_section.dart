import 'package:demo/widgets/home_screen/icon_holders.dart';
import 'package:flutter/material.dart';

class HeaderSecttion extends StatelessWidget {
  const HeaderSecttion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: const [
          Expanded(
              child: Text(
            "Feed",
            style: TextStyle(
                color: Color.fromARGB(255, 13, 109, 219),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          )),
          IconHolder(icon: Icons.search),
          SizedBox(
            width: 10,
          ),
          IconHolder(icon: Icons.mail)
        ],
      ),
    );
  }
}
