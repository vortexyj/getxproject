import 'package:flutter/material.dart';
import 'package:getxproject/pages/buttomsheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 13, left: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://avatars.githubusercontent.com/u/37553901?v=4',
            height: 60,
            width: 60,
          ),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ButtomSheet();
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
    ));
  }
}
