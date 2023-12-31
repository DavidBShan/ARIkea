import 'package:arikea/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription> allCameras = [];
Future<void> main() async
{
  try
  {
    WidgetsFlutterBinding.ensureInitialized();
    allCameras = await availableCameras();
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyByw0kM5uMo38gA8489CH66-3aby-fwHqk',
            // Replace with API key from google-services.json
            appId: '1:884083908104:android:961b03efd651c6c38cfbbd',
            // Replace with App ID from google-services.json
            messagingSenderId: '884083908104',
            // Replace with Messaging Sender ID from google-services.json
            projectId: 'ar-ikea-app-36f7d',
            // Replace with Project ID from google-services.json
            storageBucket: 'ar-ikea-app-36f7d.appspot.com', // Replace with Storage Bucket from google-services.json
          )
      );
    }
  }
  catch (errorMsg)
  {
    print("Error:: $errorMsg");
  }

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CS Club AR Test App',
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}