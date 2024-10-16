import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siakad/app/modules/TahunAjaran/controllers/tahun_ajaran_controller.dart';

class TahunAjaranView extends GetView<TahunController> {
  const TahunAjaranView({super.key});
  @override
  Widget build(BuildContext context) {
	return Scaffold(
  	appBar: AppBar(
    	title: const Text('Tahun Ajaran'),
    	centerTitle: true,
  	),
  	body: Padding(
    	padding: const EdgeInsets.all(8.0),
    	child: Obx(
      	() {
        	if (!controller.isLoaded.value) {
          	return Center(child: CircularProgressIndicator());
        	}

        	if (controller.tahun.value.data == null || controller.tahun.value.data!.isEmpty) {
          	return Center(child: Text('Data kosong.'));
        	}

        	return ListView.builder(
          	itemCount: controller.tahun.value.data?.length ?? 0,
          	itemBuilder: (context, index) {
            	final element = controller.tahun.value.data![index];
            	return Card(
              	margin: const EdgeInsets.symmetric(vertical: 8.0),
              	elevation: 5,
              	child: Padding(
                	padding: const EdgeInsets.all(16.0),
                	child: Column(
                  	crossAxisAlignment: CrossAxisAlignment.start,
                  	children: [
                    	Text(
                      	'${element.name ?? 'N/A'}',
                      	style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    	),
                    	                  	SizedBox(height: 8),
                    	Text(
                      	'Last Update: ${element.sLastUpdate ?? 'N/A'}',
                      	style: TextStyle(fontSize: 14),
                    	),
                    	SizedBox(height: 8),
                      Text(
                      	'Display Name: ${element.displayName ?? 'N/A'}',
                      	style: TextStyle(fontSize: 14),
                    	),
                  	],
                	),
              	),
            	);
          	},
        	);
      	},
    	),
  	),
  	floatingActionButton: Column(
    	mainAxisAlignment: MainAxisAlignment.end,
    	crossAxisAlignment: CrossAxisAlignment.end,
    	children: [
      	FloatingActionButton(
        	onPressed: () {
          	controller.getTahunAjaran();
        	},
        	child: Icon(Icons.refresh),
        	backgroundColor: Colors.red,
      	),
      	SizedBox(height: 10),
    	],
  	),
  	floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
	);
  }
}
