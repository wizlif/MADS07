part of '../home_page.dart';

class WeatherForrecastsList extends ConsumerWidget {
  const WeatherForrecastsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastsSync = ref.watch(forecastControllerProvider);

    return forecastsSync.when(
      data: (forecasts) {
        return Scaffold(
          backgroundColor: const Color(0xFF498FE1),
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: AppBarDelegate(
                  expandedHeight: 250,
                  secondaryColor: const Color(0xFF498FE1),
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: forecasts.length - 1,
                  (context, index) {
                    final forecast = forecasts[index + 1].first;
                    return ForecastTile(forecast: forecast);
                  },
                ),
              )
            ],
          ),
        );
      },
      error: (error, stack) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
