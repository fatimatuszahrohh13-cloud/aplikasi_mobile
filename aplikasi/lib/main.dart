import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriGrow',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          surface: const Color(0xFFF4F7F4),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7F4),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B3B1C)),
          titleMedium: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B3B1C)),
          bodyLarge: TextStyle(color: Color(0xFF4A554A)),
          bodyMedium: TextStyle(color: Color(0xFF4A554A)),
        ),
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ScanScreen(),
    const LibraryScreen(),
    const CalendarScreen(),
  ];

  void setTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: setTab,
        backgroundColor: Colors.white,
        elevation: 8,
        indicatorColor: const Color(0xFFC8E6C9),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Beranda'),
          NavigationDestination(icon: Icon(Icons.document_scanner_outlined), selectedIcon: Icon(Icons.document_scanner), label: 'Scan'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Pustaka'),
          NavigationDestination(icon: Icon(Icons.calendar_month_outlined), selectedIcon: Icon(Icons.calendar_month), label: 'Jadwal'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&q=80&w=150'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Selamat Pagi,', style: Theme.of(context).textTheme.bodyMedium),
                        Text('Budi Petani', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    color: const Color(0xFF1B3B1C),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Weather/Location Widget
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFFD32F2F), size: 20),
                  SizedBox(width: 8),
                  Text('Lembang, Jawa Barat', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  Spacer(),
                  Icon(Icons.wb_sunny, color: Colors.orange, size: 20),
                  SizedBox(width: 8),
                  Text('24°C', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Main Action Card (Scan)
            GestureDetector(
              onTap: () {
                final state = context.findAncestorStateOfType<_MainScreenState>();
                if (state != null) {
                  state.setTab(1);
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2E7D32), Color(0xFF4CAF50)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: const Color(0xFF4CAF50).withOpacity(0.4), blurRadius: 12, offset: const Offset(0, 6)),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text('AI Scanner', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(height: 12),
                          const Text('Deteksi Penyakit\nTanaman', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, height: 1.2)),
                          const SizedBox(height: 8),
                          const Text('Foto daun tanaman untuk\nmelihat analisis kesehatan.', style: TextStyle(color: Colors.white70, fontSize: 13)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.document_scanner, size: 40, color: Color(0xFF2E7D32)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Features Grid
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Layanan Kami', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18)),
                TextButton(onPressed: () {}, child: const Text('Lihat Semua')),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildFeatureCard(Icons.eco, 'Kesehatan', Colors.green)),
                const SizedBox(width: 16),
                Expanded(child: _buildFeatureCard(Icons.science, 'Pupuk', Colors.blue)),
                const SizedBox(width: 16),
                Expanded(child: _buildFeatureCard(Icons.cloud, 'Cuaca', Colors.orange)),
                const SizedBox(width: 16),
                Expanded(child: _buildFeatureCard(Icons.forum, 'Forum', Colors.purple)),
              ],
            ),
            const SizedBox(height: 28),

            // Recent Scans
            Text('Aktivitas Terakhir', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18)),
            const SizedBox(height: 16),
            _buildRecentCard('Tanaman Tomat', 'Bercak Daun Septoria', 'Kemarin, 14:30', 'https://images.unsplash.com/photo-1592841200221-a6898f307baa?auto=format&fit=crop&q=80&w=150', true),
            const SizedBox(height: 12),
            _buildRecentCard('Pohon Mangga', 'Sehat', '3 Hari yang lalu', 'https://images.unsplash.com/photo-1601493700631-2b16ec4b4716?auto=format&fit=crop&q=80&w=150', false),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, MaterialColor color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4))],
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600), textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis),
      ],
    );
  }

  Widget _buildRecentCard(String title, String status, String time, String imgUrl, bool isWarning) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imgUrl, width: 60, height: 60, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(width: 60, height: 60, color: Colors.grey.shade300, child: const Icon(Icons.image)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(isWarning ? Icons.warning_amber_rounded : Icons.check_circle_outline, size: 16, color: isWarning ? Colors.orange : Colors.green),
                    const SizedBox(width: 4),
                    Text(status, style: TextStyle(color: isWarning ? Colors.orange : Colors.green, fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Simulated Camera Feed
          Image.network(
            'https://images.unsplash.com/photo-1611078809180-87fb3c965eef?auto=format&fit=crop&q=80&w=600',
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.2),
            colorBlendMode: BlendMode.darken,
            errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey.shade900, child: const Center(child: Icon(Icons.camera_alt, color: Colors.white54, size: 80))),
          ),
          // Scanner UI overlay
          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildGlassButton(Icons.close, () {
                        final state = context.findAncestorStateOfType<_MainScreenState>();
                        if (state != null) {
                          state.setTab(0);
                        }
                      }),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('Arahkan daun ke bingkai', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      ),
                      _buildGlassButton(Icons.flash_off, () {}),
                    ],
                  ),
                ),
                
                const Spacer(),
                
                // Focus Frame
                Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.8), width: 2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Stack(
                    children: [
                      // Scanning line animation representation
                      Positioned(
                        top: 140,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 2,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            boxShadow: [BoxShadow(color: const Color(0xFF4CAF50).withOpacity(0.8), blurRadius: 10, spreadRadius: 2)],
                          ),
                        ),
                      ),
                      // Corners
                      _buildCorner(Alignment.topLeft),
                      _buildCorner(Alignment.topRight),
                      _buildCorner(Alignment.bottomLeft),
                      _buildCorner(Alignment.bottomRight),
                    ],
                  ),
                ),
                
                const Spacer(),
                
                // Bottom Controls
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon: const Icon(Icons.photo_library, color: Colors.white, size: 28), onPressed: () {}),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      IconButton(icon: const Icon(Icons.cameraswitch, color: Colors.white, size: 28), onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildCorner(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border(
            top: (alignment == Alignment.topLeft || alignment == Alignment.topRight) ? const BorderSide(color: Color(0xFF4CAF50), width: 4) : BorderSide.none,
            bottom: (alignment == Alignment.bottomLeft || alignment == Alignment.bottomRight) ? const BorderSide(color: Color(0xFF4CAF50), width: 4) : BorderSide.none,
            left: (alignment == Alignment.topLeft || alignment == Alignment.bottomLeft) ? const BorderSide(color: Color(0xFF4CAF50), width: 4) : BorderSide.none,
            right: (alignment == Alignment.topRight || alignment == Alignment.bottomRight) ? const BorderSide(color: Color(0xFF4CAF50), width: 4) : BorderSide.none,
          ),
          borderRadius: BorderRadius.only(
            topLeft: alignment == Alignment.topLeft ? const Radius.circular(20) : Radius.zero,
            topRight: alignment == Alignment.topRight ? const Radius.circular(20) : Radius.zero,
            bottomLeft: alignment == Alignment.bottomLeft ? const Radius.circular(20) : Radius.zero,
            bottomRight: alignment == Alignment.bottomRight ? const Radius.circular(20) : Radius.zero,
          ),
        ),
      ),
    );
  }
}

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pustaka Tanaman', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildChip('Semua', true),
                  const SizedBox(width: 8),
                  _buildChip('Penyakit Jamur', false),
                  const SizedBox(width: 8),
                  _buildChip('Hama Serangga', false),
                  const SizedBox(width: 8),
                  _buildChip('Kekurangan Nutrisi', false),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildDiseaseCard(
                  'Karat Daun (Rust Fungus)',
                  'Sering menyerang daun tanaman kopi dan jagung. Muncul bercak oranye kecoklatan.',
                  'https://images.unsplash.com/photo-1590880449155-b54f958ce314?auto=format&fit=crop&q=80&w=200'
                ),
                const SizedBox(height: 16),
                 _buildDiseaseCard(
                  'Kutu Kebul (Whitefly)',
                  'Hama mikroskopis yang menghisap cairan daun, menyebabkan daun menguning dan keriting.',
                  'https://images.unsplash.com/photo-1598285511874-913f0a1d4ec8?auto=format&fit=crop&q=80&w=200'
                ),
                const SizedBox(height: 16),
                _buildDiseaseCard(
                  'Bercak Daun Septoria',
                  'Penyakit jamur yang paling sering menyerang tanaman tomat. Bercak kecil dengan pusat abu-abu.',
                  'https://images.unsplash.com/photo-1574853036410-b98cc9e5f9de?auto=format&fit=crop&q=80&w=200'
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2E7D32) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? const Color(0xFF2E7D32) : Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildDiseaseCard(String title, String desc, String imgUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              imgUrl,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 140, color: Colors.grey.shade200, child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(desc, style: const TextStyle(fontSize: 14, color: Colors.black54, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Baca Selengkapnya', style: TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.bold)),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward_ios, size: 12, color: Color(0xFF2E7D32)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
