import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String selectedItem;

  const AppDrawer({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E1E2D),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF1E1E2D)),
            child: Text(
              'MingMing',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          _buildDrawerItem(Icons.dashboard, 'Dashboard', context,
              selected: selectedItem == 'Dashboard'),
          _buildDrawerItem(Icons.inventory, 'Inventory', context,
              selected: selectedItem == 'Inventory'),
          _buildDrawerItem(Icons.history, 'History', context,
              selected: selectedItem == 'History'),
          _buildDrawerItem(Icons.settings, 'Settings', context,
              selected: selectedItem == 'Settings'),
          _buildDrawerItem(Icons.bar_chart, 'Statistics', context,
              selected: selectedItem == 'Statistics'),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title, BuildContext context,
      {bool selected = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      selected: selected,
      selectedTileColor: Colors.red,
      onTap: () {
        // Close the drawer first
        Navigator.pop(context);

        // Navigate only if not already selected
        if (!selected) {
          switch (title) {
            case 'Dashboard':
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 'Inventory':
              Navigator.pushReplacementNamed(context, '/inventory');
              break;
            case 'History':
              Navigator.pushReplacementNamed(context, '/history');
              break;
            case 'Settings':
              Navigator.pushReplacementNamed(context, '/settings');
              break;
            case 'Statistics':
              Navigator.pushReplacementNamed(context, '/statistics');
              break;
          }
        }
      },
    );
  }
}
