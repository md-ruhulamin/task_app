import 'package:flutter/material.dart';
import 'package:task_app/core/utils/app_style.dart';

class EnergySummary extends StatelessWidget {
  final String power;

  const EnergySummary({required this.power});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(width: 10),
          Container(width: 1, height: 40, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Data :",
                      style: AppStyle.textStyle14.copyWith(
                        color: const Color.fromARGB(255, 99, 98, 98),
                      ),
                    ),
                    Text(
                      " $data",
                      style: AppStyle.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Cost :",
                      style: AppStyle.textStyle14.copyWith(
                        color: const Color.fromARGB(255, 99, 98, 98),
                      ),
                    ),
                    Text(
                      " $cost",
                      style: AppStyle.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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