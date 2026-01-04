import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerSection(),
              statsCardsSection(),
              taskProgressSection(),
              deadlinesSection(),
              timelineSection(),
              meetingsSection(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  // 👤 PARTIE 1 - HEADER
  Widget headerSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          const Text(
            'M',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.orange,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 👤 PARTIE 1 - CARTES STATS
  Widget statsCardsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // AI Assistant + New Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.auto_awesome, color: Colors.orange, size: 20),
                    SizedBox(width: 8),
                    Text('AI Assistant'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Text('New', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 4 Cartes statistiques
          Row(
            children: [
              Expanded(child: statCard('Priority Task', '13/25', true, Icons.flag)),
              const SizedBox(width: 12),
              Expanded(child: statCard('Overdue Task', '12/20', true, Icons.calendar_today)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: statCard('Upcoming Task', '15/30', false, Icons.upcoming)),
              const SizedBox(width: 12),
              Expanded(child: statCard('Pending Task', '20/35', false, Icons.access_time)),
            ],
          ),
        ],
      ),
    );
  }

  Widget statCard(String title, String value, bool isPositive, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isPositive ? Colors.green.shade50 : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 12,
                      color: isPositive ? Colors.green : Colors.red,
                    ),
                    Text(
                      '10%',
                      style: TextStyle(
                        fontSize: 10,
                        color: isPositive ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 👤 PARTIE 2 - TASK PROGRESS
  Widget taskProgressSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Task Progress',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.more_horiz, color: Colors.grey.shade400),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: CustomPaint(
                      painter: CircularProgressPainter(),
                    ),
                  ),
                  const Column(
                    children: [
                      Text(
                        '\$6,550',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                legendItem(Colors.orange, 'Completed'),
                legendItem(Colors.yellow.shade700, 'In Progress'),
                legendItem(Colors.purple, 'Not Started'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget legendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  // 👤 PARTIE 3 - DEADLINES
  Widget deadlinesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Deadlines',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.more_horiz, color: Colors.grey.shade400),
              ],
            ),
            const SizedBox(height: 16),
            deadlineItem('Medical Website', 'Project Brief', 'On Progress', Colors.yellow.shade700),
            deadlineItem('Fluorenes Branding', 'Project Brief', 'Completed', Colors.green),
            deadlineItem('Call Analytics App', 'Project Brief', 'On Progress', Colors.yellow.shade700),
            deadlineItem('SaaS Landing Page', 'Project Brief', 'Completed', Colors.green),
          ],
        ),
      ),
    );
  }

  Widget deadlineItem(String title, String subtitle, String status, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.orange.shade100,
            child: const Icon(Icons.person, color: Colors.orange),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Icon(Icons.link, size: 12, color: Colors.grey.shade400),
                    const SizedBox(width: 4),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 11,
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 👤 PARTIE 4 - TIMELINE
  Widget timelineSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tasks Timeline',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.chevron_left, color: Colors.grey.shade400),
                    const Text('July, 2025'),
                    Icon(Icons.chevron_right, color: Colors.grey.shade400),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dateColumn('20', 'SUN'),
                dateColumn('21', 'MON'),
                dateColumn('22', 'TUE'),
              ],
            ),
            const SizedBox(height: 20),
            timelineTaskItem('User Interview', 'Pending', 2),
            const SizedBox(height: 12),
            timelineTaskItem('Wireframe Design', 'Working', 3),
          ],
        ),
      ),
    );
  }

  Widget dateColumn(String day, String weekday) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          weekday,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
        ),
      ],
    );
  }

  Widget timelineTaskItem(String title, String status, int avatarCount) {
    return Row(
      children: [
        Stack(
          children: List.generate(
            avatarCount,
            (index) => Padding(
              padding: EdgeInsets.only(left: index * 20.0),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.orange.shade100,
                child: const Icon(Icons.person, size: 16, color: Colors.orange),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

  // 👤 PARTIE 4 - MEETINGS
  Widget meetingsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Meetings',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.calendar_today_outlined, color: Colors.grey.shade400, size: 20),
              ],
            ),
            const SizedBox(height: 16),
            meetingItem('Meeting With Team', 'Zoom Meeting', '8:15 AM', Icons.videocam),
            const SizedBox(height: 12),
            meetingItem('Design Review', '', '9:00 AM', Icons.event_note),
          ],
        ),
      ),
    );
  }

  Widget meetingItem(String title, String subtitle, String time, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.grey.shade600, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
            ],
          ),
        ),
        Row(
          children: [
            Icon(Icons.access_time, size: 14, color: Colors.grey.shade400),
            const SizedBox(width: 4),
            Text(
              time,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ],
    );
  }

  // BOTTOM NAV BAR
  Widget bottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.dashboard, color: Colors.white),
            ),
            Icon(Icons.inbox_outlined, color: Colors.grey.shade400),
            Icon(Icons.view_agenda_outlined, color: Colors.grey.shade400),
            Icon(Icons.people_outline, color: Colors.grey.shade400),
            Icon(Icons.settings_outlined, color: Colors.grey.shade400),
            Icon(Icons.help_outline, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}

// Custom Painter pour le graphique circulaire
class CircularProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    // Orange (Completed) - 50%
    paint.color = Colors.orange;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.57, // -90 degrees
      3.14, // 180 degrees (50%)
      false,
      paint,
    );

    // Yellow (In Progress) - 30%
    paint.color = Colors.yellow.shade700;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      1.57, // 90 degrees
      1.88, // 108 degrees (30%)
      false,
      paint,
    );

    // Purple (Not Started) - 20%
    paint.color = Colors.purple;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.45, // 198 degrees
      1.26, // 72 degrees (20%)
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}