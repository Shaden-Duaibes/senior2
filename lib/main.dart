import 'package:flutter/material.dart';

import 'enters/login.dart';
import 'enters/sign_up.dart';

// the main fun is the starting point to the app
void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  //const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 246, 240),
        appBar: AppBar(
          title: const Center(
            child: Text('Welcom in our SCVH application'),
          ),
          backgroundColor: Color.fromARGB(255, 62, 127, 66),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TransPage(),
        ),
      ),
    );
  }
}

class TransPage extends StatefulWidget {
  const TransPage({super.key});

  @override
  State<TransPage> createState() => _TransPageState();
}

class _TransPageState extends State<TransPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(
                    'https://thumbs.dreamstime.com/b/hydroponics-subset-hydroculture-which-method-growing-plants-soil-using-mineral-nutrient-solutions-water-137089892.jpg'),
              ),
              Text('  '),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'please choose',
                style: TextStyle(fontSize: 40.0),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.all(30),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 62, 127, 66),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => LoginDemo()));
                },
                child: Text('log in'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 62, 127, 66),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => FormPage()));
                },
                child: Text('sign up '),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
