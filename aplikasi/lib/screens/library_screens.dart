import 'package:flutter/material.dart';

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
