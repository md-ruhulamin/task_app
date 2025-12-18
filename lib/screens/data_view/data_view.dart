import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:task_app/screens/data_view/widgets/data_info_section.dart';
import 'package:task_app/screens/data_view/widgets/%20energy_gauge.dart';
import 'package:task_app/screens/data_view/widgets/date_selector.dart';
import 'package:task_app/screens/data_view/widgets/energy_summary.dart';
import 'package:task_app/screens/data_view/widgets/revenue_view.dart';
import 'package:task_app/screens/data_view/widgets/view_toggle.dart';
import 'package:task_app/screens/data_view/widgets/date_range_picker.dart';
import 'package:task_app/core/utils/app_style.dart';
import 'package:task_app/core/widgets/reusable_appbar.dart';

import 'widgets/circular_progress_indicator.dart';
// lib/screens/data_view_screen.dart
import 'package:flutter/material.dart';
import 'package:task_app/core/widgets/reusable_appbar.dart';


class DataViewScreen extends StatefulWidget {
  const DataViewScreen({super.key});

  @override
  State<DataViewScreen> createState() => _DataViewScreenState();
}

class _DataViewScreenState extends State<DataViewScreen> {
  String selectedView = "Data View";
  String selectedDateOption = "Today Data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD9E4F1),
      appBar: ReusableAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                  margin: const EdgeInsets.only(top: 25),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: _buildContent(),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: 0,
                  child: ViewToggle(
                    selectedView: selectedView,
                    onViewChanged: (view) {
                      setState(() {
                        selectedView = view;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (selectedView == "Data View" &&
        selectedDateOption == "Today Data") {
      return Column(
        children: [
          const EnergyGauge(value: "55.00", unit: 'kWh/Sqft'),
          DateSelector(
            selectedOption: selectedDateOption,
            onOptionChanged: (option) {
              setState(() {
                selectedDateOption = option;
              });
            },
          ),
          const SizedBox(height: 5),
          const EnergySummary(power: "5.53 kw"),
          const SizedBox(height: 70),
        ],
      );
    } else if (selectedView == "Data View" &&
        selectedDateOption == "Custom Date Data") {
      return Column(
        children: [
          const EnergyGauge(value: "57.00", unit: 'kWh/Sqft'),
          DateSelector(
            selectedOption: selectedDateOption,
            onOptionChanged: (option) {
              setState(() {
                selectedDateOption = option;
              });
            },
          ),
          const DateRangePicker(),
          const EnergySummary(power: "20.05 kw"),
          const EnergySummary(power: "5.53 kw"),
        ],
      );
    } else if (selectedView == "Revenue View") {
      return Column(
        children: [
          const EnergyGauge(value: "8897455", unit: 'tk'),
          const RevenueView(),
          
        ],
      );
    }
    return const SizedBox.shrink();
  }
}