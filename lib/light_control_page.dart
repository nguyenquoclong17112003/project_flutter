import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home_page.dart';
import 'routine.page.dart';

class ControlLightPage extends StatefulWidget {
  @override
  _ControlLightPageState createState() => _ControlLightPageState();
}

class _ControlLightPageState extends State<ControlLightPage> {
  bool _isLightOn = false;

  void _toggleLight(bool turnOn) async {
    String status = turnOn ? "on" : "off";
    String apiUrl = "https://60b4e7d4fe923b0017c830cb.mockapi.io/api/v1/do-an-iot-smart-home/2";

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'light': status}),
      );

      if (response.statusCode == 200) {
        setState(() {
          _isLightOn = turnOn;
        });
      } else {
        throw Exception('Failed to update light status');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  double _avgHouseTemp = 60.0;
  int _numDevices = 3;
  String _selectedRoom = 'Master Bedroom';
  String _selectedRoutine = 'Morning';
  String _deviceInUse = 'PPP';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Sweet Home'),
        centerTitle: true, // Đặt centerTitle thành true để căn giữa tiêu đề
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // Chiều cao của màn hình
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEAA9A9),
              Colors.black,
              Color(0xFF514E4E),
            ],
            stops: [0, 0.9998, 0.9999],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hiển thị nhiệt độ hiện tại và nhiệt độ ngoài trời
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [Color(0xFFFEB35B), Color(0xFFFEB35B)], // Sử dụng màu #FEB35B
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Avg House Temp',
                                style: TextStyle(fontSize: 18.0, color: Colors.black),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '22°C',
                                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [Color(0xFFFEB35B), Color(0xFFFEB35B)], // Sử dụng màu #FEB35B
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Outside Temp',
                                style: TextStyle(fontSize: 18.0, color: Colors.black),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '60°F',
                                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Hiển thị số lượng thiết bị đang kết nối và thông tin về thiết bị đang sử dụng
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [Color(0xFFFEB35B), Color(0xFFFEB35B)], // Sử dụng màu #FEB35B
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Devices',
                                style: TextStyle(fontSize: 18.0, color: Colors.black),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '$_numDevices',
                                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [Color(0xFFFEB35B), Color(0xFFFEB35B)], // Sử dụng màu #FEB35B
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$_deviceInUse',
                                style: TextStyle(fontSize: 18.0, color: Colors.black),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '60%',
                                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Hiển thị danh sách các phòng và các chế độ
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Room',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  colors: [Colors.white, Color(0xFFFDA43C)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: TextButton(
                                onPressed: () {
                                  // Xử lý khi nút được nhấn
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 20.0)),
                                ),
                                child: const Text(
                                  'Master Bedroom',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  colors: [Colors.white, Color(0xFFFDA43C)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: TextButton(
                                onPressed: () {
                                  // Xử lý khi nút được nhấn
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 20.0)),
                                ),
                                child: const Text(
                                  'Bed Room',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0), // Khoảng cách giữa hai dòng Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  colors: [Colors.white, Color(0xFFFDA43C)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: TextButton(
                                onPressed: () {
                                  // Xử lý khi nút được nhấn
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 20.0)),
                                ),
                                child: const Text(
                                  'Kids Room',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  colors: [Colors.white, Color(0xFFFDA43C)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 20.0)),
                                ),
                                child: const Text(
                                  'Kitchen',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Routines',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16.0), // Khoảng cách từ biên ngoài của khối đến các container bên trong
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Màu nền của khối
                    borderRadius: BorderRadius.circular(10.0), // Độ cong của góc khối
                    boxShadow: [ // Hiệu ứng bóng đổ
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Màu của bóng đổ
                        spreadRadius: 5, // Bán kính lan rộng của bóng đổ
                        blurRadius: 7, // Độ mờ của bóng đổ
                        offset: Offset(0, 3), // Vị trí của bóng đổ (ngang, dọc)
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn chỉnh các container theo hai bên
                    children: [
                      Container(
                        width: 120.0, // Chiều rộng của container bên trái
                        height: 70.0, // Chiều cao của container bên trái
                        decoration: BoxDecoration(
                          color: Color(0xFFFAA23B), // Màu nền của container bên trái
                          borderRadius: BorderRadius.circular(10.0), // Độ cong của góc container bên trái
                        ),
                        child: IconButton(
                          icon: Icon(Icons.wb_sunny, size: 40, color: Colors.white), // Biểu tượng mặt trời
                          onPressed: () {
                            // Xử lý khi nút được nhấn
                          },
                        ),
                      ),
                      SizedBox(width: 16.0), // Khoảng cách giữa button và container bên phải
                      Container(
                        width: 120.0, // Chiều rộng của container bên phải
                        height: 70.0, // Chiều cao của container bên phải
                        decoration: BoxDecoration(
                          color: Color(0xFF3F3F3F), // Màu nền của container bên phải
                          borderRadius: BorderRadius.circular(10.0), // Độ cong của góc container bên phải
                        ),
                        child: IconButton(
                          icon: Icon(Icons.settings, size: 40, color: Colors.white), // Biểu tượng cài đặt
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Routine()),
                            );
                          },
                          splashColor: Colors.orange, // Đổi màu splash thành màu cam
                        ),

                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Device in Use ',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFFDA43C),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.air_rounded),
                        onPressed: () {
                          // Xử lý khi nút được nhấn
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          _isLightOn ? Icons.lightbulb : Icons.lightbulb_outline,
                          size: 40,
                          color: _isLightOn ? Colors.red : Colors.green,
                        ),
                        onPressed: () {
                          _toggleLight(!_isLightOn);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.ac_unit_rounded),
                        onPressed: () {
                          // Xử lý khi nút được nhấn
                        },
                      ),

                    ],
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









