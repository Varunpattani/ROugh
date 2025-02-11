import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class AddEdit extends StatefulWidget {
  final Map<String, dynamic>? userData;
  const AddEdit({super.key, this.userData});

  @override
  State<AddEdit> createState() => _AddEditState();
}

class _AddEditState extends State<AddEdit> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mo = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController hobb = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conf = TextEditingController();
  bool isFav = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  bool isVisible = false;
  String? gender;
  String? dobError;

  @override
  void initState() {
    super.initState();
    if (widget.userData != null) {
      fullName.text = widget.userData!['fullName'];
      email.text = widget.userData!['email'];
      city.text = widget.userData!['city'];
      gender = widget.userData!['gender'];
      hobb.text = widget.userData!['hobb'];
      pass.text = widget.userData!['pass'];
      conf.text = widget.userData!['conf'];
      isFav = widget.userData!['isFav'];
      mo.text = widget.userData!['mo'];
      dob.text = widget.userData!['dob'];
    }
  }
  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF728E09),
        title: Text(
          widget.userData != null ? "Edit Details" : "Enter Details",
          style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            TextFormField(
              controller: fullName,
              decoration: InputDecoration(
                labelText: "Enter Full Name : ",
                labelStyle: TextStyle(color: Color(0xFF728E09), fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF728E09)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF728E09)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter valid username";
                }
                RegExp regExp = RegExp(r"^[a-zA-Z\s'-]{3,50}$");
                if (!regExp.hasMatch(value)) {
                  return "Enter a valid full name (3-50 characters, alphabets only)";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Enter Email Address : ",
                labelStyle: TextStyle(color: Color(0xFF728E09), fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF728E09)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF728E09)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Field is Empty!";
                }
                RegExp regExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                if (!regExp.hasMatch(value)) {
                  return "Enter a valid email address.";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: mo,
              keyboardType: TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: "Enter Mobile Number : ",
                labelStyle: TextStyle(color: Color(0xFF728E09), fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF728E09)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF728E09)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Mobile number is empty";
                }
                RegExp regExp = RegExp(r"^[0-9]{10}$");
                if (!regExp.hasMatch(value)) {
                  return "Enter a valid 10-digit mobile number.";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: dob,
                  decoration: InputDecoration(
                    labelText: "Selected Date",
                    errorText: dobError,
                  ),
                  readOnly: true,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF728E09)),
                  onPressed: () async {
                    DateTime currentDate = DateTime.now();
                    DateTime minDate = DateTime(currentDate.year - 80);
                    DateTime maxDate = DateTime(currentDate.year - 18);

                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? maxDate,
                      firstDate: minDate,
                      lastDate: maxDate,
                    );

                    if (date != null) {
                      int age = calculateAge(date);
                      if (age < 18 || age > 80) {
                        setState(() {
                          dobError = "Age must be between 18 and 80 years";
                          dob.text = "";
                        });
                      } else {
                        setState(() {
                          selectedDate = date;
                          dob.text = DateFormat("dd-MM-yyyy").format(date);
                          dobError = null;
                        });
                      }
                    }
                  },
                  child: Text("Pick Date", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Select Gender:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF728E09)),
            ),
            Column(
              children: <Widget>[
                RadioListTile<String>(
                  title: Text('Male'),
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (String? value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Female'),
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (String? value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Other'),
                  value: 'Other',
                  groupValue: gender,
                  onChanged: (String? value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: city,
              decoration: InputDecoration(
                labelText: "Enter City : ",
                labelStyle: TextStyle(color: Color(0xFF728E09), fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF728E09)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF728E09)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "City is empty";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: hobb,
              decoration: InputDecoration(
                labelText: "Enter Hobbies : ",
                labelStyle: TextStyle(color: Color(0xFF728E09), fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF728E09)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF728E09)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Hobbies are empty";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: pass,
              decoration: InputDecoration(
                  label: Text("Enter Password : "),
                  labelStyle: TextStyle(color: Color(0xFF728E09), fontWeight: FontWeight.bold),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                  )),
              obscureText: !isVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is empty!";
                } else if (value.length < 8) {
                  return "Password must be greater than 8 characters!";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: conf,
              decoration: InputDecoration(
                  label: Text("Enter Confirm Password : "),
                  labelStyle: TextStyle(color: Color(0xFF728E09), fontWeight: FontWeight.bold),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                  )),
              obscureText: !isVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Confirm Password is empty";
                } else if (pass.text != conf.text) {
                  return "Confirm Password is incorrect";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF728E09),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Map<String, dynamic> userData = {
                    'fullName': fullName.text,
                    'email': email.text,
                    'city': city.text,
                    'mo': mo.text,
                    'gender': gender,
                    'dob': dob.text,
                    'isFav': isFav,
                    'hobb': hobb.text,
                    'pass': pass.text,
                    'conf': conf.text
                  };
                  Navigator.of(context).pop(userData);
                }
              },
              child: Text(widget.userData != null ? "Update Data" : "Add Data", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}