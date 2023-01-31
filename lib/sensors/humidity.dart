import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class humidity extends StatefulWidget {
  const humidity({super.key});

  @override
  _humidityState createState() => _humidityState();
}

bool _switchValue = false;
double _value = 50.0;
double slidervalue = 0.0;

class _humidityState extends State<humidity> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green[700],
            title: Text("Control Humidity"),
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        _switchValue
                            ? Icons.sensor_window
                            : Icons.sensor_window_outlined,
                        size: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        _switchValue ? "ON" : "OFF",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Switch(
                      activeColor: Colors.green,
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              SfRadialGauge(
                axes: [
                  RadialAxis(
                    canRotateLabels: true,

                    axisLabelStyle: GaugeTextStyle(color: Colors.green),
                    // labelFormat: "", // if you want to remove numbers remove this
                    showLastLabel: true,
                    minimum: 0,
                    maximum: 100,
                    ranges: [
                      GaugeRange(
                        labelStyle: GaugeTextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        label: '${slidervalue.round()}%\nHumidity',
                        startValue: 0,
                        endValue: 100,
                        color: Colors.white10,
                        startWidth: 10,
                        endWidth: 1,
                        rangeOffset: 160,
                      ),
                    ],
                    pointers: [
                      RangePointer(
                        value: slidervalue,
                        color: Colors.green,
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Slider(
                  activeColor: Colors.green,
                  value: slidervalue,
                  min: 0,
                  label: "$slidervalue",
                  max: 100,
                  divisions: 100,
                  onChanged: (NEWvalue) {
                    setState(() {
                      slidervalue = NEWvalue;
                    });
                  })
            ],
          )),
    );
  }
}
