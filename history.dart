import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  final List<Map<String, dynamic>> mockHistory = const [
    {
      'date': 'July 27, 2025',
      'items': [
        {
          'name': 'Hammer',
          'status': 'Borrowed',
          'person': 'John Doe',
          'time': '10:45 AM',
        },
        {
          'name': 'Screwdriver',
          'status': 'Returned',
          'person': 'Jane Smith',
          'time': '11:10 AM',
        },
      ],
    },
    {
      'date': 'July 26, 2025',
      'items': [
        {
          'name': 'Wrench',
          'status': 'Borrowed',
          'person': 'Mark Lee',
          'time': '3:30 PM',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent, // <-- sets the background color
        foregroundColor: Colors.black, // <-- sets the text/icon color
        title: const Text('History',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockHistory.length,
        itemBuilder: (context, index) {
          final day = mockHistory[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day['date'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              ...day['items'].map<Widget>((item) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Icon(
                      item['status'] == 'Borrowed'
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: item['status'] == 'Borrowed'
                          ? Colors.red
                          : Colors.green,
                    ),
                    title: Text(item['name']),
                    subtitle: Text('${item['person']} • ${item['time']}'),
                    trailing: Text(
                      item['status'],
                      style: TextStyle(
                        color: item['status'] == 'Borrowed'
                            ? Colors.red
                            : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
