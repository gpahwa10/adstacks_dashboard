import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformanceGraph extends StatelessWidget {
  const PerformanceGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.3; // 90% of screen width
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: 420, // This sets the width to 420px
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Over All Performance\nThe Years",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D2F48),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.circle, size: 10, color: Color(0xFFFD6F96)),
                        SizedBox(width: 4),
                        Text(
                          "Pending Done",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: const [
                        Icon(Icons.circle, size: 10, color: Color(0xFF7452FF)),
                        SizedBox(width: 4),
                        Text(
                          "Project Done",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  width: 420,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false), // Hides the grid
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 10,
                            reservedSize: 28,
                            getTitlesWidget: (value, _) => Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: (value, _) {
                              const years = [
                                '2015',
                                '2016',
                                '2017',
                                '2018',
                                '2019',
                                '2020'
                              ];
                              return Text(
                                years[value.toInt() % years.length],
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: const Color(0xFFE8E8E8)),
                      ),
                      minX: 0,
                      maxX: 5,
                      minY: 0,
                      maxY: 50,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 30),
                            FlSpot(1, 40),
                            FlSpot(2, 20),
                            FlSpot(3, 50),
                            FlSpot(4, 30),
                            FlSpot(5, 40),
                          ],
                          isCurved: true,
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFD6F96), Color(0xFFFD6F96)],
                          ),
                          barWidth: 4,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFFD6F96).withOpacity(0.2),
                                const Color(0xFFFD6F96).withOpacity(0),
                              ],
                            ),
                          ),
                        ),
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 20),
                            FlSpot(1, 30),
                            FlSpot(2, 40),
                            FlSpot(3, 30),
                            FlSpot(4, 50),
                            FlSpot(5, 40),
                          ],
                          isCurved: true,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7452FF), Color(0xFF7452FF)],
                          ),
                          barWidth: 4,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF7452FF).withOpacity(0.2),
                                const Color(0xFF7452FF).withOpacity(0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
