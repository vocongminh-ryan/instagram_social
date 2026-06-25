import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/features/feed/data/repositories/feed_repository.dart';
import '../ui/features/feed/presentation/view_models/feed_view_model.dart';
import '../ui/features/feed/presentation/views/feed_page.dart';

class InstagramSocialApp extends StatelessWidget {
  const InstagramSocialApp({super.key, required this.feedRepository});

  final FeedRepository feedRepository;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => FeedViewModel(feedRepository)..loadFeed(),
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
