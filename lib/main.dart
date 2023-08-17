import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Counter/count_example.dart';
import 'package:provider_state_management/Counter/count_provider.dart';
import 'package:provider_state_management/favourite_item_provider.dart';
import 'package:provider_state_management/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountProvider>(create: (_) => CountProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 46, 144, 230)),
            //useMaterial3: true,
          ),
          home: const CountExample()),
    );
  }
}
