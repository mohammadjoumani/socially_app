import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/features/generic/presentation/main/view/main_app.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: AppSize.s2,
    );
  }
}

void fullScreenLoading() {
  final context = navigatorKey!.currentState!.context;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const PopScope(
      canPop: false,
      child: Center(child: CustomLoading()),
    ),
  );
}
