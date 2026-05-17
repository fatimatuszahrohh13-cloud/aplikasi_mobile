import 'package:flutter/material.dart';
import 'main_screen.dart';

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
                        final state = context.findAncestorStateOfType<MainScreenState>();
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
