import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza/components/macro.dart';
import 'package:pizza/constants/colors.dart';
import 'package:pizza/helpers/app_images.dart';

class DetailesScreen extends StatelessWidget {
  const DetailesScreen({super.key});

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
              height: 10,
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            "Truffle Temptation Extravaganza",
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
                                  "\$12.00",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                const Text(
                                  "\$15.00",
                                  style: TextStyle(
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
                    const Row(
                      children: [
                        macro(),
                         SizedBox(
                          width: 5,
                        ),
                       macro(),
                        SizedBox(
                          width: 5,
                        ),
                       macro(),
                        SizedBox(
                          width: 5,
                        ),
                     macro()
                      ],
                    )
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

