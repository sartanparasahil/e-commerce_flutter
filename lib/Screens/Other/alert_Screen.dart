import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  Future<bool> _showExitConfirmationDialog() async {
    return await showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) => AlertDialog(
        title: const Text("Exit"),
        content: const Text("Are you sure you want to exit?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Stay in the app
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Exit the app
            },
            child: const Text("Exit"),
          ),
        ],
      ),
    ) ??
        false; // Return false if dialog is dismissed
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show the exit confirmation dialog when back button is pressed
        final shouldExit = await _showExitConfirmationDialog();
        return shouldExit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Alert Screen"),
        ),
        body: const Center(
          child: Text("Press the back button to see the alert."),
        ),
      ),
    );
  }
}

