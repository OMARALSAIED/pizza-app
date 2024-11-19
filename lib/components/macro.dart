import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza/constants/colors.dart';

class macro extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;

  const macro({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: kgrey, offset: Offset(2, 2), blurRadius: 5)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          FaIcon(
            icon,
            color: kred,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title == "Calories" ? '$value $title' : '${value}g $title',
            style: const TextStyle(fontSize: 10),
          )
        ]),
      ),
    ));
  }
}
