import 'package:flutter/material.dart';
import 'package:flutter_animations/routes/routes.dart';
import 'package:flutter_animations/routes/routes_values.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: RoutesValues.home,
      getPages: Routes.listRoutes,
    );
  }
}
