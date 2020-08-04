import 'package:smart_flare/actors/smart_flare_actor.dart';
import 'package:smart_flare/models.dart';
import 'package:flutter/material.dart';

class HomeBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var animationWidth = 295.0;
    var animationHeight = 251.0;
    var animationWidthThirds = animationWidth / 3;
    var halfAnimationHeight = animationHeight / 2;

    var activeAreas = [

      ActiveArea(
        area: Rect.fromLTWH(0, 0, animationWidthThirds, halfAnimationHeight),
        debugArea: false,
        guardComingFrom: ['deactivate'],
        animationName: 'camera_tapped',
        onAreaTapped: (){
          print('camera_tapped');
        }
      ),

      ActiveArea(
          area: Rect.fromLTWH(animationWidthThirds, 0, animationWidthThirds, halfAnimationHeight),
          debugArea: false,
          guardComingFrom: ['deactivate'],
          animationName: 'pulse_tapped'),

      ActiveArea(
          area: Rect.fromLTWH(animationWidthThirds * 2, 0, animationWidthThirds, halfAnimationHeight),
          debugArea: false,
          guardComingFrom: ['deactivate'],
          animationName: 'image_tapped'),

      ActiveArea(
          area: Rect.fromLTWH(0, animationHeight / 2, animationWidth, animationHeight / 2),
          debugArea: false,
          animationsToCycle: ['activate', 'deactivate'],
          onAreaTapped: () {
            print('Button tapped!');
          })

    ];
    return SmartFlareActor(
        width: animationWidth,
        height: animationHeight,
        filename: 'assets/button-animation.flr',
        startingAnimation: 'deactivate',
        activeAreas: activeAreas,
      );
  }
}