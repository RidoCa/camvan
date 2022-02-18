import 'package:draggable_fab/draggable_fab.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:bookkursi/app/data/widget/sidebar.dart';

import '../controllers/booking_controller.dart';
import 'bookinfo_view.dart';

class BookingView extends GetView<BookingController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var itemList = [
    "A",
    "B",
    "C",
    "D",
    "A",
    "B",
    "C",
    "D",
  ];

  @override
  Widget build(BuildContext context) {
    // return BookinfoView();
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: 205,
        child: new Drawer(
          child: SideBar(active: 2),
        ),
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton(
          onPressed: () {
            showMaterialModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    25.0,
                  ),
                ),
              ),
              builder: (BuildContext context) {
                return Container(
                  height: 368,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        child: dropdownLantai(
                          controller: controller,
                          paddingTop: 32,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      //form date
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17,
                        ),
                        child: Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xffD8DDE8),
                            // border: Border.all(
                            //   color: Colors.black26,
                            // ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                            ),
                            child: InkWell(
                              onTap: () {
                                //modal date
                                showMaterialModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(
                                          25.0,
                                        ),
                                      ),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 368,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 30,
                                              ),
                                              child: datepicker(
                                                controller: controller,
                                              ),
                                            ),
                                            //button continue
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 17,
                                              ),
                                              child: Container(
                                                height: 48,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff6884EC),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(14),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 32,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () => Get.back(),
                                                    child: Center(
                                                      child: Text(
                                                        'Continue Booking',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Obx(
                                () => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    controller.tmpdate == ''
                                        ? Text(
                                            'Select Date',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : Text(
                                            controller.tmpdate.value,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                    Image.asset(
                                      'assets/icons/icon-calendar-dd.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //info
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 22,
                            ),
                            Text(
                              'Book a Seat',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF4B3D70),
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Please, choose the best available seats in office. If you want change the seats, choose either of the available seats in the sitting plan.',
                                  ),
                                  TextSpan(
                                    text: ' View Office Plan',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showMaterialModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(
                                                25.0,
                                              ),
                                            ),
                                          ),
                                          context: context,
                                          builder: (context) => Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                1.1,
                                            child: DefaultTextStyle(
                                              style: TextStyle(
                                                color: Color(0XFF4B3D70),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 24,
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        'assets/icons/tabs-modal.png',
                                                        width: 32,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 20,
                                                      horizontal: 17,
                                                    ),
                                                    child: Text(
                                                      'Office Plan',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            Color(0XFF4B3D70),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 10,
                                                      horizontal: 17,
                                                    ),
                                                    child: Container(
                                                      height: 48,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffD8DDE8),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(14),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 32,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                              'assets/icons/icon-book-dd.png',
                                                            ),
                                                            SizedBox(
                                                              width: 12,
                                                            ),
                                                            Text(
                                                              'Choose The Room',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            Icon(
                                                              Icons
                                                                  .arrow_drop_down_sharp,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //list image
                                                  Expanded(
                                                    flex: 1,
                                                    child:
                                                        SingleChildScrollView(
                                                      controller: null,
                                                      child: Column(
                                                        children: [
                                                          listimageroom(),
                                                          listimageroom(),
                                                          listimageroom(),
                                                          listimageroom(),
                                                          listimageroom(),
                                                          listimageroom(),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    style: TextStyle(
                                      color: Color(
                                        0xFF6F88D2,
                                      ),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      //button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17,
                        ),
                        child: Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xff6884EC),
                            // border: Border.all(
                            //   color: Colors.black26,
                            // ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                            ),
                            child: InkWell(
                              onTap: () => Get.to(
                                BookinfoView(),
                              ),
                              child: Center(
                                child: Text(
                                  'Booking Room',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      //back
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17,
                        ),
                        child: InkWell(
                          onTap: () => Get.toNamed('/home'),
                          child: Text(
                            'Back to Home',
                            style: TextStyle(
                              fontSize: 14,
                              // color: Color(
                              //   0XFF6F88D2,
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).then((value) {
              controller.selectedDate.value = '';
              controller.tmpdate.value = '';
            });
          },
          child: Icon(Icons.add),
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
                      'assets/icons/hamburger-light.png',
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
      body: Container(
        margin: EdgeInsets.only(
          top: 110,
        ),
        child: SingleChildScrollView(
          controller: null,
          child: Center(
            child: Column(
              children: [
                listOfWidgets(itemList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class datepicker extends StatelessWidget {
  final BookingController controller;
  const datepicker({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      headerHeight: 50,
      headerStyle: DateRangePickerHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: TextStyle(
          fontSize: 20,
          color: Color(0XFF4B3D70),
          fontWeight: FontWeight.bold,
        ),
      ),
      onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
        controller.onSelectionChanged(dateRangePickerSelectionChangedArgs);
      },
      initialSelectedDate: controller.selectedDate == ''
          ? null
          : DateTime.parse(
              controller.selectedDate.toString(),
            ),
      minDate: DateTime.now(),
      view: DateRangePickerView.month,
      showNavigationArrow: true,
      selectionColor: Color(0XFF6884EC),
      todayHighlightColor: Color(0XFFD7DFFB),
      selectionMode: DateRangePickerSelectionMode.single,
    );
  }
}

class listimageroom extends StatelessWidget {
  const listimageroom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 17,
      ),
      child: Column(
        children: [
          //image
          Container(
            height: 183,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://strgonelabsprod.blob.core.windows.net/cms/post/tata-ruang-kantor-1621408070745809262.webp',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh. ',
          ),
        ],
      ),
    );
  }
}

class dropdownLantai extends StatelessWidget {
  dropdownLantai({
    Key? key,
    required this.paddingTop,
    required this.controller,
  }) : super(key: key);

  final double paddingTop;
  final BookingController controller;

  final lantaiList = [
    {
      "code": "A15",
      "name": "Room A 15th Floor",
    },
    {
      "code": "B15",
      "name": "Room B 15th Floor",
    },
    {
      "code": "C15",
      "name": "Room C 15th Floor",
    },
    {
      "code": "D15",
      "name": "Room D 15th Floor",
    },
    {
      "code": "E15",
      "name": "Room E 15th Floor",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: paddingTop,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
        ),
        child: Column(
          children: [
            Theme(
              data: ThemeData(
                textTheme: TextTheme(
                  subtitle1: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child: DropdownSearch<Map<String, dynamic>>(
                dropdownSearchDecoration: new InputDecoration(
                  isCollapsed: true,
                  isDense: true, // Added this
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                  ),
                  fillColor: Color(
                    0xffD8DDE8,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: Align(
                    widthFactor: 3.0,
                    heightFactor: 1.0,
                    child: Image.asset(
                      'assets/icons/icon-book-dd.png',
                    ),
                  ),
                ),
                mode: Mode.MENU,
                items: lantaiList,
                hint: 'Choose The Room',
                onChanged: (value) {
                  if (value != null) {
                    controller.room.value = value['code'];
                  } else {
                    controller.room.value = '';
                  }
                },
                showClearButton: true,
                itemAsString: (item) => "${item!['name']}",
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                popupItemBuilder: (context, item, isSelected) {
                  return Container(
                    height: 50,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    color: controller.room.value == item['code']
                        ? Color(0XFF6884EC)
                        : Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${item['name']}",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listOfWidgets(List<String> item) {
  List<Widget> list = [];
  for (var i = 0; i < item.length * 30; i++) {
    list.add(
      Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Color(0XFFD7DFFB),
          border: Border.all(
            width: 2,
            color: Color(0xff6884EC),
          ),
        ),
        child: Center(
          child: Text(''
              // item[i],
              ),
        ),
      ),
    );
  }
  return Wrap(
      spacing: 2.0, // gap between adjacent chips
      runSpacing: 2.0, // gap between lines
      children: list);
}
