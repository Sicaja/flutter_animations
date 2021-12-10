import 'package:flutter/material.dart';
import 'package:flutter_animations/routes/routes_values.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            stretch: true,
            centerTitle: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text("Sica's Animations"),
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
              background: Image.asset(
                "assets/f-image.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  ButtonCustom(
                    title: "Animation Controller",
                    colorButton: Colors.lightBlue,
                    onPressed: () {
                      Get.toNamed(
                        RoutesValues.animationBuilder,
                      );
                    },
                  ),
                  ButtonCustom(
                    title: "Animation Transform",
                    colorButton: Colors.lightBlue,
                    onPressed: () {
                      Get.toNamed(
                        RoutesValues.animationTransform,
                      );
                    },
                  ),
                  ButtonCustom(
                    title: "Animation Transform 3D",
                    colorButton: Colors.lightBlue,
                    onPressed: () {
                      Get.toNamed(
                        RoutesValues.animationTransform3D,
                      );
                    },
                  ),
                  ButtonCustom(
                    title: "Page view transform",
                    colorButton: Colors.lightBlue,
                    onPressed: () {
                      Get.toNamed(
                        RoutesValues.pageviewtransform,
                      );
                    },
                  ),
                  ButtonCustom(
                    title: "Scroll animation",
                    colorButton: Colors.lightBlue,
                    onPressed: () {
                      Get.toNamed(
                        RoutesValues.scrollanimation,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key? key,
    required this.title,
    this.onPressed,
    this.colorButton,
  }) : super(key: key);

  final String title;
  final void Function()? onPressed;
  final Color? colorButton;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colorButton ?? Colors.blue,
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
