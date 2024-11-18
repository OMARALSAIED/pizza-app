import 'package:flutter/cupertino.dart';
import 'package:pizza/constants/colors.dart';

class macro extends StatelessWidget {
  const macro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: kgrey,
              offset: Offset(2, 2),
              blurRadius: 5)
        ],
      ),
      child: const Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Column(
          children: [
            Icon(
              CupertinoIcons.airplane,
              color: kred,
            ),
            Text(
              '467 Calories',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    ));
  }
}
