import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/models/model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List imagelist = [
    {"id": 1, "image_path": 'assets/images/advertisement1.jpeg'},
    {"id": 2, "image_path": 'assets/images/advertisement2.jpeg'},
    {"id": 3, "image_path": 'assets/images/advertisement3.jpeg'},
    {"id": 4, "image_path": 'assets/images/advertisement4.jpeg'},
  ];
  final CarouselController carouselController = CarouselController();
  int curentIndex = 0;

  final List photos = [
    Data(
        image: 'assets/images/u-earn.png',
        text: "UEarn",
        color: Colors.black,
        textcolor: Colors.white),
    Data(
        image: "assets/images/u-sell.png",
        text: "USell",
        color: const Color.fromARGB(255, 233, 87, 3),
        textcolor: Colors.white),
    Data(
        image: "assets/images/tipping.png",
        text: "Tipping",
        color: Colors.white,
        textcolor: Colors.black),
    Data(
        image: "assets/images/u-buy.png",
        text: "UBuy",
        color: Colors.white,
        textcolor: Colors.black),
    Data(
        image: "assets/images/channel-a-doctor.png",
        text: "Channel a Doctor",
        color: Colors.black,
        textcolor: Colors.white),
    Data(
        image: "assets/images/banking.png",
        text: "Banking",
        color: const Color.fromARGB(255, 14, 89, 195),
        textcolor: Colors.white),
    Data(
        image: "assets/images/utm.png",
        text: "UTM",
        color: const Color.fromARGB(255, 233, 87, 3),
        textcolor: Colors.white),
    Data(
        image: "assets/images/mobile-payments.png",
        text: "Mobile Payments",
        color: const Color.fromARGB(255, 14, 89, 195),
        textcolor: Colors.white),
    Data(
        image: "assets/images/pay-bills.png",
        text: "Pay Bills",
        color: Colors.white,
        textcolor: Colors.black),
    Data(
        image: "assets/images/request-money.png",
        text: "Request Money",
        color: Colors.black,
        textcolor: Colors.white),
    Data(
        image: "assets/images/fund-transfer.png",
        text: "Fund Transfer",
        color: Colors.white,
        textcolor: Colors.black),
    Data(
        image: "assets/images/credit-card-settlements.png",
        text: "Credit Card \n Settlements",
        color: const Color.fromARGB(255, 233, 87, 3),
        textcolor: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: const Image(
          image: AssetImage('assets/images/upay-logo-white.png'),
          width: 40,
          height: 40,
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/images/transaction-history.png',
                width: 28,
                height: 29,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Center(
            child: Icon(
              Icons.notifications_active,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                const Text(
                  'Good Morning!!',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  width: 120,
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    'assets/images/coin.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                const Text(
                  'LKR 440.00',
                  style: TextStyle(
                      color: Color.fromARGB(255, 219, 212, 212), fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          print(curentIndex);
                        },
                        child: CarouselSlider(
                          items: imagelist
                              .map(
                                (item) => Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              )
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 2,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                curentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                flex: 6,
                child: LayoutBuilder(builder: (context, co) {
                  return GridView.builder(
                    itemCount: photos.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: co.maxHeight * 0.25,
                    ), // childAspectRatio: 1.4),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: photos[index].color,
                          // image: DecorationImage(
                          //   image: AssetImage(photos[index].image),
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              photos[index].image,
                              width: 35,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              photos[index].text,
                              style: TextStyle(
                                color: photos[index].textcolor,
                              ),
                            ),
                          ],
                        ),
                        // child: Image.asset(photos[index].image),
                      );
                    },
                  );
                })),
            // GridView.builder(
            //   itemCount: photos.length,
            //   // physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 3,
            //     mainAxisExtent: cons.maxHeight * 0.133,
            //   ), // childAspectRatio: 1.4),
            //   itemBuilder: (BuildContext context, int index) {
            //     return Container(
            //       // padding: const EdgeInsets.all(8.0),
            //       decoration: BoxDecoration(
            //         color: photos[index].color,
            //         // image: DecorationImage(
            //         //   image: AssetImage(photos[index].image),
            //         //   fit: BoxFit.fill,
            //         // ),
            //       ),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Image.asset(
            //             photos[index].image,
            //             width: 35,
            //           ),
            //           const SizedBox(height: 6),
            //           Text(
            //             photos[index].text,
            //             style: TextStyle(
            //               color: photos[index].textcolor,
            //             ),
            //           ),
            //         ],
            //       ),
            //       // child: Image.asset(photos[index].image),
            //     );
            //   },
            // ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 233, 87, 3),
                      // width: 120,
                      // height: 60,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Image.asset(
                                'assets/images/_home-button.png',
                                width: 30,
                                // height: 30,
                              ),
                            ),
                            const Text(
                              "Home",
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 35, 16, 77),
                      // width: 130,
                      // height: 60,
                      child: Image.asset(
                        'assets/images/_lankaclear-qr-button.png',
                        // height: 35,
                        // width: 35,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 14, 89, 195),
                      // width: 132.6,
                      // height: 60,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/_support-button.png',
                              width: 30,
                              // height: 30,
                            ),
                            const Text(
                              "Support",
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
