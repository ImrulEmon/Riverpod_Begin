import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_begin/main.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  String userNo = '1';

  @override
  Widget build(BuildContext context) {
    return ref.watch(fatchUserProvider(userNo)).when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(data.username),
          ),
          body: Column(
            children: [
              TextField(
                  onSubmitted: (value) => setState(() {
                        userNo = value;
                      })),
              // const TextField(
              //     // onSubmitted: (value) => onSubmitAge(ref, value),
              //     ),
              Center(
                child: Column(
                  children: [
                    Text(
                      data.email,
                    ),
                    Text(data.name),
                    Text(data.website),
                  ],
                ),
              )
            ],
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(
              error.toString(),
            ),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

// class HomePage extends ConsumerWidget {
//  const HomePage({super.key});

//   void onSubmit(WidgetRef ref, String value) {
//     // ref.read(nameProvider.notifier).update((state) => value);
//     ref.read(userProvider.notifier).updateName(value);
//   }

//   void onSubmitAge(WidgetRef ref, String value) {
//     ref.read(userProvider.notifier).updateAge(int.parse(value));
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final name = ref.watch(nameProvider) ?? '';
//     //final user = ref.watch(userProvider);
//     //final user = ref.watch(userProvider.select((value) => value.name));

//     return ref.watch(fatchUserProvider()).when(
//       data: (data) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(data.username),
//           ),
//           body: Column(
//             children: [
//               // const TextField(
//               //     //onSubmitted: (value) => onSubmit(ref, value),
//               //     ),
//               // const TextField(
//               //     // onSubmitted: (value) => onSubmitAge(ref, value),
//               //     ),
//               Center(
//                 child: Column(
//                   children: [
//                     Text(
//                       data.email,
//                     ),
//                     Text(data.name),
//                     Text(data.website),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//       error: (Object error, StackTrace stackTrace) {
//         return Scaffold(
//           body: Center(
//             child: Text(
//               error.toString(),
//             ),
//           ),
//         );
//       },
//       loading: () {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );

//     // return ref.watch(streamProvider).when(data: (data) {
//     //   return Scaffold(
//     //     body: Center(child: Text(data.toString())),
//     //   );
//     // }, error: (error, stackTrace) {
//     //   return Scaffold(
//     //     body: Center(
//     //       child: Text(
//     //         error.toString(),
//     //       ),
//     //     ),
//     //   );
//     // }, loading: () {
//     //   return const Center(
//     //     child: CircularProgressIndicator(),
//     //   );
//     // });
//   }
// }
