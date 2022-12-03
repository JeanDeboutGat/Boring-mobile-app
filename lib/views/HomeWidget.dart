import 'package:flutter/material.dart';
import 'package:me_bored/constants.dart';
import 'package:me_bored/services/todolist.service.dart';

import '../models/todo.model.dart';
import '../services/service.locator.dart';
import 'CustomAppBarWidget.dart';
import 'SwipableCategoryWidget.dart';
import '../models/activity.model.dart';

final ACCESSIBILITY_MAX = 3;
final COST_MAX = 3;

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {
  Activity activity = Activity("Make bread from scratch", TypeActivity.cooking, Participants.group, 1, 2);
  TodoListService todoListService = getIt<TodoListService>();

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
                      child: Text("Swipe for more Activities"),
                    ),
                    Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(width: 3, color: Color(COLORS.primary))),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage("assets/illustrations/${activity.type.name}.png"),
                              ),
                              const Text("Make bread from scratch"),
                              const SizedBox(width: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Participants"),
                                          Image(
                                              image: AssetImage(activity.participants == Participants.group
                                                  ? "assets/participants-group.png"
                                                  : "assets/participants-one.png"))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Accessibility"),
                                          for (int i = 0; i < activity.accessibility; i++)
                                            const Image(image: AssetImage("assets/accessibility-highlighted.png")),
                                          for (int i = 0; i < ACCESSIBILITY_MAX - activity.accessibility; i++)
                                            const Image(image: AssetImage("assets/accessibility-unhighlighted.png")),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Cost "),
                                          for (int i = 0; i < activity.cost; i++) const Image(image: AssetImage("assets/cost-highlighted.png")),
                                          for (int i = 0; i < ACCESSIBILITY_MAX - activity.cost; i++)
                                            const Image(image: AssetImage("assets/cost-unhighlighted.png")),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Text("Type"),
                                          Image(image: AssetImage("assets/cost-unhighlighted.png")),//TODO not accessing cooking png
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
                        todoListService.add(Todo(activity.type.name, "assets/${activity.type.name}.png", false));
                        const snackBar = SnackBar(
                          content: Text('Your activity is added in todo-list', style: TextStyle(color: Colors.black)),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                          backgroundColor: Color(COLORS.secondary),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(width: 3, color: Color(COLORS.primary))),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Icon(Icons.add, color: Color(COLORS.primary)),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  displayAccessibility(int accessibilty) {}
}
