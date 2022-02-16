import 'package:bt_football/resources/dimens.dart';
import 'package:bt_football/resources/strings.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
          border: Border.all(color: Colors.red),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.errorLabel,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                width: 150.0,
                height: 150.0,
                child: const Icon(Icons.error, size: 100.0, color: Colors.red),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
