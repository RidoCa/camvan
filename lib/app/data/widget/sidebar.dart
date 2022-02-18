import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBar extends StatelessWidget {
  final int active;
  const SideBar({
    Key? key,
    required this.active,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      child: new Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Image.asset(
              'assets/logos/logo1.png',
              width: 117,
              height: 54,
            ),
            SizedBox(
              height: 57,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: InkWell(
                onTap: () => Get.toNamed(
                  '/home',
                ),
                child: Row(
                  children: [
                    active == 1
                        ? Row(
                            children: [
                              Image.asset(
                                'assets/icons/home-active.png',
                                width: 28,
                                height: 28,
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(
                                    0xFF6884EC,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Image.asset(
                                'assets/icons/home-nonactive.png',
                                width: 28,
                                height: 28,
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 20,
              ),
              child: InkWell(
                onTap: () => Get.toNamed(
                  '/booking',
                ),
                child: Row(
                  children: [
                    active == 2
                        ? Row(
                            children: [
                              Image.asset(
                                'assets/icons/seat-active.png',
                                width: 28,
                                height: 28,
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text(
                                'Book a Seat',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(
                                    0xFF6884EC,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Image.asset(
                                'assets/icons/seat-nonactive.png',
                                width: 28,
                                height: 28,
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text(
                                'Book a Seat',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 20,
              ),
              child: InkWell(
                onTap: () => Get.toNamed(
                  '/detailbooking',
                ),
                child: Row(
                  children: [
                    active == 3
                        ? Row(
                            children: [
                              Image.asset(
                                'assets/icons/debook-active.png',
                                width: 28,
                                height: 28,
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text(
                                'Detail Booking',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(
                                    0xFF6884EC,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Image.asset(
                                'assets/icons/debook-nonactive.png',
                                width: 28,
                                height: 28,
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text(
                                'Detail Booking',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 20,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 21.5,
                    backgroundColor: Color(
                      0XFF6884EC,
                    ),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          "https://png.pngtree.com/png-vector/20190224/ourlarge/pngtree-vector-avatar-icon-png-image_699747.jpg"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail Booking',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(
                              0xFF6884EC,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
