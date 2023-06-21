part of '../home_page.dart';

class WeatherForecastsList extends ConsumerWidget {
  const WeatherForecastsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastsSync = ref.watch(forecastControllerProvider);

    return forecastsSync.when(
      data: (forecasts) {
        return Scaffold(
          backgroundColor: forecasts.color,
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: AppBarDelegate(
                  expandedHeight: 357,
                  secondaryColor: forecasts.color,
                ),
                pinned: true,
              ),
              ForecastsList(forecasts: forecasts),
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
