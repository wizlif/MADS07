part of '../home_page.dart';

class LikeButton extends ConsumerWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(isLikedProvider);

    return IconButton(
      onPressed: () {
        final geoInfo =
            ref.read(currentGeoInfoControllerProvider).fold(() => null, id);

        if (geoInfo == null) return;

        if (!isFavorite) {
          ref
              .read(addToFavoritesControllerProvider.notifier)
              .markAsFavorite(geoInfo);
        } else {
          ref
              .read(removeFromFavoritesControllerProvider.notifier)
              .removeFavorite(geoInfo);
        }
      },
      color: Colors.white,
      icon: Icon(
        isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
      ),
    );
  }
}

// isLikedSync.maybeWhen(
//         data: (isLiked) {
//           if (isLiked) {
//             return const Icon(CupertinoIcons.heart_fill);
//           }

//           return const Icon(CupertinoIcons.heart);
//         },
//         orElse: () => const Icon(CupertinoIcons.heart),
//       )
