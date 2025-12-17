import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:task_app/screens/data_info_section.dart';
import 'package:task_app/utils/theme/text_theme/app_style.dart';
import 'package:task_app/widgets/reusable_appbar.dart';

import 'circular_progress_indicator.dart';

class DataViewScreen extends StatefulWidget {
  const DataViewScreen({super.key});

  @override
  State<DataViewScreen> createState() => _DataViewScreenState();
}

class _DataViewScreenState extends State<DataViewScreen> {
  String selectedView = "Data View";
  String selectedDateOption = "Today Data";
  DateTime? customSelectedDate;

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
            // Stack for overlap
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


                Positioned(left: 10, right: 10, top: 0, child: _viewToggle()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (selectedView == "Data View" && selectedDateOption == "Today Data") {
      return Column(
        children: [
          _energyGauge(55.00, 'kWh/Sqft'),
          _dateSelector(),
          const SizedBox(height: 5),
          _energySummaryCard("5.53 kw"),
          SizedBox(height: 40),


        ],
      );
    } else if (selectedView == "Data View" &&
        selectedDateOption == "Custom Date Data") {
      return Column(
        children: [
          _energyGauge(57.00, 'kWh/Sqft'),
          _dateSelector(),
          DateRangePicker(),
          _energySummaryCard("20.05 kw"),
          _energySummaryCard("5.53 kw"),



        ],
      );
    } else if (selectedView == "Revenue View") {
      return Column(
        children: [
          _energyGauge(8897455, 'tk'),



          Container(
            color: Colors.white,
            height: 380,
            child:  Column(
              children: [
                DataCostInfoSection(),
              ],
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget _viewToggle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          _toggleButton("Data View", selectedView == "Data View"),
          _toggleButton("Revenue View", selectedView == "Revenue View"),
        ],
      ),
    );
  }

  Widget _toggleButton(String text, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedView = text;
          });
        },
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.blue,
            ),
            const SizedBox(width: 6),
            Text(text),
          ],
        ),
      ),
    );
  }

  Widget _energyGauge(double value, String unit) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 220,
          height: 220,
          child: CustomPaint(
            painter: CircularProgressPainter(
              progress: 0.65,
              activeColor: const Color(0xFF4DA3FF),
              inactiveColor: const Color(0xFFD6E9FF),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$value",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A2332),
                      letterSpacing: 0,
                    ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A2332),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _dateSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dateOption("Today Data", selectedDateOption == "Today Data"),
        const SizedBox(width: 20),
        _dateOption(
          "Custom Date Data",
          selectedDateOption == "Custom Date Data",
        ),
      ],
    );
  }

  Widget _dateOption(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDateOption = text;
        });
      },
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }

  Widget _energySummaryCard(String power) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withAlpha(155), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Energy Chart",
                  style: AppStyle.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  power,
                  style: AppStyle.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _energyItem("Data A", "2798.50 (29.53%)", "35689 ৳", Colors.blue),
          _energyItem(
            "Data B",
            "72598.50 (35.39%)",
            "2559689 ৳",
            Colors.lightBlue,
          ),
          _energyItem("Data C", "6598.36 (83.90%)", "5698756 ৳", Colors.purple),
          _energyItem("Data D", "6598.26 (36.59%)", "356987 ৳", Colors.orange),
        ],
      ),
    );
  }

  Widget _energyItem(String title, String data, String cost, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.withAlpha(125)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(height: 4),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(width: 10),
          SizedBox(child: Container(width: 1, height: 40, color: Colors.grey)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Data :"),
                    Text(
                      " $data",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Cost :"),
                    Text(
                      " $cost",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DateRangePicker extends StatefulWidget {
  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate
          ? fromDate ?? DateTime.now()
          : toDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          _customTextField('From Date'),
          SizedBox(width: 5),
          _customTextField('To Date'),
          SizedBox(width: 5),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE2EBF1),
              border: Border.all(color: Color(0xff0096FC)),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search, color: Color(0xff0096FC)),
          ),
        ],
      ),
    );
  }

  Widget _customTextField(String title) {
    return Expanded(
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          enabled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xffA5A7B9)),
            borderRadius: BorderRadius.circular(6),
          ),
          labelText: title,
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today_outlined),
            onPressed: () => _selectDate(context, true),
          ),
        ),
      ),
    );
  }
}