import 'package:bitcoin_price/controllers/home_screen_controller.dart';
import 'package:bitcoin_price/utils/size_config.dart';
import 'package:bitcoin_price/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());

    return Container(
      color: Colors.white,
      child: Center(
        child: Material(
          elevation: 20,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return OrientationBuilder(
                  builder: (BuildContext context2, Orientation orientation) {
                SizeConfig.init(constraints, orientation);

                return GetMaterialApp(
                  title: "Bitcoin Price Tracker",
                  useInheritedMediaQuery: true,
                  debugShowCheckedModeBanner: false,
                  defaultTransition: GetPlatform.isIOS
                      ? Transition.cupertino
                      : Transition.rightToLeft,
                  home: const HomeScreen(),
                );
              });
            }),
          ),
        ),
      ),
    );
  }
}
