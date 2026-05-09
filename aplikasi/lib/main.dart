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