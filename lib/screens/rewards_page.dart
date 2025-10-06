import 'package:flutter/material.dart';
import '../widgets/app_dropdown_menu.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
        actions: const [AppDropdownMenu()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Points Balance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    Text('120 pts', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Redeem vouchers or donate points to a community cause.', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.local_offer_outlined),
                title: const Text('10% Off Refill Voucher'),
                subtitle: const Text('Cost: 100 pts'),
                trailing: ElevatedButton(onPressed: () {}, child: const Text('Redeem')),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.coffee_outlined),
                title: const Text('Free Coffee'),
                subtitle: const Text('Cost: 50 pts'),
                trailing: ElevatedButton(onPressed: () {}, child: const Text('Redeem')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
