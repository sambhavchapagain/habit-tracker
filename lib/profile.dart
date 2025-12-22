import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Back', style: TextStyle(color: Colors.black)),
      ),

      // 🔹 Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 🔹 Profile Image
            const CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Name
            const Text(
              'Alex Marshall',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 4),

            // 🔹 Username
            const Text('@alex_marshall', style: TextStyle(color: Colors.grey)),

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
            _menuItem(Icons.settings, 'Setting'),
            _menuItem(Icons.person_outline, 'Friend'),
            _menuItem(Icons.group_add_outlined, 'New Group'),
            _menuItem(Icons.support_agent_outlined, 'Support'),
            _menuItem(Icons.share_outlined, 'Share'),
            _menuItem(Icons.info_outline, 'About us'),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable Menu Item
  Widget _menuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
}
