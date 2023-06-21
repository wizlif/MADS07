import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nssf_interview/core/controllers/color.controller.dart';
import 'package:nssf_interview/features/favorites/controllers/favorites.controller.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesRef = ref.watch(favoritesControllerProvider);

    final color = ref.watch(colorControllerProvider);

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: color,
      ),
      floatingActionButton: favoritesRef.maybeWhen(
        data: (data) {
          if (data.isEmpty) return const SizedBox.shrink();

          return FloatingActionButton(
            onPressed: () => context.push('/favorites-map', extra: data),
            foregroundColor: color,
            backgroundColor: Colors.white,
            child: const Icon(CupertinoIcons.map),
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),
      body: Column(
        children: [
          const Divider(color: Colors.white),
          Expanded(
            child: favoritesRef.when(
              data: (favorites) {
                if (favorites.isEmpty) {
                  return const Center(
                    child: Text('No Favorites'),
                  );
                }

                return ListView.separated(
                  itemBuilder: (context, index) {
                    final geoInfo = favorites[index];
                    return ListTile(
                      title: Text(geoInfo.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${geoInfo.lat}, ${geoInfo.lat}'),
                          Text(geoInfo.country),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: favorites.length,
                );
              },
              error: (error, stack) => Center(
                child: Text(error.toString()),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
