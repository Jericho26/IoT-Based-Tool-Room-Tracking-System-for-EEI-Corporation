import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/app_drawer.dart';
import 'package:flutter_project/widgets/inventory.dart';
import 'package:flutter_project/widgets/history.dart';
import 'package:flutter_project/widgets/settings.dart';
import 'package:flutter_project/widgets/statistics_page.dart';

void main() {
  runApp(const ITrackApp());
}

class ITrackApp extends StatelessWidget {
  const ITrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iTrack',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const DashboardPage(),
      routes: {
        '/inventory': (context) => const InventoryPage(),
        '/history': (context) => const HistoryPage(),
        '/settings': (context) => const SettingsPage(),
        '/statistics': (context) => const StatisticsPage(),
      },
    );
  }
}


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String selectedRange = 'Today';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(selectedItem: 'Dashboard'),
      appBar: AppBar(
        title: const Text(
          'Inventory Summary',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SummaryCard(title: 'TOOLS AVAILABLE', value: '90'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SummaryCard(title: 'TOOLS BORROWED', value: '10'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Most used Tools',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                PopupMenuButton<String>(
                  tooltip: 'Choose Date',
                  onSelected: (value) {
                    setState(() {
                      selectedRange = value;
                    });
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'Today', child: Text('Today')),
                    const PopupMenuItem(value: 'Last Week', child: Text('Last Week')),
                    const PopupMenuItem(value: 'Last Month', child: Text('Last Month')),
                  ],
                  child: Row(
                    children: [
                      Text(
                        selectedRange,
                        style: const TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: ToolCard(
                    icon: Icons.agriculture,
                    toolName: 'Hoe',
                    category: 'Mixing tools',
                    count: 2,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ToolCard(
                    icon: Icons.build,
                    toolName: 'Handsaw',
                    category: 'Cutting tools',
                    count: 4,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ToolCard(
                    icon: Icons.straighten,
                    toolName: 'Measuring Tape',
                    category: 'Measuring tools',
                    count: 4,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('All Tools Used'),
                        content: const Text(
                          'You successfully clicked the select all button',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('See All'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  const SummaryCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            const SizedBox(height: 8),
            Text(value,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

class ToolCard extends StatelessWidget {
  final IconData icon;
  final String toolName;
  final String category;
  final int count;

  const ToolCard({
    super.key,
    required this.icon,
    required this.toolName,
    required this.category,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[400],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          children: [
            Icon(icon, size: 36),
            const SizedBox(height: 8),
            Text(toolName, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(category, style: const TextStyle(fontSize: 12, color: Colors.white70)),
            const SizedBox(height: 8),
            Text('${count}x', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
