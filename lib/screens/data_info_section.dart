import 'package:flutter/material.dart';
import 'package:task_app/utils/theme/text_theme/app_style.dart';
class DataCostInfoSection extends StatefulWidget {
  @override
  _DataCostInfoSectionState createState() => _DataCostInfoSectionState();
}

class _DataCostInfoSectionState extends State<DataCostInfoSection>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _iconRotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _iconRotation = Tween<double>(begin: -0.5, end: 0).animate(_controller);
  }

  void _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
      isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDataCostRow(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Data $index : "),
            Text(
              " 2798.50 (29.53%)",
              style: AppStyle.textStyle14.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text("Cost $index : "),
            Text(
              "35689 ৳",
              style: AppStyle.textStyle14.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          // Expandable content
          AnimatedCrossFade(
            duration: Duration(milliseconds: 300),
            crossFadeState:
            isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  _buildDataCostRow(1),
                  _buildDataCostRow(2),
                  _buildDataCostRow(3),
                  _buildDataCostRow(4),
                ],
              ),
            ),
            secondChild: SizedBox.shrink(),
          ),
          // Header with rotatable arrow
          Container(
            height: 55,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/bar-chart.png",
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 10),
                Text("Data & Cost Info"),
                SizedBox(width: 10),
                Spacer(),
                GestureDetector(
                  onTap: _toggleExpansion,
                  child: RotationTransition(
                    turns: _iconRotation,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                       "assets/images/up_down_arrow.png",
height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}