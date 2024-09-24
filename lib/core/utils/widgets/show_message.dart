import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

enum MessageType { error, success, info }

extension SnakBaeEextension on BuildContext {
  void showMessage(String message, {MessageType messageType = MessageType.error}) {
    switch (messageType) {
      case MessageType.error:
        showTopSnackBar(
          Overlay.of(this),
          CustomSnackBar.error(
            message: message,
          ),
        );
        break;
      case MessageType.success:
        showTopSnackBar(
          Overlay.of(this),
          CustomSnackBar.success(
            message: message,
          ),
        );
        break;
      case MessageType.info:
        showTopSnackBar(
          Overlay.of(this),
          CustomSnackBar.info(
            message: message,
          ),
        );
        break;
    }
  }
}
