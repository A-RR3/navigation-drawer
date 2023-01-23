import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_drawer_homework3/dafaults/defaults.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

var indexClicked = 0;

class MainPage extends StatefulWidget {
  const MainPage({Key, key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

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
];

class _MainPageState extends State<MainPage> {


  Function updateState(index) {
    return () {
      setState(() {
        indexClicked = index;
        Navigator.pop(context);
        // Navigator.push(context, route)
      });
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sandra1979@gmail.com',
                              style: GoogleFonts.sanchez(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey)),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 30,
                              color: Defaults.drawerItemColorIcon,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  AppDrawerTile(index: 0, onTap: updateState(0)),
                  AppDrawerTile(index: 1, onTap: updateState(1)),
                  AppDrawerTile(index: 2, onTap: updateState(2)),
                  AppDrawerTile(index: 3, onTap: updateState(3)),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 1,
                    thickness: .5,
                    color: Defaults.drawerItemColorIcon,
                  ),
                  ListTile(
                    subtitle: Text(
                      'Labels',
                      style: TextStyle(
                          fontSize: 20, color: Defaults.drawerItemColorIcon),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppDrawerTile(index: 4, onTap: updateState(4)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({Key key, @required this.index, @required this.onTap})
      : super(key: key);
  final int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        leading: Icon(
          Defaults.drawerItemIcon[index],
          size: 27,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColorIcon,
        ),
        title: Text(
          Defaults.drawerItemText[index],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: indexClicked == index
                ? Defaults.drawerItemSelectedColor
                : Defaults.drawerItemColorText,
          ),
        ),
        onTap: onTap,
        selected: indexClicked == index,
        selectedTileColor: Defaults.drawerSelectedTileColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),

      ),
    );
  }
}
