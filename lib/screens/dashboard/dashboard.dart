import 'package:flutter/material.dart';
import 'package:task_app/screens/dashboard/widgets/bottom_card_grid.dart';
import 'package:task_app/screens/dashboard/widgets/electric_card.dart';
import 'package:task_app/core/widgets/reusable_appbar.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isSourceSelected = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD9E4F1),
      appBar: ReusableAppBar(),
      body: DashboardBody(
        isSourceSelected: _isSourceSelected,
        onSourceToggle: (value) {
          setState(() {
            _isSourceSelected = value;
          });
        },
      ),
    );
  }
}

class DashboardBody extends StatelessWidget {
  final bool isSourceSelected;
  final Function(bool) onSourceToggle;

  const DashboardBody({
    required this.isSourceSelected,
    required this.onSourceToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ElectricityCard(
            isSourceSelected: isSourceSelected,
            onSourceToggle: onSourceToggle,
          ),
          BottomCardsGrid(),
        ],
      ),
    );
  }
}

