import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF268C8C),
      body: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: Stack(
          children: [
            // Abstract bloop Top Right
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 250,
                height: 300,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E282A), // Dark shape
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
            // Abstract bloop Bottom Left
            Positioned(
              bottom: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 250,
                decoration: const BoxDecoration(
                  color: Color(0xFFB2F3DF), // Light mint shape
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                    bottomRight: Radius.circular(80),
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
            // Abstract bloop Bottom Right
            Positioned(
              bottom: -20,
              right: -50,
              child: Container(
                width: 200,
                height: 250,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFD48F), // Light sand/yellow shape
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(100),
                  ),
                ),
              ),
            ),
            // Main Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TODO',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'The simplest todo\napp ever',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
