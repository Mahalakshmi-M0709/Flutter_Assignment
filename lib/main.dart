import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'daily_usage.dart';
import 'schedule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electricity Dashboard',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff0b1c3f), // deep navy
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1e88e5), // bright blue seed
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const SchedulePage(),
    // ✅ Home
    const Center(child: Text('Schedule Page')),
    const Center(child: Text('Balance Page')),
    const Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xff0eb9b8),
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Balance',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accentBlue = const Color(0xff1e88e5);
    final cardBlue = const Color(0xff152a56);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: cardBlue,
        elevation: 0,
        title: const Text(
          "VoltEdge", // <-- Add this line
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Good Morning",
              style: TextStyle(fontSize: 14, color: Colors.white60),
            ),
            const Text(
              "Mr. Stanley Hans",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Electricity Bill Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff1e88e5), Color(0xff1565c0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Electricity Bills This Month",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "\$ 440,00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DailyUsagePage(),
                        ),
                      );
                    },
                    child: const Text("Daily usage"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Two Graph Cards
            Row(
              children: [
                Expanded(
                  child: _graphCard(
                    title: "Electricity Usage Month",
                    value: "127kW",
                    lineColor: Colors.cyanAccent,
                    bgColor: cardBlue,
                    spots: const [
                      FlSpot(0, 1),
                      FlSpot(1, 4),
                      FlSpot(2, 1.4),
                      FlSpot(3, 4),
                      FlSpot(4, 5),
                      FlSpot(5, 6),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _graphCard(
                    title: "Electricity Cost",
                    value: "\$ 182,00",
                    lineColor: Colors.orangeAccent,
                    bgColor: cardBlue,
                    spots: const [
                      FlSpot(0, 2),
                      FlSpot(1, 0),
                      FlSpot(2, 2),
                      FlSpot(3, 5),
                      FlSpot(4, 2),
                      FlSpot(5, 3.5),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Consumed Electricity Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardBlue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Consumed Electricity",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _consumptionItem(
                    icon: Icons.bed,
                    iconColor: accentBlue,
                    roomName: "Bedroom",
                    timeRange: "7 AM - 9 PM",
                    cost: "\$ 50.00",
                    progress: 0.8,
                  ),
                  const SizedBox(height: 12),

                  _consumptionItem(
                    icon: Icons.tv,
                    iconColor: Colors.cyanAccent,
                    roomName: "Living Room",
                    timeRange: "10 AM - 12 PM",
                    cost: "\$ 37.00",
                    progress: 0.6,
                  ),
                  const SizedBox(height: 12),

                  _consumptionItem(
                    icon: Icons.kitchen,
                    iconColor: Colors.orangeAccent,
                    roomName: "Kitchen",
                    timeRange: "7 AM - 6 PM",
                    cost: "\$ 22.00",
                    progress: 0.4,
                  ),
                  const SizedBox(height: 12),

                  _consumptionItem(
                    icon: Icons.dining,
                    iconColor: Colors.purple,
                    roomName: "Dining Haul",
                    timeRange: "7 AM - 6 PM",
                    cost: "\$ 15.00",
                    progress: 0.4,
                  ),
                  const SizedBox(height: 12),

                  _consumptionItem(
                    icon: Icons.bathtub,
                    iconColor: Colors.pinkAccent,
                    roomName: "Bathroom",
                    timeRange: "6 AM - 8 PM",
                    cost: "\$ 12.00",
                    progress: 0.2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _graphCard({
    required String title,
    required String value,
    required Color lineColor,
    required Color bgColor,
    required List<FlSpot> spots,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: lineColor,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 60,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: lineColor,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    barWidth: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _consumptionItem({
    required IconData icon,
    required Color iconColor,
    required String roomName,
    required String timeRange,
    required String cost,
    required double progress,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                roomName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                timeRange,
                style: const TextStyle(fontSize: 12, color: Colors.white60),
              ),
              const SizedBox(height: 4),
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress,
                  child: Container(
                    decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          cost,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
