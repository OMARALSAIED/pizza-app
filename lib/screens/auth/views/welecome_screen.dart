import 'dart:ui';

import 'package:flutter/material.dart';

class WelecomeScreen extends StatefulWidget {
  const WelecomeScreen({super.key});

  @override
  State<WelecomeScreen> createState() => _WelecomeScreenState();
}

class _WelecomeScreenState extends State<WelecomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(20, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(2.7, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              BackdropFilter(filter: ImageFilter.blur(sigmaX: 100.0,sigmaY: 100.0),child: Container(),),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/1.8,
                  child: Column(children: [
                  Padding(padding: 
                  const EdgeInsets.symmetric(horizontal: 50.0),
                  // child: TabBar(
                  //   // controller: tabController,
                  //   // unselectedLabelColor: Theme.of(context).colorScheme.,
                    
                  //   // tabs: tabs),
                  // )
                )],),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
