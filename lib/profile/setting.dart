import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Settings"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(
                      "assets/shambhav.jpg", 
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "shambhav chapagain",
                    style: TextStyle(
                      color: Color.fromARGB(255, 76, 56, 56),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            _settingTile(
              icon: Icons.edit,
              iconColor: Colors.blue,
              title: "Appearance",
              subtitle: "Make Ziar'App yours",
            ),
            _settingTile(
              icon: Icons.fingerprint,
              iconColor: Colors.red,
              title: "Privacy",
              subtitle: "Lock Ziar'App to improve your privacy",
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: _tileDecoration(),
              child: SwitchListTile(
                secondary: const Icon(Icons.dark_mode, color: Colors.orange),
                title: const Text("Dark mode"),
                subtitle: const Text("Automatic"),
                value: false,
                onChanged: (value) {},
              ),
            ),

            _settingTile(
              icon: Icons.info,
              iconColor: Colors.purple,
              title: "About",
              subtitle: "Learn more about Ziar'App",
            ),
            _settingTile(
              icon: Icons.feedback,
              iconColor: Colors.amber,
              title: "Send Feedback",
              subtitle: "Let us know how we can make Ziar'app",
            ),

            const SizedBox(height: 24),

            const Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            _simpleTile(Icons.logout, "Sign Out"),
            _simpleTile(Icons.swap_horiz, "Change email"),
          ],
        ),
      ),
    );
  }
  Widget _settingTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: _tileDecoration(),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
  Widget _simpleTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: _tileDecoration(),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }

  BoxDecoration _tileDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
