import 'dart:math';
import 'dart:ui';

import 'package:dolphin_read/common/apis/apis.dart';
import 'package:dolphin_read/common/utils/utils.dart';
import 'package:dolphin_read/common/widgets/toast.dart';
import 'package:dolphin_read/model/user.dart';
import 'package:dolphin_read/routers/routes.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_dart/math/vec2d.dart';

class FlareSignInController extends FlareControls {
  ActorNode _faceControl;
  Mat2D _globalToFlareWorld = Mat2D();
  Vec2D _caretGlobal = Vec2D();
  Vec2D _caretWorld = Vec2D();
  Vec2D _faceOrigin = Vec2D();
  Vec2D _faceOriginLocal = Vec2D();
  bool _hasFocus = false;
  String _password;
  String _accout;
  static const double _projectGaze = 60.0;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    super.advance(artboard, elapsed);
    Vec2D targetTranslation;
    if (_hasFocus) {
      Vec2D.transformMat2(_caretWorld, _caretGlobal, _globalToFlareWorld);
      _caretWorld[1] +=
          sin(new DateTime.now().millisecondsSinceEpoch / 300.0) * 70.0;

      Vec2D toCaret = Vec2D.subtract(Vec2D(), _caretWorld, _faceOrigin);
      Vec2D.normalize(toCaret, toCaret);
      Vec2D.scale(toCaret, toCaret, _projectGaze);

      Mat2D toFaceTransform = Mat2D();
      if (Mat2D.invert(toFaceTransform, _faceControl.parent.worldTransform)) {
        Vec2D.transformMat2(toCaret, toCaret, toFaceTransform);
        targetTranslation = Vec2D.add(Vec2D(), toCaret, _faceOriginLocal);
      }
    } else {
      targetTranslation = Vec2D.clone(_faceOriginLocal);
    }

    Vec2D diff =
        Vec2D.subtract(Vec2D(), targetTranslation, _faceControl.translation);
    Vec2D frameTranslation = Vec2D.add(Vec2D(), _faceControl.translation,
        Vec2D.scale(diff, diff, min(1.0, elapsed * 5.0)));

    _faceControl.translation = frameTranslation;

    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    _faceControl = artboard.getNode("ctrl_face");
    if (_faceControl != null) {
      _faceControl.getWorldTranslation(_faceOrigin);
      Vec2D.copy(_faceOriginLocal, _faceControl.translation);
    }
    play("idle");
  }

  @override
  void onCompleted(String name) {
    play("idle");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {
    Mat2D.invert(_globalToFlareWorld, viewTransform);
  }

  void lookAt(Offset caret) {
    if (caret == null) {
      _hasFocus = false;
      return;
    }
    _caretGlobal[0] = caret.dx;
    _caretGlobal[1] = caret.dy;
    _hasFocus = true;
  }

  void setPassword(String value) {
    _password = value;
  }

   void setAccout(String value) {
    _accout = value;
  }
  
  bool _isCoveringEyes = false;
  coverEyes(cover) {
    if (_isCoveringEyes == cover) {
      return;
    }
    _isCoveringEyes = cover;
    if (cover) {
      play("hands_up");
    } else {
      play("hands_down");
    }
  }

  void  submitPassword(context) async{
    if(_isCoveringEyes){
      play("hands_down");
    }
    if(checkAccout(_accout)&&checkPassWord(_password)){
      UserModel respones = await UserApi.postLogin(context: context,params: {'username':_accout,'password':_password});
      if(respones.code==200){
        play("success");
        if(respones.data.user.isRegister==0){
          Toast.show('登录成功,完善信息');
          Routes.navigateTo(context, Routes.selectGender);
        }else{
          Toast.show('登录成功');
          Routes.navigateTo(context, Routes.index,clear: true);
        }
         
      }else{
         play("fail");
         Toast.show(respones.message);
         _isCoveringEyes = false;
      }
    }else{
      play("fail");
      _isCoveringEyes = false;
    }
  }
}