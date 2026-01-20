import 'package:flutter/material.dart';
import 'package:habit_tracker/add.dart' show CreateNewHabitScreen;

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Calendar View Coming Soon',
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
            Text(
              'Track your habits over weeks and months',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class HabitDetailScreen extends StatelessWidget {
  final Habit habit;

  const HabitDetailScreen({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(habit.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${habit.title}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Frequency: ${habit.frequency}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              'Status: ${habit.isCompleted ? "Completed ✅" : "Not completed ❌"}',
              style: TextStyle(
                fontSize: 20,
                color: habit.isCompleted ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== Main App with Bottom Navigation ====================

// ==================== Dashboard Screen (updated) ====================

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<Habit> habits;

  @override
  void initState() {
    super.initState();
    habits = [
      Habit(
        title: 'Drink 8 glasses of water',
        frequency: 'Daily',
        isCompleted: false,
      ),
      Habit(title: 'Read 30 minutes', frequency: 'Daily', isCompleted: true),
      Habit(
        title: 'Meditate for 10 minutes',
        frequency: 'Weekdays',
        isCompleted: false,
      ),
      Habit(
        title: 'Exercise for 45 minutes',
        frequency: 'Mon, Wed, Fri',
        isCompleted: false,
      ),
      Habit(title: 'Journal thoughts', frequency: 'Daily', isCompleted: false),
      Habit(
        title: 'Learn a new skill',
        frequency: 'Tues, Thurs',
        isCompleted: false,
      ),
    ];
  }

  void _toggleHabitAndNavigate(Habit habit) {
    setState(() {
      habit.isCompleted = !habit.isCompleted;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HabitDetailScreen(habit: habit)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Text('Today', style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.local_activity),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return HabitItem(
            habit: habits[index],
            onToggle: _toggleHabitAndNavigate,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateNewHabitScreen()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ==================== HabitItem & Habit ====================

class HabitItem extends StatelessWidget {
  final Habit habit;
  final Function(Habit) onToggle;

  const HabitItem({super.key, required this.habit, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          habit.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          habit.frequency,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        trailing: Switch(
          value: habit.isCompleted,
          onChanged: (_) => onToggle(habit),
          activeThumbColor: const Color.fromARGB(255, 125, 194, 250),
        ),
      ),
    );
  }
}

class Habit {
  final String title;
  final String frequency;
  bool isCompleted;

  Habit({
    required this.title,
    required this.frequency,
    required this.isCompleted,
  });
}

// ==================== Entry Point ====================
