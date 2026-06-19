import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/bindings/app_bindings.dart';
import 'features/moments/presentation/pages/moments_page.dart';

void main() {
  runApp(const ExploreMomentsApp());
}

class ExploreMomentsApp extends StatelessWidget {
  const ExploreMomentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Explore Moments',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MomentsPage(),
    );
  }
}
