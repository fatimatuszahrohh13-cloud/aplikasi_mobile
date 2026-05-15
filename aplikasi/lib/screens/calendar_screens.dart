import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Perawatan', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Weekly Calendar Strip
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Mei 2026', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          IconButton(icon: const Icon(Icons.chevron_left), onPressed: () {}),
                          IconButton(icon: const Icon(Icons.chevron_right), onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildDateCard('Sen', '11', false),
                      _buildDateCard('Sel', '12', true),
                      _buildDateCard('Rab', '13', false),
                      _buildDateCard('Kam', '14', false),
                      _buildDateCard('Jum', '15', false),
                      _buildDateCard('Sab', '16', false),
                      _buildDateCard('Min', '17', false),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text('Hari ini - 12 Mei 2026', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
                const SizedBox(height: 16),
                _buildTaskCard(
                  'Siram Tanaman Tomat',
                  'Pukul 07:00 Pagi',
                  Icons.water_drop,
                  Colors.blue,
                  true,
                ),
                const SizedBox(height: 12),
                _buildTaskCard(
                  'Berikan Pupuk Kompos',
                  'Cabai Rawit - Pukul 16:00 Sore',
                  Icons.compost,
                  Colors.brown,
                  false,
                ),
                const SizedBox(height: 12),
                _buildTaskCard(
                  'Cek Kondisi Daun',
                  'Pohon Mangga - Terindikasi Hama',
                  Icons.search,
                  Colors.orange,
                  false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateCard(String day, String date, bool isSelected) {
    return Container(
      width: 60,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2E7D32) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isSelected ? const Color(0xFF2E7D32) : Colors.grey.shade200),
        boxShadow: isSelected ? [BoxShadow(color: const Color(0xFF2E7D32).withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))] : [],
      ),
      child: Column(
        children: [
          Text(day, style: TextStyle(fontSize: 13, color: isSelected ? Colors.white70 : Colors.black54, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text(date, style: TextStyle(fontSize: 18, color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String title, String subtitle, IconData icon, Color iconColor, bool isCompleted) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, 
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                    color: isCompleted ? Colors.grey : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: Colors.black54)),
              ],
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted ? const Color(0xFF2E7D32) : Colors.transparent,
              border: Border.all(color: isCompleted ? const Color(0xFF2E7D32) : Colors.grey.shade400, width: 2),
            ),
            child: isCompleted ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
          ),
        ],
      ),
    );
  }
}
