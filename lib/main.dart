import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Dashboard", style: TextStyle(color: Colors.black)),
      ),

      // ===== BODY =====
      body: SingleChildScrollView(
        child: Column(
          children: [
            _assistantHeader(),
            _topCards(),
            const SizedBox(height: 14),
            _dotIndicator(),
            const SizedBox(height: 14),
            _taskProgressCard(),
            _deadlinesCard(),
            _taskTimelineCard(),
            const SizedBox(height: 80), // espace pour la nav bar
          ],
        ),
      ),

      // ===== BOTTOM NAVIGATION =====
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  // ---------------- HEADER ----------------

  Widget _assistantHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome, color: Colors.orange),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("AI Assistant"),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: const Text("New"),
          ),
        ],
      ),
    );
  }

  // ---------------- TOP CARDS ----------------

  Widget _topCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2.3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: const [
          InfoCard("Priority Task", "13/25", Colors.orange, Icons.flag),
          InfoCard("Overdue Task", "12/20", Colors.red, Icons.warning),
          InfoCard("Upcoming Task", "15/30", Colors.blue, Icons.schedule),
          InfoCard("Pending Task", "20/35", Colors.purple, Icons.pending),
        ],
      ),
    );
  }

  Widget _dotIndicator() {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  // ---------------- TASK PROGRESS ----------------

  Widget _taskProgressCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 280,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Task Progress",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.more_horiz),
              ],
            ),
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 130,
                      height: 130,
                      child: CircularProgressIndicator(
                        value: 1,
                        strokeWidth: 10,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(
                      width: 130,
                      height: 130,
                      child: CircularProgressIndicator(
                        value: 0.6,
                        strokeWidth: 10,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(
                      width: 130,
                      height: 130,
                      child: CircularProgressIndicator(
                        value: 0.35,
                        strokeWidth: 10,
                        color: Colors.blue,
                      ),
                    ),
                    const Text(
                      "\$ 6.550",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LegendDot(Colors.orange, "Completed"),
                LegendDot(Colors.blue, "In Progress"),
                LegendDot(Colors.grey, "Not Started"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- DEADLINES ----------------

  Widget _deadlinesCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const Text(
              "Deadlines",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _deadlinePerson("Medical Website", "Project Brief", "On Progress"),
            _deadlinePerson("Fluorenes Branding", "Project Brief", "Completed"),
            _deadlinePerson(
              "Call Analytics App",
              "Project Brief",
              "On Progress",
            ),
            _deadlinePerson("SaaS Landing Page", "Project Brief", "Completed"),
          ],
        ),
      ),
    );
  }

  Widget _deadlinePerson(String title, String subtitle, String status) {
    final isCompleted = status == "Completed";
    final bgColor = isCompleted
        ? Colors.green.shade100
        : Colors.orange.shade100;
    final textColor = isCompleted ? Colors.green : Colors.orange;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: bgColor,
              child: const Icon(Icons.person),
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
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: TextStyle(fontSize: 12, color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- TASK TIMELINE ----------------

  Widget _taskTimelineCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  "Tasks Timeline",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.chevron_left),
                SizedBox(width: 6),
                Text("July, 2025", style: TextStyle(color: Colors.grey)),
                SizedBox(width: 6),
                Icon(Icons.chevron_right),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _DayItem("20", "SUN"),
                _DayItem("21", "MON", isActive: true),
                _DayItem("22", "TUE"),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 16,
                    child: _TimelineTask(
                      title: "User Interview",
                      status: "Pending",
                      color: Colors.orange,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 16,
                    child: _TimelineTask(
                      title: "Wireframe Design",
                      status: "Working",
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- BOTTOM NAVIGATION ----------------

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      onTap: (index) {},
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: "Tasks"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.orange,
            child: Icon(Icons.add, color: Colors.white),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "Calendar",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}

// ---------------- COMPONENTS ----------------

class _DayItem extends StatelessWidget {
  final String day;
  final String label;
  final bool isActive;

  const _DayItem(this.day, this.label, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const InfoCard(this.title, this.value, this.color, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    final p = value.split('/');
    final percent = ((int.parse(p[0]) / int.parse(p[1])) * 100).round();

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("$percent%", style: TextStyle(color: color)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LegendDot extends StatelessWidget {
  final Color color;
  final String text;

  const LegendDot(this.color, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _TimelineTask extends StatelessWidget {
  final String title;
  final String status;
  final Color color;

  const _TimelineTask({
    required this.title,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 14, backgroundColor: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(status, style: TextStyle(fontSize: 11, color: color)),
          ),
        ],
      ),
    );
  }
}
