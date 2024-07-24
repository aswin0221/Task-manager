import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/task_providers.dart';
import 'package:task_manager/screens/home_page.dart';

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
        ChangeNotifierProvider(create: (context) => TaskProviders()),
      ],
      child: MaterialApp(
        title: 'Task Manager',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: const Color(0xff1b1b1b),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff1b1b1b),
              iconTheme: IconThemeData(color: Colors.white)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
