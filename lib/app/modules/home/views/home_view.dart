import 'package:bookkursi/app/data/widget/sidebar.dart';
import 'package:bookkursi/app/modules/splash/views/splash_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: 205,
        child: new Drawer(
          child: SideBar(active: 1),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: AppBar(
            leading: Icon(null),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Image.asset(
              'assets/logos/logo1.png',
              width: 117,
              height: 54,
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  child: InkWell(
                    onTap: () => _scaffoldKey.currentState!.openDrawer(),
                    child: Image.asset(
                      'assets/icons/hamburger-dark.png',
                      width: 41,
                      height: 41,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          controller.scrollListener(scrollInfo);
          return true;
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-home.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: controller.count.value == 0
                    ? 80
                    : -controller.count.value + 80,
                child: Container(
                  child: Image.asset(
                    'assets/images/person1-home.png',
                    width: 395,
                    height: 230,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Obx(
                () => Positioned(
                  top: controller.count.value == 0
                      ? 230
                      : -controller.count.value + 230,
                  left:
                      controller.count.value == 0 ? 0 : -controller.count.value,
                  child: Container(
                    child: Image.asset(
                      'assets/images/chair-home.png',
                      width: 395,
                      height: 230,
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Positioned(
                  top: controller.count.value == 0
                      ? 265
                      : -controller.count.value + 265,
                  right:
                      controller.count.value == 0 ? 0 : -controller.count.value,
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/person2-home.png',
                        width: 242,
                        height: 325,
                        alignment: Alignment.centerRight,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              ListView(
                children: [
                  // welcome
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.7,
                          ),
                          Obx(
                            () => Text(
                              'Welcome to Office Booking',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(
                                  controller.opc.value,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Obx(
                            () => Text(
                              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(
                                  controller.opc.value,
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => Image.asset(
                              'assets/icons/line-bottom.png',
                              width: 13,
                              height: 13,
                              alignment: Alignment.centerRight,
                              color: Colors.black.withOpacity(
                                controller.opc.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //get ready
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg-splash.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 33,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Are You ready?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Text(
                              ' Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () => Get.toNamed('/booking'),
                              child: Text('Booking Now'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color(0xffFBC663),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    // side: BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
