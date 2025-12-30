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

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- CARDS DU HAUT ----
            _infoCard("Priority Task", "13 / 25", Colors.orange),
            _infoCard("Overdue Task", "12 / 20", Colors.red),
            _infoCard("Upcoming Task", "15 / 30", Colors.blue),
            _infoCard("Pending Task", "20 / 35", Colors.purple),

            // ---- SECTION DEADLINES ----
            _sectionTitle("Deadlines"),
            _taskTile("Medical Website", "On Progress"),
            _taskTile("Branding Project", "Completed"),
            _taskTile("SaaS Landing Page", "On Progress"),

            // ---- SECTION TIMELINE ----
            _sectionTitle("Tasks Timeline"),
            _taskTile("User Interview", "Pending"),
            _taskTile("Wireframe Design", "Working"),
            _taskTile("Design Review", "09:00 AM"),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.analytics, color: color),
          title: Text(title),
          trailing: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _taskTile(String title, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Card(
        child: ListTile(title: Text(title), trailing: Text(status)),
      ),
    );
  }
}
