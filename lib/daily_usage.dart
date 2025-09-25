import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DailyUsagePage extends StatelessWidget {
  const DailyUsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final rooms = [
      {
        'name': 'Bedroom',
        'icon': Icons.bed,
        'color': const Color(0xff0eb9b8),
        'usage': 150,
        'total': 200,
        'price': '150.00',
      },
      {
        'name': 'Living Room',
        'icon': Icons.tv,
        'color': const Color(0xff1e88e5),
        'usage': 50,
        'total': 200,
        'price': '140.00',
      },
      {
        'name': 'Kitchen',
        'icon': Icons.kitchen,
        'color': const Color(0xffd46d5b),
        'usage': 37,
        'total': 200,
        'price': '100.00',
      },
      {
        'name': 'Bathroom',
        'icon': Icons.bathtub,
        'color': const Color(0xfff3a712),
        'usage': 20,
        'total': 200,
        'price': '50.00',
      },
      {
        'name': 'Garage',
        'icon': Icons.garage,
        'color': const Color(0xff1e88e5),
        'usage': 17,
        'total': 30,
        'price': '32.00',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Usage'),
        backgroundColor: const Color(0xff152a56),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Usage',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: BarChart(
                BarChartData(
                  maxY: 500,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = [
                            'Sun',
                            'Mon',
                            'Tue',
                            'Wed',
                            'Thu',
                            'Fri',
                            'Sat',
                          ];
                          final day = days[value.toInt() % days.length];
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              day,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 100,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '\$${value.toInt()}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 100 == 0,
                    getDrawingHorizontalLine: (value) =>
                        const FlLine(color: Colors.white24, strokeWidth: 1),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(toY: 0, color: Colors.transparent),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(toY: 230, color: Colors.blueAccent),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(toY: 0, color: Colors.transparent),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [BarChartRodData(toY: 420, color: Colors.cyan)],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(toY: 230, color: Colors.blueAccent),
                      ],
                    ),
                    BarChartGroupData(
                      x: 5,
                      barRods: [
                        BarChartRodData(toY: 0, color: Colors.transparent),
                      ],
                    ),
                    BarChartGroupData(
                      x: 6,
                      barRods: [
                        BarChartRodData(toY: 280, color: Colors.blueAccent),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Wednesday, 4 April 2021',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, i) {
                  final usagePercent = 7890 / 500;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: (rooms[i]['color'] as Color).withOpacity(
                              0.15,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            rooms[i]['icon'] as IconData,
                            color: rooms[i]['color'] as Color,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rooms[i]['name'] as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Text(
                                    '${rooms[i]['usage']}kW ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: rooms[i]['color'] as Color,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    'uses out of ',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '${rooms[i]['total']}kW',
                                    style: TextStyle(
                                      color: Colors.blue[600],
                                      decoration: TextDecoration.underline,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(2),
                                child: LinearProgressIndicator(
                                  value: usagePercent,
                                  minHeight: 5,
                                  backgroundColor: Colors.grey.shade300,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    rooms[i]['color'] as Color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '\$ ${rooms[i]['price']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff20bfa9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            onPressed: () {
              // Add pay logic here
            },
            child: const Text(
              "Pay now",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
