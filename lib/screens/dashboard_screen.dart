import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/donut_chart_painter.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
            _buildStatsGrid(),
            const SizedBox(height: 20),
            _buildProgressCard(),
            const SizedBox(height: 20),
            _buildDeadlinesCard(),
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

  Widget _buildStatsGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _statCard(
                'Priority Task',
                '13/25',
                '10%',
                true,
                Icons.flag_outlined,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _statCard(
                'Overdue Task',
                '12/20',
                '10%',
                true,
                Icons.event_busy_outlined,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _statCard(
                'Upcoming Task',
                '15/30',
                '10%',
                false,
                Icons.event_outlined,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _statCard(
                'Pending Task',
                '20/35',
                '10%',
                false,
                Icons.access_time_outlined,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _statCard(
    String title,
    String value,
    String percent,
    bool up,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
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
            children: [
              Icon(icon, size: 18, color: Colors.grey[500]),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.grey[500], fontSize: 11),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: up ? Colors.green.shade50 : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Icon(
                      up ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 10,
                      color: up ? Colors.green : Colors.red,
                    ),
                    Text(
                      percent,
                      style: TextStyle(
                        color: up ? Colors.green : Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
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

  Widget _buildProgressCard() {
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
                'Task Progress',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.more_horiz, color: Colors.grey[400], size: 24),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(200, 200),
                  painter: DonutChartPainter(),
                ),
                const Text(
                  '\$ 6,550',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legend('Completed', const Color(0xFFFF6B2C)),
              const SizedBox(width: 20),
              _legend('In Progress', const Color(0xFFFFC107)),
              const SizedBox(width: 20),
              _legend('Not Started', const Color(0xFF9C27B0)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legend(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildDeadlinesCard() {
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.more_horiz, color: Colors.grey[400], size: 24),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/100?img=5',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Medical Website',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.link, size: 12, color: Colors.grey[400]),
                        const SizedBox(width: 4),
                        Text(
                          'Project Brief',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4E6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'On Progress',
                  style: TextStyle(
                    color: Color(0xFFFF9800),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
