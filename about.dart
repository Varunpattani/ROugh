import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: const Color(0xFF728E09),
      ),
      backgroundColor: const Color(0xFFE5E5E5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Color(0xFF728E09), width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meet Our Team",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Developed by: Varun Pattani (23010101425)", style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text("Mentored by: Prof. Mehul Bhundiya, School of Computer Science", style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text("Explored by: ASWDC, School of Computer Science", style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text("Eulogized by: Darshan University, Rajkot, Gujarat - INDIA", style: TextStyle(fontSize: 16)),

                const SizedBox(height: 20),

                Text(
                  "About ASWDC",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "ASWDC is an Application, Software, and Website Development Center "
                      "@ Darshan University, run by Students and Staff of the School Of Computer Science.\n\n"
                      "The sole purpose of ASWDC is to bridge the gap between university curriculum & industry demands. "
                      "Students learn cutting-edge technologies, develop real-world applications, and gain experience "
                      "under industry experts & faculty guidance.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 20),

                Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Email: aswdc@darshan.ac.in", style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text("Phone: +91-9727747317", style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text("Website: www.darshan.ac.in", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
