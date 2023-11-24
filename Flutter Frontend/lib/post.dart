import 'package:flutter/material.dart';
import 'profile.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostPage(),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late TextEditingController _complaintController;

  @override
  void initState() {
    super.initState();
    _complaintController = TextEditingController();
  }

  @override
  void dispose() {
    _complaintController.dispose();
    super.dispose();
  }

  int _currentIndex = 1;

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
        title: Text('Explain Your Problem'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerRow(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _complaintController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Explain your problem...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle photo upload
                          // Add your logic here
                        },
                        icon: Icon(Icons.camera_alt),
                        tooltip: 'Upload Photo',
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle video upload
                          // Add your logic here
                        },
                        icon: Icon(Icons.videocam),
                        tooltip: 'Upload Video',
                      ),
                      // Add more icons for other types of uploads
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle submitting the complaint
                      // Add your logic here
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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

class ContainerRow extends StatefulWidget {
  @override
  _ContainerRowState createState() => _ContainerRowState();
}

class _ContainerRowState extends State<ContainerRow> {
  int selectedContainerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectableContainer(
              isSelected: selectedContainerIndex == 0,
              onTap: () {
                setState(() {
                  selectedContainerIndex = 0;
                });
              },
              content: 'Hygine',
            ),
            SelectableContainer(
              isSelected: selectedContainerIndex == 1,
              onTap: () {
                setState(() {
                  selectedContainerIndex = 1;
                });
              },
              content: 'Traffic',
            ),
            SelectableContainer(
              isSelected: selectedContainerIndex == 2,
              onTap: () {
                setState(() {
                  selectedContainerIndex = 2;
                });
              },
              content: 'Electricity',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectableContainer(
              isSelected: selectedContainerIndex == 3,
              onTap: () {
                setState(() {
                  selectedContainerIndex = 3;
                });
              },
              content: 'Mismanage',
            ),
            SelectableContainer(
              isSelected: selectedContainerIndex == 4,
              onTap: () {
                setState(() {
                  selectedContainerIndex = 4;
                });
              },
              content: 'Mosquito',
            ),
            SelectableContainer(
              isSelected: selectedContainerIndex == 5,
              onTap: () {
                setState(() {
                  selectedContainerIndex = 5;
                });
              },
              content: 'Pothole',
            ),
          ],
        ),
      ],
    );
  }
}

class SelectableContainer extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String content;

  const SelectableContainer({
    required this.isSelected,
    required this.onTap,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            content,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'profile.dart';
// import 'main.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Camera App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const PostPage(),
//     );
//   }
// }
//
// class PostPage extends StatefulWidget {
//   const PostPage({Key? key}) : super(key: key);
//
//   @override
//   _PostPageState createState() => _PostPageState();
// }
//
// class _PostPageState extends State<PostPage> {
//   late TextEditingController _complaintController;
//
//   @override
//   void initState() {
//     super.initState();
//     _complaintController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _complaintController.dispose();
//     super.dispose();
//   }
//   int _currentIndex = 1;
//
//   // Define the pages corresponding to each icon
//   final List<Widget> _pages = [
//     LogPage(),
//     PostPage(),
//     ProfilePage(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Explain Your Problem'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//
//             ContainerRow(),
//
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   TextField(
//                     controller: _complaintController,
//                     maxLines: 5,
//                     decoration: InputDecoration(
//                       hintText: 'Explain your problem...',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           // Handle photo upload
//                           // Add your logic here
//                         },
//                         icon: Icon(Icons.camera_alt),
//                         tooltip: 'Upload Photo',
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // Handle video upload
//                           // Add your logic here
//                         },
//                         icon: Icon(Icons.videocam),
//                         tooltip: 'Upload Video',
//                       ),
//                       // Add more icons for other types of uploads
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle submitting the complaint
//                       // Add your logic here
//                     },
//                     child: Text('Submit'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           // Handle the tap and update the current index
//           setState(() {
//             _currentIndex = index;
//           });
//
//           // Perform navigation push based on the tapped index
//           switch (index) {
//             case 0:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LogPage()),
//               );
//               break;
//             case 1:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PostPage()),
//               );
//               break;
//             case 2:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProfilePage()),
//               );
//               break;
//           }
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_a_photo),
//             label: 'Post',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//       ),
//
//     );
//   }
// }
//
//
//
// class ContainerRow extends StatefulWidget {
//   @override
//   _ContainerRowState createState() => _ContainerRowState();
// }
//
// class _ContainerRowState extends State<ContainerRow> {
//   int selectedContainerIndex = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             SelectableContainer(
//               isSelected: selectedContainerIndex == 0,
//               onTap: () {
//                 setState(() {
//                   selectedContainerIndex = 0;
//                 });
//               },
//             ),
//             SelectableContainer(
//               isSelected: selectedContainerIndex == 1,
//               onTap: () {
//                 setState(() {
//                   selectedContainerIndex = 1;
//                 });
//               },
//             ),
//             SelectableContainer(
//               isSelected: selectedContainerIndex == 2,
//               onTap: () {
//                 setState(() {
//                   selectedContainerIndex = 2;
//                 });
//               },
//             ),
//           ],
//         ),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             SelectableContainer(
//               isSelected: selectedContainerIndex == 3,
//               onTap: () {
//                 setState(() {
//                   selectedContainerIndex = 3;
//                 });
//               },
//             ),
//             SelectableContainer(
//               isSelected: selectedContainerIndex == 4,
//               onTap: () {
//                 setState(() {
//                   selectedContainerIndex = 4;
//                 });
//               },
//             ),
//             SelectableContainer(
//               isSelected: selectedContainerIndex == 5,
//               onTap: () {
//                 setState(() {
//                   selectedContainerIndex = 5;
//                 });
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class SelectableContainer extends StatelessWidget {
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const SelectableContainer({
//     required this.isSelected,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 80,
//         height: 80,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: isSelected ? Colors.blue : Colors.transparent,
//             width: 2.0,
//           ),
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Center(
//           child: Text(
//             isSelected ? 'Selected' : 'Tap me',
//             style: TextStyle(
//               color: isSelected ? Colors.blue : Colors.black,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }