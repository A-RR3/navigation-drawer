import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_drawer_homework3/dafaults/defaults.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

var indexClicked = 0;

class MainPage extends StatefulWidget {
  // const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [
    Center(
      child: Text('My Files'),
    ),
    Center(
      child: Text('Shared with me'),
    ),
    Center(
      child: Text('Recent'),
    ),
    Center(
      child: Text('Trash'),
    ),
    Center(
      child: Text('Family'),
    ),
    Center(
      child: Text('Spam'),
    )
  ];

  Function updateState(index) {
    return () {
      setState(() {
        indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

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
                  AppDrawerTitle(index: 0, Tap: updateState(0)),
                  AppDrawerTitle(index: 1, Tap: updateState(1)),
                  AppDrawerTitle(index: 2, Tap: updateState(2)),
                  AppDrawerTitle(index: 3, Tap: updateState(3)),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Defaults.drawerItemColorIcon,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  ListTile(
                    subtitle: Text(
                      "Labels",
                      style: TextStyle(
                          color: Defaults.drawerItemColorIcon,
                          fontSize: 19
                      ),
                    ),
                  ),
                  AppDrawerTitle(index: 4, Tap: updateState(4)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppDrawerTitle extends StatelessWidget {
  const AppDrawerTitle({Key, key, @required this.index, @required this.Tap})
      : super(key: key);
  final int index;
  final Function Tap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        selected: indexClicked == index,
        selectedTileColor: Defaults.drawerSelectedTileColor,
        onTap: Tap,
        leading: Icon(
          Defaults.drawerItemIcon[index],
          size: 30,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColorIcon,
        ),
        title: Text(
          Defaults.drawerItemText[index],
          style: GoogleFonts.sanchez(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: indexClicked == index
                ? Defaults.drawerItemSelectedColor
                : Defaults.drawerItemColorText,
          ),
        ),
      ),
    );
  }
}
