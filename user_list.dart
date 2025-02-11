import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:matrimony/view_more.dart';

import 'about.dart';
import 'add_edit.dart';

void main() {
  runApp(Rail());
}

class Rail extends StatefulWidget {
  @override
  State<Rail> createState() => _RailState();
}

class _RailState extends State<Rail> {
  bool isFavourite = false;
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  bool isAscending = true;

  List<Map<String, dynamic>> userList = [
    {
      "fullName": "Joe Golderberg",
      "email": "john.doe@example.com",
      "mo": "1234567890",
      "dob": "15-04-1995",
      "city": "New York",
      "gender": "Male",
      "isFav": true,
      "hobb": "flakfjaf",
      "pass": "psswrd#1#hfalfafa",
      "conf": "psswrd#1#hfalfafa"
    },
    {
      "fullName": "Harley Quinn",
      "email": "jane.smith@example.com",
      "mo": "1987654321",
      "dob": "22-09-1992",
      "city": "Los Angeles",
      "gender": "Female",
      "isFav": false,
      "hobb": "flakfjaf",
      "pass": "psswrd#1#hfalfafa",
      "conf": "psswrd#1#hfalfafa"
    }
  ];

  int calculateAge(String dob) {
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    DateTime birthDate = dateFormat.parse(dob);
    DateTime currentDate = DateTime.now();
    return currentDate.year - birthDate.year;
  }

  List<Map<String, dynamic>> getFilteredList() {
    List<Map<String, dynamic>> filtered = userList.where((user) {
      bool favCheck = !isFavourite || user['isFav'];
      String age = calculateAge(user['dob']).toString();
      return favCheck &&
          (user['fullName'].toLowerCase().contains(searchQuery.toLowerCase()) ||
              user['city'].toLowerCase().contains(searchQuery.toLowerCase()) ||
              age.contains(searchQuery) ||
              user['email'].toLowerCase().contains(searchQuery.toLowerCase()) ||
              user['mo'].contains(searchQuery));
    }).toList();
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredList = getFilteredList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            Container(
              color: Color(0xFF728E09),
              width: 90, // Keep the width fixed
              child: SizedBox(
                height: MediaQuery.of(context).size.height, // Fixed height for scrollable menu
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, // Align from top
                      children: [
                        SizedBox(height: 100),
                        RotatedBox(
                          quarterTurns: -1,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return About();
                              }));
                            },
                            child: Text(
                              'About',
                              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        RotatedBox(
                          quarterTurns: -1,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return AddEdit();
                              })).then((value) {
                                if (value != null) {
                                  setState(() {
                                    userList.add(value);
                                  });
                                }
                              });
                            },
                            child: Text(
                              'Add',
                              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        RotatedBox(
                          quarterTurns: -1,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isFavourite = true;
                              });
                            },
                            child: Text(
                              'Favourite',
                              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        RotatedBox(
                          quarterTurns: -1,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isFavourite = false;
                              });
                            },
                            child: Text(
                              'All',
                              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(height: 170),
                        IconButton(
                          icon: Icon(Icons.home, color: Colors.white, size: 30),
                          onPressed: () {},
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              labelText: "Search User",
                              labelStyle: TextStyle(color: Color(0xFF728E09)),
                              hintText: "Search by Name, City, Age, Email, Phone",
                              prefixIcon: Icon(Icons.search, color: Color(0xFF728E09)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(color: Color(0xFF728E09)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(color: Color(0xFF728E09), width: 2),
                              ),
                            ),
                            cursorColor: Color(0xFF728E09),
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF728E09),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.sort, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                isAscending = !isAscending;
                                userList.sort((a, b) {
                                  int ageA = calculateAge(a['dob']);
                                  int ageB = calculateAge(b['dob']);
                                  return isAscending ? ageA.compareTo(ageB) : ageB.compareTo(ageA);
                                });
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: filteredList.isEmpty
                        ? Center(
                      child: Text(
                        "No User Found",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                        : ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          elevation: 5,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xFF728E09), width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Full Name: ${filteredList[index]['fullName']} (${calculateAge(filteredList[index]['dob'])} years)',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                    ),
                                    Text('Email: ${filteredList[index]['email']}'),
                                    Text('Mobile: ${filteredList[index]['mo']}'),
                                    Text('Date of Birth: ${filteredList[index]['dob']}'),
                                    Text('City: ${filteredList[index]['city']}'),
                                    Text('Gender: ${filteredList[index]['gender']}'),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ViewMore(userData: filteredList[index]),
                                              ),
                                            );
                                          },
                                          style: TextButton.styleFrom(backgroundColor: Color(0xFF728E09)),
                                          child: Text(
                                            'View More',
                                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return AddEdit(userData: filteredList[index]);
                                            })).then((updatedValue) {
                                              if (updatedValue != null) {
                                                setState(() {
                                                  userList[userList.indexOf(filteredList[index])] = updatedValue;
                                                });
                                              }
                                            });
                                          },
                                        ),
                                        SizedBox(width: 15),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            setState(() {
                                              userList.removeAt(userList.indexOf(filteredList[index]));
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: Icon(
                                      filteredList[index]['isFav'] ? Icons.favorite : Icons.favorite_border,
                                      color: filteredList[index]['isFav'] ? Color(0xFF728E09) : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        filteredList[index]['isFav'] = !filteredList[index]['isFav'];
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
