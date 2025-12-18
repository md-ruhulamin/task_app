
import 'package:flutter/material.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({super.key});

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
