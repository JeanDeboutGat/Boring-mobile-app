import 'package:flutter/material.dart';
import 'package:me_bored/constants.dart';

import 'CustomAppBar.dart';
import 'SwipableCategory.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(true, true, preferredSize: Size(56, 56)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SwipableCategory(),
                    SizedBox(
                      width: 8,
                    ),
                    SwipableCategory(),
                    SizedBox(
                      width: 8,
                    ),
                    SwipableCategory(),
                  ],
                )),
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Text("Activities"),
                    ),
                    Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(
                                width: 3, color: Color(COLORS.primary))),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Image(
                                image: AssetImage("assets/undraw_cooking.png"),
                              ),
                              const Text("Make bread from scratch"),
                              const SizedBox(width: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text("Participants"),
                                          Image(
                                              image: AssetImage(
                                                  "assets/participants-group.png"))
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text("Accessibility"),
                                          Image(
                                              image: AssetImage(
                                                  "assets/accessibility-highlighted.png")),
                                          Image(
                                              image: AssetImage(
                                                  "assets/accessibility-highlighted.png")),
                                          Image(
                                              image: AssetImage(
                                                  "assets/accessibility-highlighted.png")),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text("Cost "),
                                          Image(
                                              image: AssetImage(
                                                  "assets/cost-highlighted.png")),
                                          Image(
                                              image: AssetImage(
                                                  "assets/cost-highlighted.png")),
                                          Image(
                                              image: AssetImage(
                                                  "assets/cost-highlighted.png")),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text("Type"),
                                          Image(
                                              image: AssetImage(
                                                  "assets/cook.png")),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      backgroundColor: const Color(COLORS.secondary),
                      onPressed: () {
                        const snackBar = SnackBar(
                          content: Text('Your activity is added in todo-list', style: TextStyle(color: Colors.black)),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                          backgroundColor: Color(COLORS.secondary),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(
                                  width: 3, color: Color(COLORS.primary))),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child:
                          const Icon(Icons.add, color: Color(COLORS.primary)),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
