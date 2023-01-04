import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_begin/home_screen.dart';
import 'package:riverpod_begin/logger_riverpod.dart';
import 'package:riverpod_begin/user.dart';

//Providers
// Provider

// final nameProvider = Provider<String>((ref) {
//   return 'Imrul Emon-Consumer Builder';
// });

// final nameProvider = StateProvider<String?>((ref) => null);

// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(
//     User(
//       name: '',
//       age: 0,
//     ),
//   ),
// );

final fatchUserProvider = FutureProvider.family.autoDispose(
  (ref, String input) {
    // return UserRepository().fetchUserData();
    final userRepository = ref.watch(userRepositoryProvider);
    return userRepository.fetchUserData(input);
  },
);

final streamProvider = StreamProvider(((ref) async* {
  yield [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
}));

void main() {
  runApp(ProviderScope(
    observers: [LoggerRiverpod()],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
