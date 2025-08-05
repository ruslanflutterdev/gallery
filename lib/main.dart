import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/core/routers.dart';
import 'package:gallery/screens/main_screen.dart';
import 'package:gallery/screens/pictures_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qaevvaaiitwghwllclsw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFhZXZ2YWFpaXR3Z2h3bGxjbHN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3OTg3MTUsImV4cCI6MjA2OTM3NDcxNX0.RdTKcKDzWhhSbrunp5PqixoFmDtYK1oRTE14ye_nM8Y',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Gallery',
        initialRoute: Routers.home,
        routes: {
          Routers.home: (context) => MainScreen(),
          Routers.createPicture: (context) => PicturesScreen(),
        },
      ),
    );
  }
}
