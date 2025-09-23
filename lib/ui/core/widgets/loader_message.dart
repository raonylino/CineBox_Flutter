import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

mixin LoaderAndMessage<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Center(
          child: Center(
            child: LoadingAnimationWidget.inkDrop(
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

  void showErrorSnackbar(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  void showSuccessSnackbar(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

  void showInfoSnackbar(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
      ),
    );
  }
}
