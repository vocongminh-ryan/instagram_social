import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/feed/domain/usecases/get_feed.dart';
import '../features/feed/presentation/cubit/feed_cubit.dart';
import '../features/feed/presentation/pages/feed_page.dart';

class InstagramSocialApp extends StatelessWidget {
  const InstagramSocialApp({super.key, required this.getFeed});

  final GetFeed getFeed;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => FeedCubit(getFeed)..loadFeed(),
        child: MaterialApp(
          title: 'Instagram Social',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            useMaterial3: true,
          ),
          home: const FeedPage(),
        ),
      );
}
