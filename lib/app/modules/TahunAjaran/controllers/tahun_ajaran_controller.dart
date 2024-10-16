import 'package:get/get.dart';
import 'package:siakad/app/data/models/tahun_ajaran.dart';
import 'package:siakad/app/data/repositories/repository_tahun.dart';

class TahunController extends GetxController {
  //TODO: Implement MapelController

  final count = 0.obs;
  Rx<bool> isLoaded = false.obs;
Rx<ModelTahunAjaran> tahun = ModelTahunAjaran().obs;

void getTahunAjaran() {
	isLoaded(false);
	RepositoryTahun().loadTahun().then((ModelTahunAjaran response) {
  	tahun(response);
  	isLoaded(true);
	});
  }

  @override
  void onInit() {
	super.onInit();
	getTahunAjaran();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
