import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza/components/macro.dart';
import 'package:pizza/constants/colors.dart';
import 'package:pizza/helpers/app_images.dart';
import 'package:pizza/helpers/styles.dart';
import 'package:pizza_repository/pizza_repository.dart';

class DetailesScreen extends StatelessWidget {
  final Pizza? pizza;
  DetailesScreen({super.key, this.pizza});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - (40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kwhite,
                  boxShadow: const [
                    BoxShadow(
                        color: kgrey, offset: const Offset(3, 3), blurRadius: 5)
                  ],
                  image: const DecorationImage(
                      image: AssetImage(AppImages.pizza))),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kwhite,
                boxShadow: const [
                  BoxShadow(
                      color: kgrey, offset: const Offset(3, 3), blurRadius: 5)
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            pizza!.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$${pizza!.price - (pizza!.price * (pizza!.discount) / 100)}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                Text(
                                  "\$${pizza!.price}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: kgrey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        macro(
                          icon: FontAwesomeIcons.fire,
                          value: pizza!.macros.calories,
                          title: "Calories",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        macro(
                          icon: FontAwesomeIcons.dumbbell,
                          value: pizza!.macros.proteins,
                          title: "Protein",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        macro(
                          icon: FontAwesomeIcons.oilWell,
                          value: pizza!.macros.fat,
                          title: "Fat",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        macro(
                          icon: FontAwesomeIcons.breadSlice,
                          value: pizza!.macros.carbs,
                          title: "Carbs",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              elevation: 3.0,
                              backgroundColor: kblack,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          child: const Text(
                            "Buy Now",
                            style: Styles.textstyle20,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
