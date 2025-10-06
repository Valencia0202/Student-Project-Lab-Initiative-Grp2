import 'package:flutter/material.dart';
import '../widgets/app_dropdown_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: const [AppDropdownMenu()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(Icons.person, size: 36, color: Colors.black54),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Student Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(height: 6),
                          Text('recycler@example.com', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit_outlined),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.star_border),
                title: const Text('Achievements'),
                subtitle: const Text('View earned badges and certificates'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Collection History'),
                subtitle: const Text('Past drop-offs and points earned'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
