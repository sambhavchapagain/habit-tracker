
import 'package:flutter/material.dart';
import 'package:habit_tracker/profile/setting.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Back', style: TextStyle(color: Colors.black)),
      ),

      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            
            const CircleAvatar(
              radius: 55,
              backgroundImage:AssetImage(
              "assets/shambhav.jpg",
              ),
            ),

            const SizedBox(height: 12),

            
            const Text(
              'Alex Marshall',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 4),

            // 🔹 Username
            const Text('@alex_marshall',
                style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 18),

            // 🔹 Edit Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C3E7A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Edit', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Menu Items
            _menuItem(Icons.settings, 'Setting', context),
            _menuItem(Icons.person_outline, 'Friend', context),
            _menuItem(Icons.group_add_outlined, 'New Group', context),
            _menuItem(Icons.support_agent_outlined, 'Support', context),
            _menuItem(Icons.share_outlined, 'Share', context),
            _menuItem(Icons.info_outline, 'About us', context),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable Menu Item
  Widget _menuItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () {
        if (title == 'Setting') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ),
          );
        }
      },
    );
  }
}
