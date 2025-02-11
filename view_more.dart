import 'package:flutter/material.dart';

class ViewMore extends StatelessWidget {
  final Map<String, dynamic> userData;
  ViewMore({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Person Details"),
        backgroundColor: Color(0xFF728E09),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color(0xFF728E09), width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Full Name: ${userData['fullName']}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text("Email Address: ${userData['email']}"),
                SizedBox(height: 5),
                Text("Mobile Number: ${userData['mo']}"),
                SizedBox(height: 5),
                Text("Date of Birth: ${userData['dob']}"),
                SizedBox(height: 5),
                Text("City: ${userData['city']}"),
                SizedBox(height: 5),
                Text("Gender: ${userData['gender']}"),
                SizedBox(height: 5),
                Text("Hobbies: ${userData['hobb'] ?? 'N/A'}"),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF728E09),
                    ),
                    child: Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
