import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/register.dart';
// import 'package:myapp/page-1/register-FJ3.dart';
// import 'package:myapp/page-1/profile.dart';
// import 'package:myapp/page-1/frame-1.dart';
// import 'package:myapp/page-1/frame-3.dart';
// import 'package:myapp/page-1/logged-out.dart';
// import 'package:myapp/page-1/discover.dart';
// import 'package:myapp/page-1/clair.dart';
// import 'package:myapp/page-1/sombre.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'Flutter',
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyAppCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
		home: Scaffold(
		body: SingleChildScrollView(
			child: Scene(),
		),
		),
	);
	}
}
