import 'package:flutter/material.dart';
import 'package:my_portrait/app/features/create_portrait/presenter/create_portrait_screen.dart';
import 'package:my_portrait/app/features/home/presenter/home_screen.dart';
import 'package:my_portrait/app/features/local/presenter/local_screen.dart';
import 'package:my_portrait/app/features/remote/presenter/remote_screen.dart';

class RoutesApp {
  static const home = '/';
  static const localScreen = '/local-screen';
  static const remoteScreen = '/remote-screen';
  static const createPortrait = '/create-portrait';
  static const arkit = '/arkit';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomeScreen(),
    localScreen: (context) => const LocalScreen(),
    remoteScreen: (context) => const RemoteScrenn(),
    createPortrait: (context) => const CreatePortraitScreen(),
    //arkit: (context) => const ArkitScreen()
  };
}
