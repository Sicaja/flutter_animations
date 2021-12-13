import 'package:flutter/material.dart';
import 'package:flutter_animations/controllers/draggablescrollsheetchallenge_controller.dart';
import 'package:get/get.dart';

class DraggableScrollSheetChallenge extends StatelessWidget {
  const DraggableScrollSheetChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DraggableScrollSheetChallengeController>(
        init: DraggableScrollSheetChallengeController(),
        initState: (_) {},
        builder: (draggable) {
          return SafeArea(
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Image.asset(
                    "assets/mapa.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.menu,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                const ScrollableSheetCustom(),
                Positioned(
                  left: 0,
                  right: 0,
                  top: draggable.percent,
                  child: Opacity(
                    opacity: draggable.percentOpacity,
                    child: SearchDestination(
                      key: draggable.searchHeaderKey,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ScrollableSheetCustom extends StatelessWidget {
  const ScrollableSheetCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DraggableScrollSheetChallengeController>(
      builder: (draggable) {
        return NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            //print("notification extend ${notification.extent}");
            draggable.calcHideHeader(notification.extent);
            return true;
          },
          child: DraggableScrollableSheet(
            maxChildSize: 0.9,
            minChildSize: 0.4,
            initialChildSize: 0.4,
            builder: (context, controller) {
              return Material(
                color: Colors.white,
                elevation: 10,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey,
                            width: 50.0,
                            height: 2.0,
                          ),
                        ),
                      ),
                      const Text(
                        "Me alegro de verte!",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        "A donde vas?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          controller: controller,
                          itemBuilder: (context, index) => Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: const Icon(
                                  Icons.location_on_outlined,
                                ),
                                title: Text("Guatemala, Guatemala City $index"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class SearchDestination extends StatelessWidget {
  const SearchDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(
          20.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey.shade700,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Elegir destino",
                        style: Get.textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "4ta. Avenida 9-36, zona 3 Guatemala",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "A donde vamos?",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
