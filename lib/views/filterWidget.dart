import 'package:flutter/material.dart';
import 'package:me_bored/models/activity.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../models/filter.dart';
import 'CustomAppBarWidget.dart';
import '../constants.dart';

class FilterWidget extends StatefulWidget {
  FilterWidget({super.key});

  final List<FilterItem> typesList = <FilterItem>[
    FilterItem(TypeActivity.cooking, "assets/cooking.png"),
    FilterItem(TypeActivity.education, "assets/cost-highlighted.png"),
    FilterItem(TypeActivity.recreational, "assets/cost-highlighted.png"),
    FilterItem(TypeActivity.relaxation, "assets/cost-highlighted.png"),
    FilterItem(TypeActivity.music, "assets/cost-highlighted.png"),
    FilterItem(TypeActivity.charity, "assets/cost-highlighted.png"),
  ];

  @override
  State<StatefulWidget> createState() {
    return _FilterWidgetState();
  }
}

class _FilterWidgetState extends State<FilterWidget> {
  double _currentPriceSliderValue = 20;
  double _currentAccessibilitySliderValue = 20;
  late FilterItem selectedTypeValue;

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
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Price range"),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _currentPriceSliderValue,
                        max: 100,
                        divisions: 100,
                        activeColor: const Color(COLORS.primary),
                        inactiveColor: const Color(COLORS.secondary),
                        label: _currentPriceSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentPriceSliderValue = value;
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
                const Text("Accessibility"),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: _currentAccessibilitySliderValue,
                        max: 100,
                        divisions: 100,
                        activeColor: const Color(COLORS.primary),
                        inactiveColor: const Color(COLORS.secondary),
                        label: _currentAccessibilitySliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentAccessibilitySliderValue = value;
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
                    child: DropdownButton<FilterItem>(
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
                        });
                      },
                      items: widget.typesList.map<DropdownMenuItem<FilterItem>>((FilterItem value) {
                        return DropdownMenuItem<FilterItem>(
                          value: value,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(value.type.name),
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
                      // Add your onPressed code here!
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
