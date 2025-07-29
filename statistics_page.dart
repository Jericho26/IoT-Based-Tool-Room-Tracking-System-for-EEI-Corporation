import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  // Simulated weekly data
  final List<Map<String, dynamic>> weeklyData = List.generate(
    7,
        (index) => {
      'day': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
      'percentage': Random().nextInt(100),
      'borrowed': Random().nextInt(50),
      'returned': Random().nextInt(50),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Weekly Usage (%)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 1.7,
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 28),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          return Text(
                            weeklyData[index]['day'],
                            style: const TextStyle(fontSize: 12),
                          );
                        },
                        interval: 1,
                      ),
                    ),
                  ),
                  barGroups: List.generate(weeklyData.length, (index) {
                    return BarChartGroupData(x: index, barRods: [
                      BarChartRodData(
                        toY: weeklyData[index]['percentage'].toDouble(),
                        color: Colors.deepPurple,
                        width: 18,
                        borderRadius: BorderRadius.circular(6),
                      )
                    ]);
                  }),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Details Table",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Day')),
                    DataColumn(label: Text('Borrowed')),
                    DataColumn(label: Text('Returned')),
                    DataColumn(label: Text('%')),
                  ],
                  rows: weeklyData.map((day) {
                    return DataRow(cells: [
                      DataCell(Text(day['day'])),
                      DataCell(Text('${day['borrowed']}')),
                      DataCell(Text('${day['returned']}')),
                      DataCell(Text('${day['percentage']}%')),
                    ]);
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
