import 'package:flutter/material.dart';

import '../enters/login.dart';
import '../sensors/Co2.dart';
import '../sensors/fertilizer.dart';
import '../sensors/humidity.dart';
import '../sensors/light.dart';
import '../sensors/temperature.dart';
import '../sensors/wind.dart';
import 'CarouselWithDotsPage.dart';

final List<String> imgList = [
  'https://i.pinimg.com/originals/bf/71/5e/bf715ebb294566c117610973999928a0.jpg',
  'https://modernfarmer.sg/wp-content/uploads/2020/06/hydroponics-system-singapore-600x450.jpeg',
  'https://www.renkeer.com/wp-content/uploads/2021/07/Greenhouse-Remote-Monitoring-Systems.jpg',
  'https://sperotec.com/wp-content/uploads/2021/04/sensors-monitoring.png',
  'https://previews.123rf.com/images/pitaksunti/pitaksunti1802/pitaksunti180200014/96433865-choy-in-greenhouse-hydroponics-farm-in-thailand-.jpg',
  'https://thumbs.dreamstime.com/b/hydroponic-vegetable-vegetables-growing-greenhouse-cameron-highlands-31448707.jpg',
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
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
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 62, 127, 66),
        title: Text("Control your greenhouse"),
      ),
      body: Container(
          child: Column(children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "Have a suitable environment",
            style: TextStyle(
              color: Color.fromARGB(255, 62, 127, 66),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        CarouselWithDotsPage(imgList: imgList),
        SizedBox(
          height: 40,
          child: Text(''),
        ),
        Expanded(
            child: Stack(children: [
          //   Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          // children: <Widget>[
          GridView.extent(
              primary: false,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              maxCrossAxisExtent: 200.0,
              children: [
                Hero(
                  tag: 'f566',
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Lighting()));
                    },
                    child: CustomButton(
                        text: 'Lighting',
                        iconData: Icons.sunny,
                        action: () => (() => Null)),
                  ),
                ),
                Hero(
                    tag: 'f905',
                    child: InkWell(
                      //  onTap: () {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //      builder: (context) => IconSwitcher1()));
                      //},
                      child: CustomButton(
                          text: 'Monitor',
                          iconData: Icons.camera_alt,
                          action: () => (() => Null)),
                    )),
                Hero(
                    tag: 'f899',
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => IconSwitcher()));
                        },
                        child: CustomButton(
                            text: 'CO2',
                            iconData: Icons.co2,
                            action: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => IconSwitcher()),
                                )))),
                Hero(
                    tag: 'f7855',
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Wind()));
                      },
                      child: CustomButton(
                          text: 'Wind',
                          iconData: Icons.wind_power,
                          action: () => (() => Null)),
                    )),
                //Column(
                //children: [
                Hero(
                    tag: 'f8521',
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Temperature()));
                      },
                      child: CustomButton(
                          text: 'Tempreture',
                          iconData: Icons.thermostat,
                          action: () => (() => Null)),
                    )),
                Hero(
                    tag: 'f58292',
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => humidity()));
                      },
                      child: CustomButton(
                          text: 'Humidity',
                          iconData: Icons.water_drop,
                          action: () => (() => Null)),
                    )),
                Hero(
                    tag: 'f502748',
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => fertilizer()));
                      },
                      child: CustomButton(
                          text: 'Fertilizer',
                          iconData: Icons.medical_information,
                          action: () => (() => Null)),
                    )),
              ])
        ])),
      ])),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function() action;
  CustomButton(
      {required this.text, required this.iconData, required this.action});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: GestureDetector(
        onTap: action,
        child: Column(
          children: <Widget>[
            Icon(
              iconData,
              color: Color.fromARGB(255, 62, 127, 66),
              // Theme.of(context).primaryColorDark,
              size: 80.0,
            ),
            Text(text),
          ],
        ),
      ),
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 62, 127, 66), width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
    );
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
