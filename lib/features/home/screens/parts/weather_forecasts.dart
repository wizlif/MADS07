part of '../home_page.dart';

class WeatherForecastsList extends ConsumerWidget {
  const WeatherForecastsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastsSync = ref.watch(forecastControllerProvider);

    return forecastsSync.when(
      data: (forecasts) {
        final color = forecasts.first.first.state.color;
        return Scaffold(
          backgroundColor: color,
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: AppBarDelegate(
                  expandedHeight: 357,
                  secondaryColor: color,
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
