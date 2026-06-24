import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_models/feed_view_model.dart';

/// View: renders state and forwards user actions to [FeedViewModel].
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Instagram Social')),
    body: BlocBuilder<FeedViewModel, FeedState>(
      builder: (context, state) {
        if (state.status == FeedStatus.loading ||
            state.status == FeedStatus.initial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == FeedStatus.failure) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.errorMessage!),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: context.read<FeedViewModel>().loadFeed,
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: context.read<FeedViewModel>().refreshFeed,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.posts.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (_, index) {
              final post = state.posts[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(post.author[0].toUpperCase()),
                  ),
                  title: Text(post.author),
                  subtitle: Text(post.caption),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.favorite_border, size: 18),
                      const SizedBox(width: 4),
                      Text('${post.likes}'),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    ),
  );
}
