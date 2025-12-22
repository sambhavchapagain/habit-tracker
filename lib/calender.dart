import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const CalendarStatsScreen(),
    );
  }
}

class CalendarStatsScreen extends StatefulWidget {
  const CalendarStatsScreen({super.key});

  @override
  State<CalendarStatsScreen> createState() => _CalendarStatsScreenState();
}

class _CalendarStatsScreenState extends State<CalendarStatsScreen> {
  DateTime _selectedDate = DateTime.now();

  DateTime _focusedMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.track_changes,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        title: const Text(
          'Calendar & Stats',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendarCard(),
            const SizedBox(height: 30),
            const Text(
              'Weekly Progress',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.emoji_events_outlined,
                    label: 'Current Streak',
                    value: '7 days',
                    subtext: 'Longest streak: 14 days',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.show_chart,
                    label: 'Completion Rate',
                    value: '85%',
                    subtext: 'Compared to last week',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DateTime?> _getDaysInMonth(DateTime month) {
    List<DateTime?> days = [];
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    // Get the number of days in the current month (e.g., for Dec 2025, it's 31)
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

    int leadingBlanks = firstDayOfMonth.weekday % 7;

    for (int i = 0; i < leadingBlanks; i++) {
      days.add(null); // Represents empty cells
    }

    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(month.year, month.month, i));
    }
    return days;
  }

  Widget _buildCalendarCard() {
    final List<String> weekDays = [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
    ];

    // Dynamically generate the days for the _focusedMonth
    final List<DateTime?> currentMonthDays = _getDaysInMonth(_focusedMonth);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // Decrement month by 1
                        _focusedMonth = DateTime(
                          _focusedMonth.year,
                          _focusedMonth.month - 1,
                          1,
                        );
                      });
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat(
                          'MMMM',
                        ).format(_focusedMonth), // Display current month
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat(
                          'yyyy',
                        ).format(_focusedMonth), // Display current year
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // Increment month by 1
                        _focusedMonth = DateTime(
                          _focusedMonth.year,
                          _focusedMonth.month + 1,
                          1,
                        );
                      });
                    },
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {
                  // Reset to today's date and focus the calendar on today's month
                  setState(() {
                    _selectedDate = DateTime.now();
                    _focusedMonth = DateTime(
                      _selectedDate.year,
                      _selectedDate.month,
                      1,
                    );
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Today'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Weekday Headers
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: 7,
            itemBuilder: (context, index) => Center(
              child: Text(
                weekDays[index],
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          // Interactive Days Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount:
                currentMonthDays.length, // Use dynamically generated days
            itemBuilder: (context, index) {
              final DateTime? dayDate = currentMonthDays[index];
              // Check if this day matches the selected date (year, month, and day)
              final bool isSelected =
                  dayDate != null &&
                  dayDate.year == _selectedDate.year &&
                  dayDate.month == _selectedDate.month &&
                  dayDate.day == _selectedDate.day;

              return InkWell(
                onTap: dayDate == null
                    ? null // Disable tap for empty cells
                    : () {
                        // Update state on tap
                        setState(() {
                          _selectedDate =
                              dayDate; // Update selected date to the tapped date
                        });
                      },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      dayDate == null
                          ? ''
                          : dayDate.day
                                .toString(), // Display day number or empty string
                      style: TextStyle(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required String subtext,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: Colors.grey.shade600),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtext,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
