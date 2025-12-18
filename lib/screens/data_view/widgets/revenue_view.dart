import 'package:flutter/material.dart';
import 'package:task_app/screens/data_view/widgets/data_info_section.dart';

class RevenueView extends StatelessWidget {
  const RevenueView();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.white,
      child:  Column(
        children: [
          DataCostInfoSection(),
        ],
      ),
    );
  }
}