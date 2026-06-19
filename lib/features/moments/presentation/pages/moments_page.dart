import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/moments_controller.dart';

class MomentsPage extends StatefulWidget {
  const MomentsPage({super.key});

  @override
  State<MomentsPage> createState() => _MomentsPageState();
}

class _MomentsPageState extends State<MomentsPage> {
  late final MomentsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<MomentsController>();
    Future.microtask(controller.loadMoments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore Moments')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.errorMessage.value,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: controller.loadMoments,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (controller.moments.isEmpty) {
          return const Center(child: Text('No moments found.'));
        }

        return RefreshIndicator(
          onRefresh: controller.loadMoments,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.moments.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (_, index) {
              final moment = controller.moments[index];
              return Card(
                child: ListTile(
                  title: Text(moment.title),
                  subtitle: Text(moment.description),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
