

import 'package:dolphin_read/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {

  Color color;
  List<Widget>  list;
  @override
  void initState() {
    color = Toast.slRandomColor();
    list = [
      SpinKitPumpingHeart(color:color),
      SpinKitPulse(color:color),
      SpinKitDoubleBounce(color:color),
      SpinKitWave(color:color),
      SpinKitThreeBounce(color:color),
      SpinKitWanderingCubes(color:color),
      SpinKitWanderingCubes(color:color),
      SpinKitCircle(color:color),
      SpinKitFadingFour(color:color),
      SpinKitFadingCube(color:color),
      SpinKitCubeGrid(color:color),
      SpinKitFoldingCube(color:color),
      SpinKitRing(color:color),
      SpinKitDualRing(color:color),
      SpinKitRipple(color:color),
      SpinKitFadingGrid(color:color),
      SpinKitSquareCircle(color:color),
      SpinKitSpinningCircle(color:color),
      SpinKitFadingCircle(color:color),
      SpinKitHourGlass(color:color),
      SpinKitPouringHourglass(color:color),
    ];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 80,
          height: 80,
          child:  Toast.getRandom(list),
        ),
      )
    );
  }

  
  
}