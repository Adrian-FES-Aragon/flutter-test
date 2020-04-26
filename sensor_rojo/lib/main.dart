import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

//Garcia Chavez Tomas Adrian
//FES Aragon

main() => runApp(Sensores());

class Sensores extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Estado();
}

class Estado extends State{
  GyroscopeEvent giroscopio;

  @override
  void initState(){
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event){
      setState(() {
        giroscopio = event;
      });
    });
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Giroscopio'
                ' X: ${giroscopio.x.roundToDouble()}'
                ' Y: ${giroscopio.y.roundToDouble()}'
                ' Z: ${giroscopio.z.roundToDouble()}'),
        ),
        body: Center(
            child: Container(
                    width: 300,
                    height: 300,
              decoration: BoxDecoration(
                    color: Colors.red.withOpacity((10-giroscopio.x.round().abs())/10),
                    borderRadius: BorderRadius.circular(150.0),
              ),
          ),
        ),
      ),
    );
  }
}
