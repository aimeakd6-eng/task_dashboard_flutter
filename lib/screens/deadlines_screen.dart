import 'package:flutter/material.dart';

class DeadlinesScreen extends StatelessWidget {
  const DeadlinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildTopButtons(),
            const SizedBox(height: 20),
            _buildDeadlinesList(),
            const SizedBox(height: 20),
            _buildTimeline(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'M',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.notifications_outlined, size: 24),
            ),
            const SizedBox(width: 12),
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=1'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTopButtons() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: const [
              Icon(Icons.psychology, color: Color(0xFFFF6B2C), size: 20),
              SizedBox(width: 8),
              Text(
                'AI Assistant',
                style: TextStyle(
                  color: Color(0xFFFF6B2C),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B2C),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: const [
              Text(
                'New',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeadlinesList() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Deadlines',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.more_horiz, color: Colors.grey[400]),
            ],
          ),
          const SizedBox(height: 20),
          _taskItem(
            'Medical Website',
            'https://i.pravatar.cc/100?img=5',
            'On Progress',
            const Color(0xFFFF9800),
          ),
          const SizedBox(height: 16),
          _taskItem(
            'Fluorenes Branding',
            'https://i.pravatar.cc/100?img=10',
            'Completed',
            const Color(0xFF4CAF50),
          ),
          const SizedBox(height: 16),
          _taskItem(
            'Call Analytics App',
            'https://i.pravatar.cc/100?img=8',
            'On Progress',
            const Color(0xFFFF9800),
          ),
          const SizedBox(height: 16),
          _taskItem(
            'SaaS Landing Page',
            'https://i.pravatar.cc/100?img=12',
            'Completed',
            const Color(0xFF4CAF50),
          ),
        ],
      ),
    );
  }

  Widget _taskItem(String title, String avatar, String status, Color color) {
    return Row(
      children: [
        CircleAvatar(radius: 24, backgroundImage: NetworkImage(avatar)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.link, size: 12, color: Colors.grey[400]),
                  const SizedBox(width: 4),
                  Text(
                    'Project Brief',
                    style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeline() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tasks Timeline',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, size: 20),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('July, 2025', style: TextStyle(fontSize: 13)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, size: 20),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dateCol('20', 'SUN'),
              _dateCol('21', 'MON'),
              _dateCol('22', 'TUE'),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Stack(
                children: const [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/100?img=3',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/100?img=4',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 40),
              const Expanded(
                child: Text(
                  'User Interview',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Pending',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dateCol(String day, String label) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
      ],
    );
  }
}
