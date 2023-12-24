import 'dart:isolate';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class OffLoaderIsolates {
  // Isolate function
  void isolateFunction(SendPort sendPort) async {
    // Your time-consuming code goes here
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Send the result back to the main thread
    sendPort.send("Isolate completed!");
  }
}
