import 'package:flutter/material.dart';
import '../widgets/app_dropdown_menu.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: const [AppDropdownMenu()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: SwitchListTile(
                title: const Text('Enable Notifications'),
                subtitle: const Text('Receive updates on new rewards and events'),
                value: notifications,
                onChanged: (v) => setState(() => notifications = v),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.palette_outlined),
                title: const Text('Theme'),
                subtitle: const Text('Light (default)'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('About'),
                subtitle: const Text('Version 1.0.0 • Recyclable'),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
