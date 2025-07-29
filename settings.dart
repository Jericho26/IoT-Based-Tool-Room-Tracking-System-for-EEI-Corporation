import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: ListView(
        children: const [
          _SettingsTile(
            icon: Icons.person,
            title: 'Account Settings',
          ),
          _SettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
          ),
          _SettingsTile(
            icon: Icons.support_agent,
            title: 'Support',
          ),
          _SettingsTile(
            icon: Icons.help_outline,
            title: 'FAQ',
          ),
          _SettingsTile(
            icon: Icons.info_outline,
            title: 'About',
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SettingsTile({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          leading: Icon(icon, color: Colors.black87),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // TODO: Add navigation to specific settings pages
          },
        ),
        const Divider(height: 1, indent: 20, endIndent: 20),
      ],
    );
  }
}
