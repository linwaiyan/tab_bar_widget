import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_bar_widget/controller/c_tabbar.dart';

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PriceTabController());
    PriceTabController priceTabController = Get.find();
    priceTabController.currentTab.value = PriceTab.priceTab;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  ),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: tabItem(
                            text: 'Tab a',
                            xSelected: priceTabController.currentTab.value ==
                                    PriceTab.priceTab
                                ? true
                                : false,
                            onTapFunction: () {
                              priceTabController.currentTab.value =
                                  PriceTab.priceTab;
                              priceTabController.onClickTab();
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.grey.withOpacity(0.4)))),
                            child: tabItem(
                              text: 'Tab b',
                              xSelected: priceTabController.currentTab.value ==
                                      PriceTab.discountTab
                                  ? true
                                  : false,
                              onTapFunction: () {
                                priceTabController.currentTab.value =
                                    PriceTab.discountTab;
                                priceTabController.onClickTab();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Obx(() => showTabPanel()))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showTabPanel() {
    PriceTabController priceTabController = Get.find();
    switch (priceTabController.currentTab.value) {
      case PriceTab.priceTab:
        return pricePanel();
      case PriceTab.discountTab:
        return discountPanel();
    }
  }

  Widget tabItem(
      {required String text,
      required bool xSelected,
      required void Function()? onTapFunction}) {
    // PriceTabController priceTabController = Get.find();

    return GestureDetector(
      onTap: onTapFunction,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color:
                  xSelected ? Colors.grey.withOpacity(0.2) : Colors.transparent,
              // borderRadius:
              //     priceTabController.currentTab.value == PriceTab.priceTab
              //         ? const BorderRadius.only(topLeft: Radius.circular(8))
              //         : const BorderRadius.only(topRight: Radius.circular(8)),
            ),
            width: Get.width,
            height: Get.height * 0.05,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: xSelected ? FontWeight.bold : FontWeight.w400,
                color: xSelected ? Colors.black : Colors.grey,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.002,
            width: Get.width * 0.05,
            decoration: BoxDecoration(
                color: xSelected ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }

  Widget pricePanel() {
    return const Center(
      child: Text('a'),
    );
  }

  Widget discountPanel() {
    return const Center(
      child: Text('b'),
    );
  }
}
