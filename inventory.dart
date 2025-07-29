import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/app_drawer.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  String selectedTab = 'Available';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(selectedItem: 'Inventory'),
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        title: const Text('Inventory',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SummaryCard(title: 'Total Tools', count: 100, color: Colors.red),
                SummaryCard(title: 'Tools Borrowed', count: 30, color: Colors.black),
                SummaryCard(title: 'Available\nTools', count: 70, color: Colors.black),
              ],
            ),
            const SizedBox(height: 16),

            // Filter Buttons
            Row(
              children: [
                _buildFilterButton('Available'),
                _buildFilterButton('Borrowed'),
                _buildFilterButton('Returned'),
              ],
            ),
            const SizedBox(height: 16),

            // Table Content
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildTableContent(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    final isSelected = selectedTab == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedTab = label;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.red : Colors.grey[300],
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(label),
      ),
    );
  }


  Widget _buildTableContent() {

    switch (selectedTab) {
      case 'Available':
        return _availableTable();
      case 'Borrowed':
        return _borrowedTable();
      case 'Returned':
        return _returnedTable();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _availableTable() {
    final tools = [
      {'name': 'Hammer', 'qty': 15},
      {'name': 'Wrench', 'qty': 10},
      {'name': 'Drill', 'qty': 8},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8), // Uniform side margin
        child: DataTable(
          columnSpacing: 32,
          headingRowColor: WidgetStateProperty.all(Colors.grey[200]),
          columns: const [
            DataColumn(label: Text('Tool Name', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: tools.map((tool) {
            return DataRow(cells: [
              DataCell(Text(tool['name'].toString())),
              DataCell(Text(tool['qty'].toString())),
            ]);
          }).toList(),
        ),
      ),
    );
  }

  Widget _borrowedTable() {
    final borrowed = [
      {'name': 'Alice', 'tool': 'Hammer', 'tool_id': '001', 'date': '2025-07-25'},
      {'name': 'Bob', 'tool': 'Wrench', 'tool_id': '002', 'date': '2025-07-24'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columnSpacing: 32,
        headingRowColor: WidgetStateProperty.all(Colors.grey[200]),
        columns: const [
          DataColumn(label: Text('Borrower', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Tool Name', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Tool No.', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: borrowed.map((entry) {
          return DataRow(cells: [
            DataCell(Text(entry['name'].toString())),
            DataCell(Text(entry['tool'].toString())),
            DataCell(Text(entry['tool_id'].toString())),
            DataCell(Text(entry['date'].toString())),
          ]);
        }).toList(),
      ),
    );
  }

  Widget _returnedTable() {
    final returned = [
      {'name': 'Mark', 'tool': 'Hammer', 'tool_id': '003', 'date': '2025-07-27'},
      {'name': 'Kim', 'tool': 'Wrench', 'tool_id': '004', 'date': '2025-04-27'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columnSpacing: 32,
        headingRowColor: WidgetStateProperty.all(Colors.grey[200]),
        columns: const [
          DataColumn(label: Text('Borrower', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Tool Name', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Tool No.', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: returned.map((entry) {
          return DataRow(cells: [
            DataCell(Text(entry['name'].toString())),
            DataCell(Text(entry['tool'].toString())),
            DataCell(Text(entry['tool_id'].toString())),
            DataCell(Text(entry['date'].toString())),
          ]);
        }).toList(),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              '$count',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
