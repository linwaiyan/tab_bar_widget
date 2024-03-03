import 'package:get/get.dart';

enum PriceTab { priceTab, discountTab }

class PriceTabController extends GetxController {
  final Rx<PriceTab> currentTab = PriceTab.priceTab.obs;

  onClickTab() {
    update();
  }
}
