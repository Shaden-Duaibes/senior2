import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:senior/addgreenhouse.dart';
import 'package:senior/enters/login.dart';

import 'greenhouse/greenhousePage.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 62, 127, 66),
        centerTitle: true,
        title: Text('GreenHouses'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  //ls
                },
                icon: Icon(Icons.notifications),
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 62, 127, 66)),
              accountName: Text('Welcome'),
              accountEmail: Text('test34@gmail.com'),
              currentAccountPicture: GreenhouseLogo(),
            ),
            Hero(
              tag: 'f3',
              child: ListTile(
                // heroTag='f1',
                leading: const Icon(Icons.home_filled),
                title: const Text(
                  'HomePage',
                  //style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Hero(
              tag: 'f4',
              child: ListTile(
                leading: const Icon(Icons.add),
                title: const Text(
                  'More Greenhouse',
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => Add()));
                },
              ),
            ),
            ExpansionTile(
              title: Text("Sensors"),
              leading: Icon(Icons.sensors),
              children: <Widget>[
                Hero(
                  tag: 'f6',
                  child: ListTile(
                    leading: const Icon(Icons.sunny),
                    title: const Text(
                      'Sunny',
                    ),
                  ),
                ),
                Hero(
                  tag: 'f7',
                  child: ListTile(
                    leading: const Icon(Icons.camera_alt_sharp),
                    title: const Text(
                      'camera',
                    ),
                  ),
                ),
                Hero(
                  tag: 'f8',
                  child: ListTile(
                    leading: const Icon(Icons.co2),
                    title: const Text(
                      'Co2',
                    ),
                  ),
                ),
                Hero(
                  tag: 'f9',
                  child: ListTile(
                    leading: const Icon(Icons.wind_power),
                    title: const Text(
                      'Wind',
                    ),
                  ),
                ),
                Hero(
                  tag: 'f0',
                  child: ListTile(
                    leading: const Icon(Icons.thermostat),
                    title: const Text(
                      'Tempreture',
                    ),
                  ),
                ),
                Hero(
                  tag: 'f11',
                  child: ListTile(
                    leading: const Icon(Icons.water_drop),
                    title: const Text(
                      'humidity',
                    ),
                  ),
                ),
                Hero(
                  tag: 'f12',
                  child: ListTile(
                    leading: const Icon(Icons.medical_information),
                    title: const Text(
                      'Fertilizer',
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Languages"),
              leading: const Icon(Icons.language),
              children: <Widget>[
                Hero(
                  tag: 'f13',
                  child: ListTile(
                    leading: const Icon(Icons.line_axis_sharp),
                    title: const Text(
                      'English',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Hero(
                  tag: 'f98',
                  child: ListTile(
                    leading: const Icon(Icons.line_axis),
                    title: const Text(
                      'Arabic',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Theme Mode"),
              leading: const Icon(Icons.mode),
              children: <Widget>[
                Hero(
                  tag: 'f1dse3',
                  child: ListTile(
                    leading: const Icon(Icons.light_mode),
                    title: const Text(
                      'Light',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Hero(
                  tag: 'f98',
                  child: ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text(
                      'Dark',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Hero(
              tag: 'f97',
              child: ListTile(
                leading: const Icon(Icons.report),
                title: const Text(
                  'Daily Report',
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Hero(
              tag: 'f8693',
              child: ListTile(
                // heroTag='f1',
                leading: const Icon(Icons.help),
                title: const Text(
                  'Help',
                  //style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Hero(
              tag: 'f65',
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Log_Out',
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => LoginDemo()));
                },
              ),
            ),
          ],
        ),
      ),
      body: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
      children: [
        Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: 'f1',
                    child: InkWell(
                        onTap: () {
                          print('Text Clicked');
                        },
                        child: Text('Greenhouse1',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            )))),
                Container(
                  height: 300,
                  width: 450,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Hero(
                    tag: 'f2',
                    child: InkWell(
                      onTap: () {}, // Image tapped
                      splashColor: Colors.white10, // Splash color over image
                      child: Image(
                          image: NetworkImage(
                              'https://media.istockphoto.com/id/670157616/photo/symmetrical-overview-of-lots-of-small-chrysanthemum-cuttings-in-long-rows.jpg?s=1024x1024&w=is&k=20&c=KcRy4-C6rOt0Snl1MBB_P0ViSJAOv1LC3aAzDAf7Oqc=')),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsetsDirectional.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.sunny,
                          color: Colors.black,
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(
                          width: 25, //<-- SEE HERE
                        ),
                        Icon(
                          Icons.co2,
                          color: Colors.black,
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(
                          width: 25, //<-- SEE HERE
                        ),
                        Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.black,
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(
                          width: 25, //<-- SEE HERE
                        ),
                        Icon(
                          Icons.wind_power,
                          color: Colors.black,
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(
                          width: 25, //<-- SEE HERE
                        ),
                        Icon(
                          Icons.thermostat,
                          color: Colors.black,
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(
                          width: 30, //<-- SEE HERE
                        ),
                        Icon(
                          Icons.water_drop,
                          color: Colors.black,
                          textDirection: TextDirection.ltr,
                        ),
                      ],
                    ))
              ],
            ))
      ],
    ));
  }
}

class GreenhouseLogo extends StatelessWidget {
  const GreenhouseLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
          image: NetworkImage(
              'https://images-platform.99static.com//kizentTD8x3rQ6dzeOOsXLxueDI=/0x68:500x568/fit-in/500x500/99designs-contests-attachments/48/48486/attachment_48486257')),
    );
  }
}
