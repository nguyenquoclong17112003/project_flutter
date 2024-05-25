import 'package:flutter/material.dart';
import 'light_control_page.dart'; // Import your ControlLightPage here

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kitchen',
          style: TextStyle(
            color: Colors.white, // Thay đổi màu văn bản thành màu trắng
            fontSize: 24.0,
          ),

        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0A182E), // Thay đổi màu nền của thanh tiêu đề thành đen
        iconTheme: IconThemeData(
          color: Colors.white, // Đặt màu cho icon quay lại trang trước
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 0), // Khoảng trống giữa các hàng
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(), // Thêm Spacer widget
                CustomIconButton(
                  icon: Icons.lightbulb_outline,
                  label: 'Light',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ControlLightPage()),
                    );
                  },
                  hoverColor: Colors.yellow, // Thêm màu hover cho icon bóng đèn
                ),

                Spacer(), // Thêm Spacer widget
                CustomIconButton(
                  icon: Icons.thermostat,
                  label: 'Thermostat', onPressed: () {  },
                ),
                Spacer(), // Thêm Spacer widget
                CustomIconButton(
                  icon: Icons.kitchen,
                  label: 'Fridge', onPressed: () {  },
                ),
                Spacer(), // Thêm Spacer widget
                CustomIconButton(
                  icon: Icons.air,
                  label: 'Fans', onPressed: () {  },
                ),
                Spacer(), // Thêm Spacer widget
                CustomIconButton(
                  icon: Icons.speaker,
                  label: 'Speakers', onPressed: () {  },
                ),
                Spacer(), // Thêm Spacer widget
              ],
            ),
            SizedBox(height: 60), // Khoảng trống giữa các hàng
            Center(
              child: Text(
                'Thermostat',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5,), // Tăng khoảng trống giữa các hàng
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  icon: Icons.ac_unit,
                  label: 'Heating',
                  iconSize: 50.0, onPressed: () {  },
                ),
                SizedBox(width: 24), // Thêm khoảng trống giữa các biểu tượng
                CustomIconButton(
                  icon: Icons.air,
                  label: 'Fans',
                  iconSize: 50.0, onPressed: () {  },
                ),
              ],
            ),
            SizedBox(height: 20), // Khoảng trống giữa các hàng
            TemperatureSlider(),
            SizedBox(height: 20), // Khoảng trống giữa các hàng
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Canh giữa văn bản
                children: [
                  Icon(
                    Icons.power_settings_new, // Thay đổi biểu tượng nguồn
                    color: Colors.red, // Thay đổi màu thành màu đỏ
                    size: 32.0,
                  ),
                  SizedBox(width:10), // Tăng khoảng trống giữa biểu tượng và văn bản
                ],
              ),
            ),
            SizedBox(height: 100), // Khoảng trống giữa các hàng
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoomInformation(
                  roomName: 'This Room',
                  temperature: 26,
                  airHumidity: 60,
                ),
                RoomInformation(
                  roomName: 'Bad Room',
                  temperature: 28,
                  airHumidity: 65,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double iconSize;
  final VoidCallback? onPressed; // Thêm dấu hỏi '?' để biến này có thể là null
  final Color? hoverColor; // Thêm thuộc tính hoverColor

  CustomIconButton({
    required this.icon,
    required this.label,
    this.onPressed,
    this.hoverColor,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed, // Sử dụng biến onPressed được cung cấp
          color: Colors.grey,
          hoverColor: hoverColor, // Sử dụng thuộc tính hoverColor được cung cấp
          iconSize: iconSize,
        ),
        SizedBox(height: 0),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}

class TemperatureSlider extends StatefulWidget {
  @override
  _TemperatureSliderState createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {
  double _currentTemperature = 15.0;

  void _incrementTemperature() {
    setState(() {
      if (_currentTemperature < 30) {
        _currentTemperature++;
      }
    });
  }

  void _decrementTemperature() {
    setState(() {
      if (_currentTemperature > 1) {
        _currentTemperature--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 20), // Khoảng trống phía trên thanh trượt
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: _decrementTemperature,
                color: Colors.black,
                iconSize: 32.0,
              ),
              Text(
                '${_currentTemperature.round()}°',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.red, // Đặt màu văn bản thành màu đỏ
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _incrementTemperature,
                color: Colors.black,
                iconSize: 32.0,
              ),
            ],
          ),
        ]);
  }
}

class RoomInformation extends StatelessWidget {
  final String roomName;
  final int temperature;
  final int airHumidity;

  RoomInformation({
    required this.roomName,
    required this.temperature,
    required this.airHumidity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            roomName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Temperature: ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                '$temperature°C',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red, // Đặt màu văn bản thành màu đỏ
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Air Humidity: ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                '$airHumidity%',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue, // Đặt màu văn bản thành màu xanh
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
