import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_drawer_homework3/dafaults/defaults.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

var indexClicked = 0;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [
    Center(
      child: Text('Inbox'),
    ),
    Center(
      child: Text('Starred'),
    ),
    Center(
      child: Text('Sent'),
    ),
    Center(
      child: Text('Drafts'),
    ),
    Center(
      child: Text('Trash'),
    ),
    Center(
      child: Text('Spam'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Account NavDrawer")),
      body: pages[indexClicked],
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/drawer.jpg')),
                ),
                padding: const EdgeInsets.all(0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sandra Adams',
                        style: GoogleFonts.sanchez(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Sandra1979@gmail.com',
                          style: GoogleFonts.sanchez(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey)),
                    ],
                  ),
                )),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                      leading: Icon(
                        Defaults.drawerItemIcon[0],
                        size: 35,
                        color: indexClicked == 0
                            ? Defaults.drawerItemSelectedColor
                            : Defaults.drawerItemColor,
                      ),
                      title: Text(
                        Defaults.drawerItemText[0]
                        style: GoogleFonts.sanchez(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: indexClicked == 0
                            ? Defaults.drawerItemSelectedColor
                            : Defaults.drawerItemColor,
                        ),
                      ),
                      ),
                      onTap: () {
                        setState(() {
                          indexClicked = 0;
                        });
                        Navigator.pop(context);
                      }),
                  ListTile(
                      leading: Icon(
                        Defaults.drawerItemIcon[1],
                        size: 35,
                        color: indexClicked == 1
                            ? Defaults.drawerItemSelectedColor
                            : Defaults.drawerItemColor,
                      ),
                      title: Text(
                        Defaults.drawerItemText[1],
                        style: GoogleFonts.sanchez(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: indexClicked == 1
                            ? Defaults.drawerItemSelectedColor
                            : Defaults.drawerItemColor,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          indexClicked = 1;
                        });
                        Navigator.pop(context);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
