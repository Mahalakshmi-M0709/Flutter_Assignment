import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff152a56),
        centerTitle: true,
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AutomationTasksPage(),
            ),
          );
        },
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Color(0xff0eb9b8),
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Color(0xff152a56),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class AutomationTasksPage extends StatefulWidget {
  const AutomationTasksPage({super.key});

  @override
  State<AutomationTasksPage> createState() => _AutomationTasksPageState();
}

class _AutomationTasksPageState extends State<AutomationTasksPage> {
  bool _isSwitched1 = false;
  bool _isSwitched2 = false;
  bool _isSwitched3 = false;
  bool _isSwitched4 = false;
  bool _isSwitched5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff152a56),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: _isSwitched1,
            onChanged: (bool value) {
              setState(() {
                _isSwitched1 = value;
              });
            },
            title: const Text('Turn off the bedroom lamp'),
            subtitle: const Text('Turn off in 2 hours 27 minutes'),
            secondary: const Icon(Icons.lightbulb_outline),
          ),
          SwitchListTile(
            value: _isSwitched2,
            onChanged: (bool value) {
              setState(() {
                _isSwitched2 = value;
              });
            },
            title: const Text('Turn off Air Conditioner'),
            subtitle: const Text('Turn off in 3 hours 30 minutes'),
            secondary: const Icon(Icons.ac_unit),
          ),
          SwitchListTile(
            value: _isSwitched3,
            onChanged: (bool value) {
              setState(() {
                _isSwitched3 = value;
              });
            },
            title: const Text('Open News Channel on TV'),
            subtitle: const Text('Daily • Automatically'),
            secondary: const Icon(Icons.tv),
          ),
          SwitchListTile(
            value: _isSwitched4,
            onChanged: (bool value) {
              setState(() {
                _isSwitched4 = value;
              });
            },
            title: const Text('Turn off Router for 1 hour'),
            subtitle: const Text('Turn off in 15 hours 12 minutes'),
            secondary: const Icon(Icons.router),
          ),
          SwitchListTile(
            value: _isSwitched5,
            onChanged: (bool value) {
              setState(() {
                _isSwitched5 = value;
              });
            },
            title: const Text('Drain the tub water'),
            subtitle: const Text('Weekly • Automatically'),
            secondary: const Icon(Icons.water),
          ),
        ],
      ),
    );
  }
}
