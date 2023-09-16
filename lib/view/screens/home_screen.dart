import 'package:bitcoin_price/app_constants/constants.dart';
import 'package:bitcoin_price/controllers/home_screen_controller.dart';
import 'package:bitcoin_price/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.find<HomeScreenController>();

    return Obx(
      () => Scaffold(
        backgroundColor: Constants.secondaryColor,
        body: controller.loading.value == true
            ? Center(
                child: CircularProgressIndicator(color: Constants.primaryColor),
              )
            : Column(
                children: [
                  SizedBox(height: 7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/bitcoin_image.png',
                        height: 20.h,
                        width: 20.h,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    controller
                        .currencies[controller.selectedCurrency.value].rate!,
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 6.t,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50.h,
                    width: 100.w,
                    child: CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      itemExtent: 32,
                      // This sets the initial item.
                      scrollController: FixedExtentScrollController(
                        initialItem: controller.selectedCurrency.value,
                      ),
                      // This is called when selected item is changed.
                      onSelectedItemChanged: (int selectedItem) {
                        controller.selectedCurrency.value = selectedItem;
                      },
                      children: List<Widget>.generate(
                        controller.currencies.length,
                        (int index) {
                          return Center(
                            child: Text(controller.currencies[index].code!),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
