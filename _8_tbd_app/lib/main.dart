// Import only necessary libraries
import 'package:flutter/material.dart';
import 'splashScreen.dart';
import 'post.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF5F38F6),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const splashScreen(),
    );
  }
}

class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  State<LogPage> createState() => _LogPage();
}

class _LogPage extends State<LogPage> {
  int _currentIndex = 0;

  // Define the pages corresponding to each icon
  final List<Widget> _pages = [
    LogPage(),
    PostPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logs'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://i.pinimg.com/564x/18/7a/bc/187abce586e444366993bb805464f3ec.jpg',
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 90),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfilePage()),
                          );
                        },
                        child: Container(
                          height: 150,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Color(0xFF5F38F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),
                              Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    'USER ',
                                    style: TextStyle(color: Colors.white, fontSize: 40),
                                  ),
                                  Text(
                                    '100 Credits',
                                    style: TextStyle(color: Color(0xFFE7D8F0), fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(width: 50),
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/image/indianMan.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RequestLogList(logType: 'Pending Requests'),
                        SizedBox(height: 16),
                        RequestLogList(logType: 'Completed Requests'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // BottomNavigationBar at the bottom of the column
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Handle the tap and update the current index
          setState(() {
            _currentIndex = index;
          });

          // Perform navigation push based on the tapped index
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}


class RequestLogList extends StatelessWidget {



  final List<String> logDetails = [
    'Power outages persist, requesting prompt resolution. Bathroom facilities at your office are currently unavailable. Assistance appreciated for a swift resolution.',
    'Dear Patwari [Patwaris Full Name], the bathrooms in Sector 17 are in poor condition, affecting cleanliness. Kindly address this issue promptly to ensure a hygienic environment for residents. Your prompt attention is appreciated.',
    'It has been observed that the bathroom facilities at your office are currently unavailable. While understanding the various responsibilities you manage, the availability of sanitary facilities is crucial. I trust you will address this matter promptly.',
    'Details for Log 4',
  ];

  final String logType;

  RequestLogList({required this.logType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            logType,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              4, // Replace with the actual number of logs
                  (index) {
                return ExpansionTile(
                  title: ListTile(
                    title: Text('$logType Log ${index + 1}'),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(logDetails[index]),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}





