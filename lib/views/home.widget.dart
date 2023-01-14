import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_bored/constants.dart';
import 'package:me_bored/cubits/category_cubit.dart';
import 'package:me_bored/services/boring-api.service.dart';
import 'package:me_bored/services/todolist.service.dart';

import '../models/activity.model.dart';
import '../models/todo.model.dart';
import '../services/service.locator.dart';
import 'custom-app-bar.widget.dart';
import 'swipable-category.widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {
  //Activity activity = Activity("Make bread from scratch", TypeActivity.cooking, Participants.group, 1, 2);
  late Activity activity;
  TodoListService todoListService = getIt<TodoListService>();

  @override
  void initState() {
    super.initState();
    _fetchActivity();
  }

  Future<void> _fetchActivity() async {
    Activity _activity = await BoringApi().getRandomActivity();
    setState(() {
      activity = _activity;
    });
  }

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
            // Swipeable categories
            Expanded(
              flex: 1,
              child: BlocListener<CategoryCubit, String>(
                  listener: (context, state) {
                    BoringApi().getRandomActivity(category: state).then(
                        (value) => setState(() => { activity = value }));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SwipableCategory(category: "cooking"),
                      SizedBox(
                        width: 8,
                      ),
                      SwipableCategory(category: "music"),
                      SizedBox(
                        width: 8,
                      ),
                      SwipableCategory(category: "recreational"),
                      SizedBox(
                        width: 8,
                      ),
                      SwipableCategory(category: "social"),
                    ],
                  )),
            ),
            // Swipeable activity card
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Text("Swipe for more Activities"),
                    ),
                    Flexible(
                      child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(
                                  width: 3, color: Color(COLORS.primary))),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                      "assets/illustrations/ill-${activity.type.name}.png"),
                                ),
                                Text(activity.title ?? "no title"),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text("Participants"),
                                              Image(
                                                  image: AssetImage(activity
                                                              .participants ==
                                                          Participants.group
                                                      ? "assets/participants-group.png"
                                                      : "assets/participants-one.png"))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("Accessibility"),
                                              for (int i = 0;
                                                  i <
                                                      Activity
                                                          .proportionalizeForDisplay(
                                                              activity
                                                                  .accessibility);
                                                  i++)
                                                const Image(
                                                    image: AssetImage(
                                                        "assets/accessibility-highlighted.png")),
                                              for (int i = 0;
                                                  i <
                                                      ACCESSIBILITY_MAX -
                                                          Activity.proportionalizeForDisplay(
                                                              activity
                                                                  .accessibility);
                                                  i++)
                                                const Image(
                                                    image: AssetImage(
                                                        "assets/accessibility-unhighlighted.png")),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text("Cost "),
                                              for (int i = 0;
                                                  i <
                                                      Activity
                                                          .proportionalizeForDisplay(
                                                              activity.cost);
                                                  i++)
                                                const Image(
                                                    image: AssetImage(
                                                        "assets/cost-highlighted.png")),
                                              for (int i = 0;
                                                  i <
                                                      COST_MAX -
                                                          Activity
                                                              .proportionalizeForDisplay(
                                                                  activity
                                                                      .cost);
                                                  i++)
                                                const Image(
                                                    image: AssetImage(
                                                        "assets/cost-unhighlighted.png")),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("Type"),
                                              Image(
                                                  image: AssetImage(
                                                      "assets/icon-${activity.type.name}.png")),
                                              //TODO not accessing cooking png properly
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                )),

            // Todolist adding activity button
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      backgroundColor: const Color(COLORS.secondary),
                      onPressed: () {
                        todoListService.add(Todo(activity.type.name,
                            "assets/${activity.type.name}.png", false));
                        const snackBar = SnackBar(
                          content: Text('Your activity is added in todo-list',
                              style: TextStyle(color: Colors.black)),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(
                              vertical: 50, horizontal: 20),
                          backgroundColor: Color(COLORS.secondary),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
