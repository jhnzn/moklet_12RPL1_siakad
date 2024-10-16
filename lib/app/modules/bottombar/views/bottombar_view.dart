import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siakad/app/modules/TahunAjaran/views/tahun_ajaran_view.dart';
import '../controllers/bottombar_controller.dart';
import '../../home/views/home_view.dart';
import '../../mapel/views/mapel_view.dart';
import '../../akun/views/akun_view.dart';

class BottombarView extends GetView<BottombarController> {
  const BottombarView({Key? key});
  @override
  Widget build(BuildContext context) {
    final initialIndex = Get.arguments != null ? Get.arguments['index'] : 0;
	controller.changeIndex(initialIndex);

    return GetBuilder<BottombarController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                MapelView(),
                TahunAjaranView(),
                AkunView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.red,
            onTap: controller.changeIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              controller.BotBar(
                ikon: Icons.home,
                label: 'Home',
              ),
              controller.BotBar(
                ikon: Icons.calendar_month,
                label: 'Mapel',
              ),
              controller.BotBar(
                ikon: Icons.data_saver_off,
                label: 'Tahun Ajaran',
              ),
              controller.BotBar(
                ikon: Icons.person,
                label: 'Akun',
              ),
            ],
          ),
        );
      },
    );
  }
}
