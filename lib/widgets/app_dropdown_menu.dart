import 'package:flutter/material.dart';

class AppDropdownMenu extends StatelessWidget {
  const AppDropdownMenu({super.key});

  void _navigate(BuildContext context, String route) {
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black87);
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'Home':
            _navigate(context, '/home');
            break;
          case 'Profile':
            _navigate(context, '/profile');
            break;
          case 'Rewards':
            _navigate(context, '/rewards');
            break;
          case 'Settings':
            _navigate(context, '/settings');
            break;
        }
      },
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'Home',
          child: ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text('Home', style: labelStyle),
          ),
        ),
        PopupMenuItem(
          value: 'Profile',
          child: ListTile(
            leading: const Icon(Icons.person_outline),
            title: Text('Profile', style: labelStyle),
          ),
        ),
        PopupMenuItem(
          value: 'Rewards',
          child: ListTile(
            leading: const Icon(Icons.card_giftcard_outlined),
            title: Text('Rewards', style: labelStyle),
          ),
        ),
        PopupMenuItem(
          value: 'Settings',
          child: ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text('Settings', style: labelStyle),
          ),
        ),
      ],
    );
  }
}
