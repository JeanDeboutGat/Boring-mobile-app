import 'package:flutter/material.dart';
import 'package:me_bored/models/activity.model.dart';
import 'package:me_bored/services/filter.service.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../models/filter.model.dart';
import '../services/service.locator.dart';
import 'CustomAppBarWidget.dart';
import '../constants.dart';

class FilterWidget extends StatefulWidget {
  FilterWidget({super.key});

  FilterService filterService = getIt<FilterService>();

  final List<FilterType> typesList = <FilterType>[
    FilterType(TypeActivity.cooking, "assets/cooking.png"),
    FilterType(TypeActivity.education, "assets/cost-highlighted.png"),
    FilterType(TypeActivity.recreational, "assets/cost-highlighted.png"),
    FilterType(TypeActivity.relaxation, "assets/cost-highlighted.png"),
    FilterType(TypeActivity.music, "assets/cost-highlighted.png"),
    FilterType(TypeActivity.charity, "assets/cost-highlighted.png"),
  ];

  @override
  State<StatefulWidget> createState() {
    return _FilterWidgetState();
  }
}

class _FilterWidgetState extends State<FilterWidget> {
  double _currentMinPriceSliderValue = 20;
  double _currentMaxPriceSliderValue = 20;
  double _currentMinAccessibilitySliderValue = 20;
  double _currentMaxAccessibilitySliderValue = 20;
  late FilterType selectedTypeValue;

  @override
  void initState() {
    super.initState();
    selectedTypeValue = widget.typesList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(true, false, preferredSize: Size(56, 56)),
      backgroundColor: const Color(COLORS.accent),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 45),
              child: Text("Filter activities", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(COLORS.primary))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Participants"),
                ToggleSwitch(
                  customWidths: const [50.0, 50.0],
                  cornerRadius: 20.0,
                  activeBgColors: const [
                    [Color(COLORS.secondary)],
                    [Color(COLORS.secondary)]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  totalSwitches: 2,
                  icons: const [Icons.person, Icons.group],
                  onToggle: (index) {
                    widget.filterService.addParticipants(index == 0 ? Participants.one : Participants.group);
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Price minimum"),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _currentMinPriceSliderValue,
                        max: 100,
                        divisions: 100,
                        activeColor: const Color(COLORS.primary),
                        inactiveColor: const Color(COLORS.secondary),
                        label: _currentMinPriceSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentMinPriceSliderValue = value;
                            widget.filterService.addPriceMin(value);
                          });
                        },
                      ),
                    ),
                    const Image(image: AssetImage("assets/cost-highlighted.png")),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Price maximum"),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _currentMaxPriceSliderValue,
                        max: 100,
                        divisions: 100,
                        activeColor: const Color(COLORS.primary),
                        inactiveColor: const Color(COLORS.secondary),
                        label: _currentMaxPriceSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentMaxPriceSliderValue = value;
                            widget.filterService.addPriceMax(value);
                          });
                        },
                      ),
                    ),
                    const Image(image: AssetImage("assets/cost-highlighted.png")),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Accessibility minimum"),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _currentMinAccessibilitySliderValue,
                        max: 100,
                        divisions: 100,
                        activeColor: const Color(COLORS.primary),
                        inactiveColor: const Color(COLORS.secondary),
                        label: _currentMinAccessibilitySliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentMinAccessibilitySliderValue = value;
                            widget.filterService.addAccessibilityMin(value);
                          });
                        },
                      ),
                    ),
                    const Image(image: AssetImage("assets/accessibility-highlighted.png")),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Accessibility maximum"),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _currentMaxAccessibilitySliderValue,
                        max: 100,
                        divisions: 100,
                        activeColor: const Color(COLORS.primary),
                        inactiveColor: const Color(COLORS.secondary),
                        label: _currentMaxAccessibilitySliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentMaxAccessibilitySliderValue = value;
                            widget.filterService.addAccessibilityMax(value);
                          });
                        },
                      ),
                    ),
                    const Image(image: AssetImage("assets/accessibility-highlighted.png")),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Chosen Type"),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: ButtonTheme(
                    alignedDropdown: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusColor: const Color(COLORS.secondary),
                    child: DropdownButton<FilterType>(
                      isExpanded: true,
                      value: selectedTypeValue,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      iconSize: 42,
                      elevation: 16,
                      underline: const SizedBox(),
                      onChanged: (dynamic? newValue) {
                        setState(() {
                          print("chosen type: $newValue");
                          selectedTypeValue = newValue!;
                          widget.filterService.addActivityType(selectedTypeValue.name);
                        });
                      },
                      items: widget.typesList.map<DropdownMenuItem<FilterType>>((FilterType value) {
                        return DropdownMenuItem<FilterType>(
                          value: value,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(value.name.name),
                              Image(image: AssetImage(value.image)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    label: const Text('Generate random activities'),
                    backgroundColor: const Color(COLORS.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
