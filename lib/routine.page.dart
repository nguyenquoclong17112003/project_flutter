import 'package:flutter/material.dart';
import 'home.dart';
import 'light_control_page.dart';

// void main() {
//   runApp(const MyApp());
// }
class Routine extends StatefulWidget {
  @override
  _routine createState() => _routine();
}
class _routine extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Routines',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFF0A182E),
          actions: [
            IconButton(
              icon: Icon(Icons.circle),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    // Xử lý khi nhấn vào ALL
                  },
                  child: Text(
                    'ALL',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // Xử lý khi nhấn vào TODAY
                      },
                      child: Text(
                        'TODAY',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 340), // Khoảng cách giữa TODAY và IconButton
                    IconButton(
                      onPressed: () {
                        // Xử lý khi nhấn vào IconButton
                      },
                      icon: Icon(Icons.add, color: Colors.red, size: 30),
                    ),
                  ],
                ),
              ],
            ),
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
                  padding: EdgeInsets.all(30),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Good Morning',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            value: true, // Giá trị của switch
                            onChanged: (value) {
                              // Xử lý khi trạng thái của switch thay đổi
                            },
                          ),
                        ],
                      ),
                      Divider( // Dấu gạch dưới
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16), // Khoảng cách giữa tiêu đề và hình ảnh
                      Row(
                        children: [
                          Icon(Icons.access_time), // Icon đồng hồ
                          SizedBox(width: 8), // Khoảng cách giữa icon và văn bản
                          Text(
                            '7:00 am',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 5), // Khoảng cách giữa tiêu đề và hình ảnh
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 8), // Icon lịch
                          Text(
                            'Every Day',
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(), // Dùng Spacer để đẩy phần còn lại sang phải
                          Row(
                            children: [
                              Text('x3 devices'),
                              Icon(Icons.chevron_right), // Dấu chevron
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'House Keeping',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            value: true, // Giá trị của switch
                            onChanged: (value) {
                              // Xử lý khi trạng thái của switch thay đổi
                            },
                          ),
                        ],
                      ),
                      Divider( // Dấu gạch dưới
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16), // Khoảng cách giữa tiêu đề và hình ảnh
                      Row(
                        children: [
                          Icon(Icons.access_time), // Icon đồng hồ
                          SizedBox(width: 8), // Khoảng cách giữa icon và văn bản
                          Text(
                            '9:00 am',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 16), // Khoảng cách giữa tiêu đề và hình ảnh
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 8), // Icon lịch
                          Text(
                            'Every Day',
                            style: TextStyle(fontSize: 16, ),
                          ),
                          Spacer(), // Dùng Spacer để đẩy phần còn lại sang phải
                          Row(
                            children: [
                              Text('x3 devices'),
                              Icon(Icons.chevron_right), // Dấu chevron
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Move Night',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            value: true, // Giá trị của switch
                            onChanged: (value) {
                              // Xử lý khi trạng thái của switch thay đổi
                            },
                          ),
                        ],
                      ),
                      Divider( // Dấu gạch dưới
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16), // Khoảng cách giữa tiêu đề và hình ảnh
                      Row(
                        children: [
                          Icon(Icons.access_time), // Icon đồng hồ
                          SizedBox(width: 8), // Khoảng cách giữa icon và văn bản
                          Text(
                            '10:00 pm',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 16), // Khoảng cách giữa tiêu đề và hình ảnh
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 8), // Icon lịch
                          Text(
                            'Every Day',
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(), // Dùng Spacer để đẩy phần còn lại sang phải
                          Row(
                            children: [
                              Text('x5 devices'),
                              Icon(Icons.chevron_right), // Dấu chevron
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Good Nights Sleep',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            value: true, // Giá trị của switch
                            onChanged: (value) {
                              // Xử lý khi trạng thái của switch thay đổi
                            },
                          ),
                        ],
                      ),
                      Divider( // Dấu gạch dưới
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16), // Khoảng cách giữa tiêu đề và hình ảnh
                      Row(
                        children: [
                          Icon(Icons.access_time), // Icon đồng hồ
                          SizedBox(width: 8), // Khoảng cách giữa icon và văn bản
                          Text(
                            '11:00 pm',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 16), // Khoảng cách giữa tiêu đề và hình ảnh
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 8), // Icon lịch
                          Text(
                            'Every Day',
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(), // Dùng Spacer để đẩy phần còn lại sang phải
                          Row(
                            children: [
                              Text('x2 devices'),
                              Icon(Icons.chevron_right), // Dấu chevron
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          onTap: (int index) {
            if (index == 0) { // Kiểm tra nếu index là 0 (tức là icon "Home" được chọn)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ControlLightPage()), // Chuyển tới trang HomeScreen
              );
            } else if (index == 1) {
              // Xử lý khi icon "Statistics" được chọn
            } else if (index == 2) {
              // Xử lý khi icon "Routines" được chọn
            } else if (index == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()), // Chuyển tới trang HomeScreen
              );
              // Xử lý khi icon "Settings" được chọn
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart, color: Colors.black),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.black),
              label: 'Routines',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
