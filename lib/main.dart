import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true, 
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WidgetReplicationScreen(),
    );
  }
}

class WidgetReplicationScreen extends StatefulWidget {
  const WidgetReplicationScreen({super.key});

  @override
  State<WidgetReplicationScreen> createState() => _WidgetReplicationScreenState();
}

class _WidgetReplicationScreenState extends State<WidgetReplicationScreen> {
  
  bool _isPressed = false;
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            const Text(
              'Below is an example of an widgets:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 35),

           
            MouseRegion(
              onExit: (_) => setState(() => _hoveredIndex = null),
              child: Container(
                width: 320,
                height: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Row(
                    children: [
                      _buildColorBlock(0, const Color(0xFFFF4D4D)), // Red Block
                      _buildColorBlock(1, const Color(0xFF4CAF50)), // Green Block
                      _buildColorBlock(2, const Color(0xFF2196F3)), // Blue Block
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 55),

            
            GestureDetector(
              onTapDown: (_) => setState(() => _isPressed = true),
              onTapUp: (_) => setState(() => _isPressed = false),
              onTapCancel: () => setState(() => _isPressed = false),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    
                    borderRadius: BorderRadius.circular(_isPressed ? 75 : 130),
                  ),
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: 215,
                    height: 215,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9E9E9E), // Dark Grey layer
                      borderRadius: BorderRadius.circular(_isPressed ? 60 : 107.5),
                    ),
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: 165,
                      height: 165,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E0E0), 
                        borderRadius: BorderRadius.circular(_isPressed ? 45 : 82.5),
                      ),
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: 115,
                        height: 115,
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          borderRadius: BorderRadius.circular(_isPressed ? 30 : 57.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Row Column blocks maintain korar helper widget
  Widget _buildColorBlock(int index, Color color) {
    bool isAnyHovered = _hoveredIndex != null;
    bool isThisHovered = _hoveredIndex == index;

    
    double opacity = isAnyHovered && !isThisHovered ? 0.5 : 1.0;

    return Expanded(
      child: MouseRegion(
        onEnter: (_) => setState(() => _hoveredIndex = index),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 180),
          opacity: opacity,
          child: Container(
            color: color,
          ),
        ),
      ),
    );
  }
}