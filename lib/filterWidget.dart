import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'CustomAppBar.dart';
import 'constants.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterWidgetState();
  }
}

class _FilterWidgetState extends State<FilterWidget> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(true, false, preferredSize: Size(56, 56)),
      backgroundColor: const Color(COLORS.accent),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 45),
              child: Text("Filter activities",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(COLORS.primary))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Participants"),
                ToggleSwitch(
                  customWidths: [50.0, 50.0],
                  cornerRadius: 20.0,
                  activeBgColors: const [
                    [Color(COLORS.secondary)],
                    [Color(COLORS.secondary)]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  totalSwitches: 2,
                  icons: [Icons.person, Icons.group],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price range"),
                Row(
                  children: [
                    Slider(
                      value: _currentSliderValue,
                      max: 100,
                      divisions: 5,
                      activeColor: Color(COLORS.secondary),
                      inactiveColor: Color(COLORS.primary),
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                    Image(
                        image: AssetImage(
                            "assets/accessibility-highlighted.png")),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Accessibility"),
                Row(
                  children: [
                    Slider(
                      value: _currentSliderValue,
                      max: 100,
                      divisions: 5,
                      activeColor: Color(COLORS.secondary),
                      inactiveColor: Color(COLORS.primary),
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                    Image(
                        image: AssetImage(
                            "assets/accessibility-highlighted.png")),
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
