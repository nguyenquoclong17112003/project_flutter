import 'package:flutter/material.dart';
import 'home_page.dart';
import 'routine.page.dart';
import 'light_control_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Home Sweet Home',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.grey[200],
//       ),
//       home: HomeScreen(),
//     );
//   }
// }


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Setting Routines', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0A182E),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước đó
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Schedule Name',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter schedule name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start Time',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter start time',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End Time',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter end time',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Select Days',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundedButton(label: 'Mon', color: Colors.orange),
                        RoundedButton(label: 'Tue', color: Colors.orange),
                        RoundedButton(label: 'Wed', color: Colors.orange),
                        RoundedButton(label: 'Thu', color: Colors.orange),
                        RoundedButton(label: 'Fri', color: Colors.orange),
                        RoundedButton(label: 'Sat', color: Colors.orange),
                        RoundedButton(label: 'Sun', color: Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Add Device'),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Icon(Icons.ac_unit),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Fans', style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text('50%', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                  Spacer(),
                  RoundedButton(label: 'Toggle', color: Colors.green),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Icon(Icons.bathtub),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shower', style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text('25°C', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                  Spacer(),
                  RoundedButton(label: 'Toggle', color: Colors.green),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Icon(Icons.lightbulb),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Light 2', style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text('80%', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                  Spacer(),
                  RoundedButton(label: 'Toggle', color: Colors.green, onPressed: () => _toggleLight(!_isLightOn)),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}

class RoundedButton extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback? onPressed;

  RoundedButton({required this.label, required this.color, this.onPressed});

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: _isSelected ? widget.color : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(widget.label),
    );
  }
}

bool _isLightOn = false;

void _toggleLight(bool newState) {
  _isLightOn = newState;
}