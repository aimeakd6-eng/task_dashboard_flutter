import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

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
            _buildTimeline(),
            const SizedBox(height: 20),
            _buildMeetings(),
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
          const SizedBox(height: 30),
          _timelineTask('User Interview', 'Pending'),
          const SizedBox(height: 50),
          _timelineTask('Wireframe Design', 'Working'),
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

  Widget _timelineTask(String title, String status) {
    return Row(
      children: [
        Stack(
          children: const [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=3'),
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
            Padding(
              padding: EdgeInsets.only(left: 48),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/100?img=7',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            status,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMeetings() {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Meetings',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: Colors.grey[400],
              ),
            ],
          ),
          const SizedBox(height: 16),
          _meetingItem(
            'Meeting With Team',
            'Zoom Meeting',
            '8:15 AM',
            Icons.videocam_outlined,
          ),
          const SizedBox(height: 16),
          _meetingItem('Design Review', '', '9:00 AM', Icons.article_outlined),
        ],
      ),
    );
  }

  Widget _meetingItem(String title, String sub, String time, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.grey[600], size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              if (sub.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  sub,
                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                ),
              ],
            ],
          ),
        ),
        Row(
          children: [
            Icon(Icons.access_time, size: 13, color: Colors.grey[500]),
            const SizedBox(width: 4),
            Text(time, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
          ],
        ),
      ],
    );
  }
}
