part of '../home_page.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Color secondaryColor;

  AppBarDelegate({
    required this.expandedHeight,
    required this.secondaryColor,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final currentWeatherSync = ref.watch(weatherControllerProvider);

        return currentWeatherSync.when(
          data: (forecast) {
            return Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                ColoredBox(color: forecast.color),
                if (shrinkOffset < 100) ...[
                  AppbarHeader(
                    color: secondaryColor,
                    weather: forecast,
                  ),
                ] else
                  AppBar(
                    elevation: 0,
                    backgroundColor: forecast.color,
                  ),
              ],
            );
          },
          error: (error, stack) {
            return AppBar(title: Text(error.toString()));
          },
          loading: () {
            return AppBar(title: const Text('Loading ...'));
          },
        );
      },
    );
  }

  @override
  double get maxExtent => expandedHeight + kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
