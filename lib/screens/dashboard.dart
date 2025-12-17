import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:task_app/utils/theme/text_theme/app_style.dart';
import 'package:task_app/widgets/reusable_appbar.dart';

import 'column_header.dart';
import 'data_view.dart';
import 'empty_screen.dart';

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
      body: _buildSummaryTab(),

      // Column(
      //   children: [
      //
      //     Expanded(
      //       child: TabBarView(
      //         controller: _tabController,
      //         children: [
      //        ,
      //           const Center(child: Text('SLD Content')),
      //           const Center(child: Text('Data Content')),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildSummaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                ThreeColumnHeader(),
                SizedBox(
                  child: Container(
                    height: 1,
                    color: Colors.grey.withAlpha(100),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Electricity',
                        style: AppStyle.textStyle20.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        child: Container(
                          height: 1,
                          color: Colors.grey.withAlpha(100),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Circular Progress
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: CustomPaint(
                          painter: CircularProgressPainter(progress: 1),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Power',
                                  style: AppStyle.textStyle14.copyWith(
                                    color: Color(0xFF64748B),
                                  ),
                                ),

                                Text(
                                  '5.53 kw',
                                  style: AppStyle.textStyle16.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Source/Load Toggle
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8EFF5),
                          borderRadius: BorderRadius.circular(25),
                        ),

                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => _isSourceSelected = true),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _isSourceSelected
                                        ? const Color(0xFF0EA5E9)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Text(
                                    'Source',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: _isSourceSelected
                                          ? Colors.white
                                          : const Color(0xFF64748B),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => _isSourceSelected = false),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: !_isSourceSelected
                                        ? const Color(0xFF0EA5E9)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Text(
                                    'Load',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: !_isSourceSelected
                                          ? Colors.white
                                          : const Color(0xFF64748B),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(child: Container(height: 2, color: Colors.grey)),
                      const SizedBox(height: 8),
                      // Data Cards
                      SizedBox(
                        height: 220,
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          children: [
                            _buildDataCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DataViewScreen(),
                                  ),
                                );
                              },
                              icon: "solar-cell",
                              title: 'Data View',
                              status: 'Active',
                              statusColor: const Color(0xFF0EA5E9),
                              data1: '55505.63',
                              data2: '58805.63',
                              backgroundColor: const Color(0xFFE5F4FE),
                              indicatorColor: const Color(0xFF0EA5E9),
                            ),

                            _buildDataCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmptyScreen(),
                                  ),
                                );
                              },
                              icon: 'power',
                              title: 'Data Type 2',
                              status: 'Active',
                              statusColor: const Color(0xFF0EA5E9),
                              data1: '55505.63',
                              data2: '58805.63',
                              backgroundColor: const Color(0xFFE5F4FE),
                              indicatorColor: const Color(0xFFF97316),
                            ),

                            _buildDataCard(
                              onTap: () {},
                              icon: 'power2',
                              title: 'Data Type 3',
                              status: 'Inactive',
                              statusColor: const Color(0xFFEF4444),
                              data1: '55505.63',
                              data2: '58805.63',
                              backgroundColor: const Color(0xFFE5F4FE),
                              indicatorColor: const Color(0xFF0EA5E9),
                            ),
                            _buildTotalSolar(
                              onTap: () {},
                              icon: "solar-cell",
                              title: 'Total Solar',
                              status: 'Active',
                              statusColor: const Color(0xFF0EA5E9),
                              data1: '55505.63',
                              data2: '58805.63',
                              backgroundColor: const Color(0xFFF0F1FF),
                              indicatorColor: const Color(0xFF0EA5E9),
                            ),
                          ],
                        ),
                      ),
                      // Bottom Grid
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 3.2,
              children: [
                _buildBottomCard('chart', 'Analysis Pro'),
                _buildBottomCard('g_generator', 'G. Generator'),
                _buildBottomCard('charge', 'Plant Summery'),
                _buildBottomCard('fire', 'Natural Gas'),
                _buildBottomCard('d_generator', 'D. Generator'),
                _buildBottomCard('faucet', 'Water Process'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataCard({
    required Function() onTap,
    required String icon,
    required String title,
    required String status,
    required Color statusColor,
    required String data1,
    required String data2,
    required Color backgroundColor,
    required Color indicatorColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            // Icon
            Image.asset("assets/images/$icon.png", height: 40, width: 40),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: indicatorColor,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '($status)',
                        style: TextStyle(
                          fontSize: 12,
                          color: statusColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'Data 1    : ',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      Text(
                        data1,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff04063E),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Data 2    : ',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      Text(
                        data2,
                        style:  TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff04063E),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

            // Arrow
            const Icon(Icons.chevron_right, color: Color(0xFF94A3B8), size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalSolar({
    required Function() onTap,
    required String icon,
    required String title,
    required String status,
    required Color statusColor,
    required String data1,
    required String data2,
    required Color backgroundColor,
    required Color indicatorColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            // Icon
            Image.asset("assets/images/$icon.png", height: 40, width: 40),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: indicatorColor,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '($status)',
                        style: TextStyle(
                          fontSize: 12,
                          color: statusColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'Live Power      : ',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      Text(
                        '$data1 kW',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff04063E),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        'Today Energy  : ',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      Text(
                        '$data2 kWh',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff04063E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Arrow
            const Icon(Icons.chevron_right, color: Color(0xFF94A3B8), size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomCard(String icon, String title) {
    return InkWell(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>EmptyScreen())),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: [
            Image.asset("assets/images/$icon.png", height: 30, width: 30),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: AppStyle.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF475569),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Painter for Circular Progress
class CircularProgressPainter extends CustomPainter {
  final double progress;

  CircularProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background circle
    final bgPaint = Paint()
      ..color = const Color(0xFFE8EFF5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    canvas.drawCircle(center, radius - 10, bgPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = const Color(0xFF398FC9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius - 10);
    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
