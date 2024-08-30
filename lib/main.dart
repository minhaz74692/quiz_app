import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}
